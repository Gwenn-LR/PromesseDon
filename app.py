from flask import Flask, render_template, request
import data

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/don")
def don():
    return render_template("don.html")


@app.route("/validation", methods = ["POST"])
def validation():
    nom = request.values.get("nom")
    prenom = request.values.get("prenom")
    mail = request.values.get("mail")
    adresse = request.values.get("adresse")
    montant = request.values.get("montant")

    data.setUtilisateur(nom, prenom, mail, adresse)
    data.setDon(nom, prenom, montant)

    dons = data.getDons()

    return render_template("validation.html", dons = dons)

@app.route("/bilan")
def bilan():
    dons = data.getDons()
    montantTotal = data.getDonTotal(dons)
    return render_template("bilan.html", dons = dons, montantTotal = montantTotal)

if __name__ == "__main__":
    app.run(debug=True)