#!/bin/bash

echo "========================================================"
echo " 🛠️  ENTORNO DE DESARROLLO WEB3 (ETH & SOLANA) 🛠️"
echo "========================================================"

# 1. Iniciar siempre el puente de Remix para la gestión de archivos
echo "📦 Iniciando puente Remixd en el puerto 65520..."
remixd -s /workspace --remix-ide https://remix.ethereum.org > /dev/null 2>&1 &

echo ""
echo "Selecciona qué nodo de pruebas deseas levantar hoy:"
echo "1) Ethereum (Anvil Node - Puerto 8545)"
echo "2) Solana (Test Validator - Puerto 8899)"
echo "3) Ambos nodos a la vez (Requiere más recursos)"
echo "4) Solo herramientas de edición (Ningún nodo)"
read -p "Ingresa una opción [1-4]: " opcion

case $opcion in
    1)
        echo "🚀 Levantando nodo local de Ethereum (Anvil)..."
        anvil --host 0.0.0.0 --port 8545
        ;;
    2)
        echo "🚀 Levantando validador local de Solana..."
        # --rpc-port 8899 define el puerto de comunicación
        # --faucet-port 9900 permite solicitar SOL de prueba (airdrop)
        # --bind-address 0.0.0.0 permite conexiones externas desde tu móvil
        solana-test-validator --rpc-port 8899 --faucet-port 9900 --bind-address 0.0.0.0 --quiet
        ;;
    3)
        echo "🚀 Levantando AMBOS nodos (Ethereum + Solana)..."
        anvil --host 0.0.0.0 --port 8545 &
        solana-test-validator --rpc-port 8899 --faucet-port 9900 --bind-address 0.0.0.0 --quiet &
        wait
        ;;
    4)
        echo "📝 Solo herramientas activas. Listo para codificar."
        wait
        ;;
    *)
        echo "❌ Opción inválida. Iniciando solo puente Remixd por seguridad."
        wait
        ;;
esac
