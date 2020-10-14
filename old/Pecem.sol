pragma solidity 0.5.16;

contract Pecem {
    address public pecem = msg.sender;
    uint public last_completed_migration;

    //negócio
    string nome_obra;
    string tipo_obra;
    int area_obra;
    string estado_obra;
    int valor;
    
    struct Notas_fiscais_obra {
        string id_nf;
        string nome_fornecedor;
        string unidade;
        int quantidade;
        uint data_nf;
        bool estado_nf;
    }

    struct Registro_Imovel {
        string id_registro;
        string nome_comprador;
        string unidade;
        int valor_imovel;
        uint data_nf;
        bool registo_ativo;
    }

    struct Proposta_Imovel {
        string id_proposta;
        string nome_comprador;
        int valor_proposta;
        uint data_nf;
        int16 estado_proposta;
    }

    Notas_fiscais_obra[] public notas;
    Registro_Imovel[] public registros;
    Proposta_Imovel[] public propostas;

    // eventos são a porta de comunicação com o mundo exterior
    //verificar como eu vou fazer esta transferência: se em moedas ouapenas em texto (setDono)
    //aqui é para transferir valores
    event Sent(address from, address to, uint amount);

    event Add_Obra(string nome, string tipo);
    event Add_NotaFiscal(string nome_obra, string id_not, int valor, string data);
    event Add_RegistroImovel(string nome_obra, string id_reg, int valor, string data, string fornecedor);
    event Add_PropostaImovel(string nome_obra, string id_prop, int valor, string data, string proponente);

    //inicializador do contrato: o que fazer quando ele é publicado
    constructor() public{
        minter = msg.sender; // para dizer quem é o dono do contrato Pecem - seria a conta do Pecem
        // Aqui eu poderia colocar alguns valores iniciais
    }

    function set_Obra(string nome, string tipo, int area, int valor, string estado) public{
        //constraints: require faz uma validação nos parâmetros do smart contract

        string public nome_obra;
        string public tipo_obra;
        int public area_obra;
        string public estado_obra;
    }

}