for n in $(kubectl get -o=name pvc,configmap,serviceaccount,secret,ingress,service,deployment,statefulset,hpa,job,cronjob)

do

    mkdir -p $(dirname $n)

    #kubectl get -o=json

    kubectl get $n -o=json | jq 'del(.metadata.resourceVersion,.metadata.uid,.metadata.selfLink,.metadata.creationTimestamp,.metadata.annotations,.metadata.generation,.metadata.ownerReferences,.status)' | yq eval . --prettyPrint >$n

    #kubectl get -o=yaml $n > $n.yaml

done
