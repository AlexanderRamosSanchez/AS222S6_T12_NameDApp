// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// @title Simulador de Transacción
// @author Juan Condori :D
// @notice Este contrato permite simular una transacción entre direcciones

contract Transaction {
    
    // @notice Envía una transacción a la dirección especificada
    // @param _recipient La dirección del destinatario
    // @param _amount La cantidad de Ether a enviar
    function sendTransaction(address payable _recipient, uint256 _amount) public payable {
        // Verifica que la cantidad a enviar sea mayor que cero
        require(_amount > 0, "La cantidad debe ser mayor que cero");
        
        // Verifica que el contrato tenga suficiente saldo
        require(address(this).balance >= _amount, "Saldo insuficiente en el contrato");

        // Envía la cantidad especificada al destinatario
        _recipient.transfer(_amount);
    }

    // @notice Permite al contrato recibir Ether
    receive() external payable {}
}
