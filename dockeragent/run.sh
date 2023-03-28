docker run -e AZP_URL="https://dev.azure.com/jHernandez-Dev" -e AZP_TOKEN="eqcjhaz2qn2xcgpkyl2i3jgvyjltvnxlafyizexhf4hnduzzegda" dockeragent:latest
kubectl create secret docker-registry jmhhacr-key --docker-server="jmhhcontainerregistry.azurecr.io" --docker-username="jmhhcontainerregistry" --docker-password="YUpQ44BDrwr5A7XwwChNHgNBlw/kFvroro9VRi88Pk+ACRBS8kPl"
