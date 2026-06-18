#!/bin/bash
# Levantar el nodo local Anvil aceptando conexiones externas
anvil --host 0.0.0.0 --port 8545 &
solana-test-validator --rpc-port 8899 --faucet-port 9900 --bind-address 0.0.0.0 --quiet &
# Iniciar el puente Remixd apuntando a la carpeta de tu proyecto
remixd -s /workspace --remix-ide https://remix.ethereum.org &

echo "🚀 ¡Entorno Web3 Activo!"
echo "Anvil corriendo en el puerto 8545"
echo "Solana corriendo RCP 8899 y Factuet 9900"
echo "Remixd conectado y listo en el puerto 65520"

# Mantener el script vivo
wait

