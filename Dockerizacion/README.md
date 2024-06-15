Aplicación base obtenida del repositorio https://github.com/stemdo-labs/concert-app-tickets

docker build -t dboffelli/concert-app:1.0 .
 
docker network create -d bridge concert-network
 
docker run --name mysql -e MYSQL_ROOT_PASSWORD=1234 -e MYSQL_DATABASE=concierto --network concert-network -d mysql
 
docker run --name phpmyadmin -d --link mysql:db --network concert-network -p 8080:80 phpmyadmin
 
docker run --name concert -p 8081:80 --network concert-network -d -e DB_DATABASE_HOST=mysql -e DB_DATABASE_USER=root -e DB_DATABASE_PASSWORD=1234 -e DB_DATABASE=concierto dboffelli/concert-app:1.0


