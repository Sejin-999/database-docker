CREATE USER 'nctest'@'%' IDENTIFIED BY 'nctestpass!';
GRANT ALL PRIVILEGES ON mydatabase.* TO 'nctest'@'%';
FLUSH PRIVILEGES