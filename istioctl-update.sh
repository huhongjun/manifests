######## update yaml #############

export MANIFESTS_SRC=${PWD} && echo " --> MANIFESTS_SRC=$MANIFESTS_SRC"
# export ISTIO_OLD=$MANIFESTS_SRC/common/istio-1-9-0
export ISTIO_NEW=$MANIFESTS_SRC/common/istio-1-9-0
# cp -a $ISTIO_OLD $ISTIO_NEW

export PATH="$ISTIO_NEW:$PATH"
cd $ISTIO_NEW
istioctl manifest generate -f profile.yaml -f profile-overlay.yaml > dump.yaml

pip install ruamel.yaml==0.17.1 -q
python3 split-istio-packages -f dump.yaml
rm dump.yaml

mv $ISTIO_NEW/crd.yaml $ISTIO_NEW/istio-crds/base
mv $ISTIO_NEW/install.yaml $ISTIO_NEW/istio-install/base
mv $ISTIO_NEW/cluster-local-gateway.yaml $ISTIO_NEW/cluster-local-gateway/base

echo " --> istio update done!"