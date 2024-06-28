<template>
    <div>
      <NavBar />
      <div>
        <div v-for="(item, index) in products" :key="index">
          <p>{{ item.name }}</p>
  
          <!-- Aqui você pode adicionar mais conteúdo conforme necessário -->
        </div>
      </div>
    </div>
</template>
  
<script setup lang="ts">
  import { ref, onMounted } from 'vue'; // Importa ref e onMounted do Vue 3
  import NavBar from '@/components/NavBar.vue';
  import axios from 'axios';
  
  // Define uma variável reativa para armazenar os produtos
  const products = ref<{ name: string }[]>([]);
  
  // Função para buscar os dados
  const fetchData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/drinksListProducts');
      products.value = response.data.products; // Atualiza a variável reativa com os produtos recebidos
    } catch (err) {
      console.error(err);
    }
  };
  
  // Chama fetchData quando o componente é montado
  onMounted(() => {
    fetchData();
  });
</script>
  