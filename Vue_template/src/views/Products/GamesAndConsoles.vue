<template>
    <div>
      <NavBar />
      <div class="productsList">
        <div class="productItem" v-for="(item, index) in products" :key="index" >
            <img class="imgsProductsHome" :src="`../../src/assets/imgsProducts/${item.imgs}`">
            <p>{{ item.name }}</p>
            <p>R${{ item.price }}.00</p>
            <div class="btnsCardRedirect">
              <!-- Use RouterLink para navegação -->
              <RouterLink class="btcRedirectLink" v-if="item.id" :to="{ name: 'Product', params: { tipo: item.type || '', id: item.id.toString() } }">Comprar</RouterLink>
              <!-- Botão para adicionar ao carrinho -->
              <button class="addCartProductBtn" @click.prevent="addProductToCart(item)"></button>
          </div>
          </div>  
      </div>
    </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'; // Importa ref e onMounted do Vue 3
import NavBar from '@/components/NavBar.vue';
import axios from 'axios';
import {useCartStore} from "../../stores/counter"

// Define uma variável reativa para armazenar os produtos
const products = ref<{ id: number; name: string; imgs: string; type: string; price: number; quantity: number; }[]>([]);
const cartStore = useCartStore();

// Função para buscar os dados
const fetchData = async () => {
  try {
    const response = await axios.get('http://localhost:3000/gamesAndConsolesListProducts');
    products.value = response.data.products; // Atualiza a variável reativa com os produtos recebidos
  } catch (err) {
    console.error(err);
  }
};

const addProductToCart = (product: {
  id: number;
  name: string;
  imgs: string;
  type: string;
  price: number;
  quantity: number;
}) => {
  const itemToAdd = {
    ...product,
    type: 'console',
    quantity: 1 // Definindo a quantidade padrão como 1
  };
  cartStore.addCart(itemToAdd); // Adiciona o item ao carrinho
};
// Chama fetchData quando o componente é montado
onMounted(() => {
  fetchData();
});
</script>
