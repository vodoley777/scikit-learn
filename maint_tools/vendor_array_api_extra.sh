#!/bin/bash

# Vendors https://github.com/data-apis/array-api-extra/ into sklearn/externals

VERSION="0.3.1"
URL="https://files.pythonhosted.org/packages/b1/2c/e19c8a07f92635d60b5840387dbe91559f0f582f67214b356b769f7b1b4b/array_api_extra-0.3.1.tar.gz"
ROOT_DIR=sklearn/externals/_array_api_extra

rm -rf $ROOT_DIR/*

curl -s -L $URL |
    tar xvz --strip-components=1 -C sklearn/externals/_array_api_extra \
        array_api_extra-$VERSION/src/array_api_extra/__init__.py \
        array_api_extra-$VERSION/src/array_api_extra/_funcs.py \
        array_api_extra-$VERSION/src/array_api_extra/py.typed \
        array_api_extra-$VERSION/src/array_api_extra/_lib/_compat.py \
        array_api_extra-$VERSION/src/array_api_extra/_lib/_typing.py \
        array_api_extra-$VERSION/src/array_api_extra/_lib/_utils.py \
        array_api_extra-$VERSION/LICENSE

mv $ROOT_DIR/src/array_api_extra $ROOT_DIR

echo "Update this directory using maint_tools/vendor_array_api_extra.sh" >$ROOT_DIR/README.md