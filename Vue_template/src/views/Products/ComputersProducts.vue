<template>
  <div>
    <NavBar />
    <div>
      <div v-for="(item, index) in products" :key="index">
        <img :src=item.img>
        <p>{{ item.name }}</p>
        <p>{{ item.price }}</p>
        <div>
          <RouterLink :to="{ name: 'ProdutoDetalhe', params: { tipo: item.type || '', id: item.id.toString() } }">Comprar</RouterLink>
          <button class="addCartProduct" @click.prevent="addCartStore(item)">
            <img src="../../assets/imgs/shoppingCartBlack.png" alt="botão adicionar ao carrinho">
          </button>
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
const products = ref<{ id: number; name: string; img: string; type?: string; price: number; quantity: number; }[]>([]);
const cartStore = useCartStore();

// Função para buscar os dados
const fetchData = async () => {
  try {
    const response = await axios.get('http://localhost:3000/computersListProducts');
    products.value = response.data.products; // Atualiza a variável reativa com os produtos recebidos
  } catch (err) {
    console.error(err);
  }
};

const addCartStore = (item : { id: number; name: string; img: string; type?: string; price: number; quantity: number; }) => {
  cartStore.addCart({type: 'computers', ...item});
}
// Chama fetchData quando o componente é montado
onMounted(() => {
  fetchData();
});
</script>
