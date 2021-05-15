## Sábado 15 maio 2021

# Construndo a Image

docker build -t boiler-original . 

# Execução simples


docker run --name boiler-original boiler-original


# Execução com LOG simples

docker run -e "ACCEPT_EULA=Y"  -e "MSSQL_PID=Express" -p 1433:1433 -p 5555:80  --name boiler-original boiler-original > saida

Para consultar em 

http://localhost:5555/identity/account/register

Uma segunda etapa da dockerização será carregar os dados necesarios para testar o sistema

