function hallogs
  kubectl logs -f -c hal (kubectl get pods | grep hal | cut -d " " -f1)
end;
