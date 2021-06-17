# README dev

## install

### install istio

    ISTIO_VERSION="1.9.0"
    wget "https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux-amd64.tar.gz"
    tar xvfz istio-${ISTIO_VERSION}-linux-amd64.tar.gz
    sudo mv istio-${ISTIO_VERSION}/bin/istioctl /usr/local/bin/istioctl
    #istioctl profile dump demo > profile.yaml

## config

    //modify common/istio-1.9.0/profile.yaml
    ./istioctl-update.sh

## install kuflow

    while ! kustomize build example | kubectl apply -f -; do echo "Retrying to apply resources"; sleep 10; done
    while ! kustomize build example | kubectl apply -f -; do echo "Retrying to apply resources"; sleep 10; done

## quick start

    kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80
    http://localhost:8080 , user@example.com , 12341234

## other

https -> Kubeflow distributions

kustomize build example --load_restrictor=none > kustomize-export.yaml

cd example
python3 doGenerate.py
python3 doReplace.py
python3 pre-install.py

kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}"
kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' |\
sort
