// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract RutaBasico {
    address propietario;
    //uint256 public edad;

    constructor() {
       propietario = msg.sender;
       
    }

    function getPropietario() public view returns (address) {
        return propietario;
    }

    function esPrimo(uint n) public pure returns (bool){
        require(n > 1, 'El Numero es mayor que 1');
        if (n==2){
            return true;
        }

        for (uint i = 3; i * i <= n; i += 2){
            if (n % i == 0){
                return false;
            }
        }
        return false;
    }

    string private testNombre;

    function setNombre(string memory _nombre) public  {
        testNombre = _nombre;
    }

    function getNombre() public  view  returns (string memory) {
        return testNombre;
    }


}
