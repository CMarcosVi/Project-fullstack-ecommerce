<!-- src/views/ProdutoDetalhe.vue -->
<template>
  <div>
    <NavBar />
    <div v-if="data">
      <h1>{{ data?.name }}</h1>
      <div>
        <div>
          <img src="" alt="">
        </div>
        <div>
          <p>R${{ data?.price }}.00</p>
          <p>até 3X de {{ (data?.price / 3).toFixed(2) }}</p>
          <div>vendido e entregue Por <p>B-commerce</p></div>
          <button class="addCartProductInProduct" @click.prevent="addCartStore(data)">
              <img src="../../assets/imgs/shoppingCartBlack.png">
          </button>
        </div>
      </div>
      <div>
        <p>Tempo de envelhecimento: {{ data?.aging_time }}</p>
        <p>Sabores e Aromas: {{ data?.flavour }}</p>
        <p>Quantidade na garrafa{{ data?.amount }}</p>
        <p>Percentualo de alcool: {{ data?.alcohol_content }}</p>
      </div>
      
      <!-- Coloque o resto dos detalhes do produto aqui -->
    </div>
    <div v-else>
      Carregando dados...
    </div>
  </div>
</template>
  
<script setup lang="ts">
  import { defineProps, onMounted, ref, Ref } from 'vue';
  import NavBar from '@/components/NavBar.vue';
  import {useCartStore} from "../../stores/counter"

  const props = defineProps<{ id: string; tipo: string; }>();
  const cartStore = useCartStore();

  interface ProductData {
    id: number;
    name: string;
    flavour?: string;
    aging_time?: number;
    amount?: number;
    alcohol_content?: number;
    brand: string;
    price: number;
    imgs: string; // Adicionar img como string, se disponível
    quantity: number; // Adicionar quantity como número
  }


  const data: Ref<ProductData | null> = ref(null);
  
  async function fetchData() {
    const { tipo, id } = props;
    let url = '';

    // Determinar a URL com base no tipo
    switch (tipo) {
      case 'drink':
        url = `http://localhost:3000/drinksListProducts/${id}`;
        break;
      case 'food':
        url = `http://localhost:3000/foodsListProducts/${id}`;
        break;
      case 'console':
        url = `http://localhost:3000/gamesAndConsolesListProducts/${id}`;
        break;
      case 'smartphone':
        url = `http://localhost:3000/smartPhonesListProducts/${id}`;
        break;
      // Adicionar mais casos conforme necessário
      default:
        throw new Error(`Tipo '${tipo}' não é suportado.`);
    }
    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`Erro ao fazer requisição: ${response.status}`);
      }
      const fetchedData = await response.json();
      // Aqui você pode manipular os dados obtidos conforme necessário
      console.log('Dados obtidos:', data);
      data.value = fetchedData.products // Retorna os dados obtidos da API
    } catch (error) {
      console.error('Erro ao obter dados:', error);
      // Tratar o erro conforme necessário (ex.: retornar um erro, lançar exceção, etc.)
      throw error;
    }
  }
  const addCartStore = (product: ProductData) => {
  cartStore.addCart({
    id: product.id,
    name: product.name,
    price: product.price,
    imgs: '', // Adicione a URL da imagem do produto, se disponível
    quantity: 1 // Quantidade inicial ao adicionar ao carrinho
  });
};

  
  // Chamada da função fetchData, se necessário
  onMounted(() => {
    fetchData();
  });
</script>
  