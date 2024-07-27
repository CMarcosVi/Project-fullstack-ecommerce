<template>
    <header>
        <nav class="">
            <div>
                <img  class="logo" src="../assets/imgs/b2.png" alt="">
            </div>
            <div class="createLoginNav">
                <RouterLink to="/CreateAcc" class="btnCreateAccount">Create</RouterLink>
                <RouterLink to="/loginView" class="btnLoginAccount"></RouterLink>
                <RouterLink to="/ShoppingCart" class="btnShoppingCart"></RouterLink>
            </div>
        </nav>
        <div class="navBarProducts">
            <RouterLink to="/" class="productsLinks">Inicio</RouterLink>
            <!--<RouterLink to="/OffersProducts" class="productsLinks">Ofertas</RouterLink> -->
            <RouterLink to="/GamesAndConsoles" class="productsLinks">Games e console</RouterLink>
             <!--<RouterLink to="/ComputersProducts" class="productsLinks">Computadores</RouterLink> -->
            <RouterLink to="/SmartPhonesProducts" class="productsLinks">Celulares</RouterLink>
            <RouterLink to="/FoodsProducts" class="productsLinks">Alimentos</RouterLink>
             <!--<RouterLink to="/KitchenProducts" class="productsLinks">Cozinha</RouterLink> -->
            <RouterLink to="/DrinksProducts" class="productsLinks">Bebidas</RouterLink>
        </div>
    </header>
</template>