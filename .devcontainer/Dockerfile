FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

# 1. Instalar dependencias del sistema indispensables para compilar Rust, Solidity y Solana
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libssl-dev \
    pkg-config \
    libudev-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER vscode
WORKDIR /workspace

# 2. ENTORNO ETHEREUM: Instalar Node.js, Remixd y librerías base
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - \
    && sudo apt-get install -y nodejs \
    && sudo npm install -g @remix-project/remixd \
    && mkdir -p /home/vscode/project/node_modules \
    && cd /home/vscode/project && npm install @openzeppelin/contracts

# 3. ENTORNO ETHEREUM: Instalar Foundry (Forge/Anvil)
RUN curl -L https://foundry.paradigm.xyz | bash \
    && /home/vscode/.foundry/bin/foundryup

# 4. ENTORNO SOLANA: Instalar Rust de forma no interactiva
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Configurar temporalmente el PATH para que las siguientes instalaciones detecten Rust
ENV PATH="/home/vscode/.cargo/bin:${PATH}"

# 5. ENTORNO SOLANA: Instalar Solana CLI (Versión estable)
RUN sh -c "$(curl -sSfL https://release.solana.com/v1.18.4/install)"
ENV PATH="/home/vscode/.local/share/solana/install/active_release/bin:${PATH}"

# 6. ENTORNO SOLANA: Instalar Anchor CLI usando AVM (Anchor Version Manager)
RUN cargo install --git https://github.com/coral-xyz/anchor avm --locked --force \
    && /home/vscode/.cargo/bin/avm install latest \
    && /home/vscode/.cargo/bin/avm use latest

# 7. EXPORTAR TODOS LOS PATHS DEFINITIVOS
ENV PATH="/home/vscode/.foundry/bin:/home/vscode/.cargo/bin:/home/vscode/.local/share/solana/install/active_release/bin:${PATH}"
