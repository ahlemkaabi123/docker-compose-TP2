CREATE DATABASE IF NOT EXISTS tp2;
USE tp2;

CREATE TABLE IF NOT EXISTS Fournisseur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    adresse VARCHAR(200),
    telephone VARCHAR(20),
    email VARCHAR(100),
    pays VARCHAR(50)
);

INSERT INTO Fournisseur (nom, adresse, telephone, email, pays)
VALUES 
('TechPlus', 'Avenue Habib Bourguiba, Tunis', '22123456', 'contact@techplus.tn', 'Tunisie'),
('GlobalTrade', 'Rue de Paris, Sousse', '29567890', 'info@globaltrade.com', 'France');
