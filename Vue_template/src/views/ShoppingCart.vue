<template>
    <div>
        <NavBar />
        <div>
            <div v-for="(item, index) in items" :key="item.id">
                <img :src="item.img" />
                <p>{{ item.name }}</p>
                <p>{{ item.price }}</p>
                <button @click="removeItem(index)" class="removeItemBtn">Remover</button>
            </div>
            <div>
                <div>{{ totalPrice }}</div>
                <button @click="clearCart">Limpar Carrinho</button>
            </div>
            
        </div>
    </div>
</template>

<script setup lang="ts">
    import NavBar from '@/components/NavBar.vue';
    import { useCartStore } from '../stores/counter'

    const products = useCartStore();
    const removeItem = products.removeFromCart
    const items = products.detailedItems
    const totalPrice = products.totalPrice
    const clearCart = products.clearCart
</script>