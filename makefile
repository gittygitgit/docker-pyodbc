all:
	sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=GrUdKoWsKi13' \
   -p 1401:1433 --name sql1 \
   -d microsoft/mssql-server-linux:2017-latest

dockerbuild:
	docker build -t pyodbc .

dockerrun2:
	docker run \
   --name pyodbc \
   -dit pyodbc:latest /bin/bash

dockerbash:
	docker exec -it pyodbc /bin/bash
	
hello:
	echo "hello"

