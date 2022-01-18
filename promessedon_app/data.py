import mysql.connector as msc

bdd = None
cursor = None

def connexionBDD():
    global bdd
    global cursor

    bdd = msc.connect(user="ISEN", password="ISEN", host="localhost", port=8081, database="promessedon")
    cursor = bdd.cursor()

def deconnexionBDD():
    global bdd
    global cursor

    cursor.close()
    bdd.close()

def getDons():
    global cursor

    connexionBDD()
    requete = "SELECT nom, prenom, mail, montant FROM dons JOIN utilisateurs ON dons.id_utilisateur=utilisateurs.id_utilisateur;"
    cursor.execute(requete)

    dons = []

    for ligne in cursor:
        don = {}
        don["nom"] = ligne[0]
        don["prenom"] = ligne[1]
        don["mail"] = ligne[2]
        don["montant"] = ligne[3]
        dons.append(don)

    return dons

def getDonTotal(dons):
    donTotal = 0
    for don in dons:
        donTotal += don["montant"]

    return donTotal

def getUtilisateurId(nom, prenom):
    global cursor

    connexionBDD()
    requete = "SELECT id_utilisateur FROM utilisateurs WHERE nom='"+nom+"' AND prenom='"+prenom+"';"
    cursor.execute(requete)

    id_utilisateur = 0

    for ligne in cursor:
        id_utilisateur = ligne[0]

    return id_utilisateur

def setDon(nom, prenom, montant):
    global bdd
    global cursor

    connexionBDD()

    id = getUtilisateurId(nom, prenom)

    requete = "INSERT INTO dons(montant, id_utilisateur) VALUES ('"+str(montant)+"', '"+str(id)+"');"
    cursor.execute(requete)
    bdd.commit()


def setUtilisateur(nom, prenom, adresse, mail):
    global bdd
    global cursor

    connexionBDD()

    id = getUtilisateurId(nom, prenom)

    requete = "INSERT INTO utilisateurs(nom, prenom, adresse, mail) VALUES ('"+nom+"', '"+prenom+"', '"+adresse+"', '"+mail+"');"
    cursor.execute(requete)
    bdd.commit()

    deconnexionBDD()