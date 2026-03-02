<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp" />

<style>
    body { background-color: #f4f7f6; }
    .invoice-card {
        background: #fff;
        border: none;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        position: relative;
    }
    .invoice-header {
        background: linear-gradient(135deg, #0d6efd 0%, #0a58ca 100%);
        color: white;
        padding: 40px;
        border-radius: 15px 15px 0 0;
    }
    .status-ribbon {
        position: absolute;
        top: 0;
        right: 0;
        background: #28a745;
        color: white;
        padding: 8px 30px;
        transform: rotate(45deg) translate(30px, -20px);
        font-weight: bold;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }
    .table thead th {
        background-color: #f8f9fa;
        border-bottom: 2px solid #dee2e6;
        color: #495057;
        text-transform: uppercase;
        font-size: 0.85rem;
        letter-spacing: 1px;
    }
    .total-section {
        background-color: #f8f9fa;
        padding: 20px;
        border-radius: 10px;
    }
    @media print {
        .btn-print-group { display: none; }
        body { background: white; }
        .invoice-card { box-shadow: none; }
    }
</style>

<div class="container my-5">
    <div class="d-flex justify-content-end gap-2 mb-4 btn-print-group">
        <button class="btn btn-outline-primary" onclick="window.print()">
            <i class="bi bi-download"></i> Télécharger PDF
        </button>
        <button class="btn btn-primary" onclick="window.print()">
            <i class="bi bi-printer"></i> Imprimer
        </button>
    </div>

    <div class="card invoice-card">
        <div class="status-ribbon">PAYÉE</div>

        <div class="invoice-header">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h2 class="fw-bold mb-0">MINI-ERP <span class="fw-light">SYSTEM</span></h2>
                    <p class="mb-0 opacity-75">Solution de Gestion Commerciale</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <h1 class="display-6 mb-0 text-uppercase">Facture</h1>
                    <p class="mb-0">Référence N° : ${commande.id}</p>
                </div>
            </div>
        </div>

        <div class="card-body p-5">
            <div class="row mb-5">
                <div class="col-md-4">
                    <p class="text-muted mb-1 text-uppercase small fw-bold">Émetteur</p>
                    <h5 class="fw-bold">Mini-ERP S.A.S</h5>
                    <p class="text-muted">
                        Technopole de l'Innovation<br>
                        Bureau 402, 75008 Paris<br>
                        SIRET: 123 456 789 00012
                    </p>
                </div>
                <div class="col-md-4">
                    <p class="text-muted mb-1 text-uppercase small fw-bold">Client</p>
                    <h5 class="fw-bold text-primary">${commande.nomClient}</h5>
                    <p class="text-muted">
                        SARL Distribution Plus<br>
                        45 Avenue des Champs<br>
                        69002 Lyon, France
                    </p>
                </div>
                <div class="col-md-4 text-md-end">
                    <p class="text-muted mb-1 text-uppercase small fw-bold">Détails</p>
                    <p class="mb-0"><strong>Date :</strong> ${commande.dateHeure}</p>
                    <p class="mb-0"><strong>Vendeur:</strong> ${commande.user.nom}</p>
                </div>
            </div>

            <div class="table-responsive mb-4">
                <table class="table align-middle">
                    <thead>
                        <tr>
                            <th style="width: 50%">Désignation de l'article</th>
                            <th class="text-center">Prix Unitaire</th>
                            <th class="text-center">Quantité</th>
                            <th class="text-end">Montant HT</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="a" items="${articles}">
                        <tr>
                            <td>
                                <h6 class="mb-0 fw-bold">${a.produit.nomProduit}</h6>
                            </td>
                            <td class="text-center">${a.produit.prixUnite} Ar</td>
                            <td class="text-center">${a.quantiteProduit}</td>
                            <td class="text-end fw-bold">${a.montantArticle} Ar</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="row">
                <div class="col-lg-5">
                    <div class="total-section">
                        <hr>
                        <div class="d-flex justify-content-between">
                            <h4 class="fw-bold text-dark">TOTAL TTC</h4>
                            <h4 class="fw-bold text-primary">${commande.montantTotal} Ar</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-footer bg-white p-4 border-top text-center text-muted small">
            <p class="mb-1">Mini-ERP S.A.S au capital de 10.000 € - RCS Paris B 123 456 789</p>
            <p class="mb-0">Merci pour votre achat ! Une question ? contact@minierp.com</p>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />