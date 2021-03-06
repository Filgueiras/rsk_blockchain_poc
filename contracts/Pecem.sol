pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

contract Pecem {
    string public nome_propriedade;
    string public mensagem;
    address public dono_contrato;

    struct Registro {
        string comprador;
        string vendedor;
        string data;
        string json_texto_registo;
        bool ativo;
    }

    struct NotaFiscal {
        string fornecedor;
        string item;
        string data;
        string json_texto_nota;
        bool ativo;
    }

    struct Proposta {
        string comprador;
        string vendedor;
        string data;
        string json_texto_proposta;
        string estado;
        bool ativo;
    }

    Registro[] public registros;
    NotaFiscal[] public notas;
    Proposta[] public propostas;

    constructor(string memory mensagemInicial, string memory nomeInicial) public {
        mensagem = mensagemInicial;
        nome_propriedade = nomeInicial;
        dono_contrato = msg.sender;
    }

    function atualizaMensagem(string memory novaMensagem) public {
        mensagem = novaMensagem;
    }

    function alteraNomePropriedade(string memory novoNome) public {
        nome_propriedade = novoNome;
    }

    function getMensagem() public view returns(string memory ret) {
        //const bytes32 varConv = mensagem;
        return mensagem;
    }

    function getNomePropriedade() public view returns(string memory ret) {
        //const bytes32 varConv = nome_propriedade;
        return nome_propriedade;
    }

    function insereNota(string memory _fornecedor, string memory _item, string memory _data, string memory _texto) public returns (uint){
        uint id_ret = notas.push(NotaFiscal(_fornecedor, _item,_data,_texto, true)) - 1;
        return id_ret;
    }

    function insereRegistro(string memory _comprador, string memory _vendedor, string memory _data, string memory _texto) public returns (uint){
        uint id_ret = registros.push(Registro(_comprador, _vendedor, _data, _texto, true)) - 1;
        return id_ret;
    }

    function insereProposta(string memory _comprador, string memory _vendedor, string memory _data, string memory _texto) public returns (uint){
        uint id_ret = propostas.push(Proposta(_comprador, _vendedor, _data, _texto, 'P', true)) - 1;
        return id_ret;
    }

    function rejeitarProposta(uint id_proposta) public{
        propostas[id_proposta].estado = 'R';
    }

    function aprovarProposta(uint id_proposta) public{
        propostas[id_proposta].estado = 'A';
        //inativar propostas não aprovadas e rejeitar... 
    }

    function _inativarProposta(uint id_proposta) private{
        propostas[id_proposta].ativo = false;
    }

    function _inativarNota(uint id_nota) private{
        notas[id_nota].ativo = false;
    }
    
    function getNotas() view public returns(NotaFiscal[] memory) {
        return notas;
    }
    
    function getRegistros() view public returns(Registro[] memory) {
        return registros;
    }
    
    function getPropostas() view public returns(Proposta[] memory) {
        return propostas;
    }
}