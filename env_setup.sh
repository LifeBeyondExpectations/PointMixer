#!/bin/sh
echo "[PM INFO] Installing cuda operations..."
cd sem_seg/lib/pointops2
python3 setup.py install
cd ../../..
echo "[PM INFO] Done !"