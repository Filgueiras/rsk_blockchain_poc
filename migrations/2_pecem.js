var Pecem = artifacts.require("Pecem");

module.exports = function(deployer){
    deployer.deploy(Pecem, "Ola, mundo", "Galpão Alpha Teste");
}