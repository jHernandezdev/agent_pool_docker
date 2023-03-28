docker run -e AZP_URL="https://dev.azure.com/jHernandez-Dev" -e AZP_TOKEN="eqcjhaz2qn2xcgpkyl2i3jgvyjltvnxlafyizexhf4hnduzzegda" dockeragent:latest

kubectl create secret docker-registry jmhhacr-key --docker-server="jmhhcontainerregistry.azurecr.io" --docker-username="jmhhcontainerregistry" --docker-password="YUpQ44BDrwr5A7XwwChNHgNBlw/kFvroro9VRi88Pk+ACRBS8kPl"

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssWord1" -p 1433:1433 --name sql1 --hostname sql1 -d  mcr.microsoft.com/mssql/server:2022-latest