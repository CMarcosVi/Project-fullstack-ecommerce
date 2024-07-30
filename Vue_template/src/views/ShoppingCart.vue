<template>
    <div>
        <NavBar />
        <div class="Cart">
            <div class="productCart" v-for="(item, index) in state.items" :key="item.id">
                <img class="imgProductCart" :src="`../../src/assets/imgsProducts/${item.imgs}`" />
                <p class="nameCart" >{{ item.name }}</p>
                <p class="priceCart">${{ item.price }}.00</p>
                <button @click="removeItem(index)" class="removeItemBtn">Remover</button>
            </div>
            <div class="totalPriceArea">
                <p class="totalPriceTitle">Preço total</p>
                <div class="totalPriceCart">R${{ totalPrice }}.00</div>
                <button @click="clearCartAndUpdate" class="btnClearCart">Limpar Carrinho</button>
            </div>      
        </div>
    </div>
</template>

<script setup lang="ts">
    import {reactive} from 'vue';
    import NavBar from '@/components/NavBar.vue';
    import { useCartStore } from '../stores/counter'
    const products = useCartStore();
    const removeItem = products.removeFromCart
    const items = products.detailedItems
    const totalPrice = products.totalPrice 
    console.log(localStorage)
    const clearCartAndUpdate = () => {
        const products = useCartStore();
        products.detailedItems
        products.clearCart();
        products.gettingValuesStorange(); // Call additional method if needed
    };
    const state = reactive({
        items: items,
    });
</script>