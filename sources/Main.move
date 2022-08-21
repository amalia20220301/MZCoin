// sources/Main.move
script {

    use MZCoinAddr::MZCoin;
    use std::signer;
    use std::debug;

    fun main(account: signer, mint_addr: signer) {
        //Initialize account
        MZCoin::init_account(&account);
        MZCoin::init_account(&mint_addr);
        // mint
        MZCoin::mint(&account, signer::address_of(&mint_addr), 100);
        // balance
        let mintBalance = MZCoin::balance_of(signer::address_of(&mint_addr));
        debug::print(&mintBalance);
        // transfer
        MZCoin::transfer(&mint_addr, signer::address_of(&account), 50);

        // balance
        let accountBalance = MZCoin::balance_of(signer::address_of(&account));
        debug::print(&accountBalance);
        let mintNewBalance = MZCoin::balance_of(signer::address_of(&mint_addr));
        debug::print(&mintNewBalance);
    }
}
