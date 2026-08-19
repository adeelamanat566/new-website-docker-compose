from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
import os

app = Flask(__name__)

def get_db():
    return mysql.connector.connect(
        host=os.getenv("MYSQL_HOST", "sql"),
        user=os.getenv("MYSQL_USER", "root"),
        password=os.getenv("MYSQL_PASSWORD", "root"),
        database=os.getenv("MYSQL_DATABASE", "grocery_db")
    )

@app.route("/")
def index():
    db = get_db()
    cur = db.cursor(dictionary=True)
    cur.execute("""
        SELECT p.id, p.name, p.price, p.stock, c.name AS category
        FROM products p
        JOIN categories c ON p.category_id = c.id
        ORDER BY p.id DESC
    """)
    products = cur.fetchall()
    cur.close()
    db.close()
    return render_template("index.html", products=products)

@app.route("/products/add", methods=["GET", "POST"])
def add_product():
    db = get_db()
    cur = db.cursor(dictionary=True)

    if request.method == "POST":
        name = request.form["name"]
        price = request.form["price"]
        stock = request.form["stock"]
        category_id = request.form["category_id"]

        cur.execute(
            "INSERT INTO products (name, price, stock, category_id) VALUES (%s, %s, %s, %s)",
            (name, price, stock, category_id)
        )
        db.commit()
        cur.close()
        db.close()
        return redirect(url_for("index"))

    cur.execute("SELECT * FROM categories ORDER BY name")
    categories = cur.fetchall()
    cur.close()
    db.close()
    return render_template("add_product.html", categories=categories)

@app.route("/products/delete/<int:product_id>", methods=["POST"])
def delete_product(product_id):
    db = get_db()
    cur = db.cursor()
    cur.execute("DELETE FROM products WHERE id = %s", (product_id,))
    db.commit()
    cur.close()
    db.close()
    return redirect(url_for("index"))

@app.route("/customers")
def customers():
    db = get_db()
    cur = db.cursor(dictionary=True)
    cur.execute("SELECT * FROM customers ORDER BY id DESC")
    rows = cur.fetchall()
    cur.close()
    db.close()
    return render_template("customers.html", customers=rows)

@app.route("/orders")
def orders():
    db = get_db()
    cur = db.cursor(dictionary=True)
    cur.execute("""
        SELECT o.id, c.name AS customer, o.order_date, o.total_amount, o.status
        FROM orders o
        JOIN customers c ON o.customer_id = c.id
        ORDER BY o.id DESC
    """)
    rows = cur.fetchall()
    cur.close()
    db.close()
    return render_template("orders.html", orders=rows)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
