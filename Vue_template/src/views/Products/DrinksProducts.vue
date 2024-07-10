<template>
    <div>
      <NavBar />
      <div class="productsList" v-for="(item, index) in products" :key="index">
        <div class="product">
          <img :src=item.img>
          <p>{{ item.name }}</p>
          <p>{{ item.price }}</p>
          <div>
            <RouterLink class="btcRedirectLink" v-if="item.id" :to="{ name: 'Product', params: { tipo: item.type || '', id: item.id.toString() } }">Comprar</RouterLink>
            <button class="addCartProduct" @click.prevent="addCartStore(item)"></button>
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
      const response = await axios.get('http://localhost:3000/drinksListProducts');
      products.value = response.data.products; // Atualiza a variável reativa com os produtos recebidos
    } catch (err) {
      console.error(err);
    }
  };

  const addCartStore = (item : { id: number; name: string; img: string; type?: string; price: number; quantity: number; }) => {
    cartStore.addCart({...item});
  }
  // Chama fetchData quando o componente é montado
  onMounted(() => {
    fetchData();
  });
</script>
  