<!-- src/views/ProdutoDetalhe.vue -->
<template>
  <div>
    <NavBar />
    <div class="screanProductUni" v-if="data">
      <div class="uniProduct">
        <div class="containerImgProduct">
          <img class="imgsProductsUni" :src="`../../src/assets/imgsProducts/${data.imgs}`">
        </div>
        <div class="informationsPriceProduct">
          <h1>{{ data?.name }}</h1>
          <p class="price">R${{ data?.price }}.00</p>
          <p>até 3X de R${{ (data?.price / 3).toFixed(2) }}</p>
          <div class="shippingFor"><p>vendido e entregue Por</p><p class="shippingCompany">B-commerce</p></div>
          <div class="btnsBuyAddCart">
            <button class="btcBuyUni">Comprar</button>
            <button class="addCartProductInProduct" @click.prevent="addCartStore(data)">
              <img src="../../assets/imgs/shoppingCartBlack.png">
            </button>
          </div>
        </div>
      </div>
      <div class="infomationsBProducts">
        <div v-if="tipo === 'drink' ">
          <p>Tempo de envelhecimento: {{ data?.aging_time }}</p>
          <p>Sabores e Aromas: {{ data?.flavour }}</p>
          <p>Quantidade na garrafa{{ data?.amount }}</p>
          <p>Percentualo de alcool: {{ data?.alcohol_content }}</p>
        </div>
        <div v-else-if="tipo === 'console'">
          <p></p>
        </div>
        <div v-else-if="tipo === 'smartphone'">
          <p>Marca: {{ data.brand}}</p>
          <p>Camera: {{ data.camera }}px</p>
          <p>Peso: {{ data.peso }}g</p>
          <p>Armazenamento: {{ data.Capacidade }}gb</p>
          <p>Tela: {{ data.tela }}polegadas</p>
          <p>Processador {{ data.processador }}</p>
          <p>Bateria: {{ data.bateria }}</p>
        </div>
        <div v-else-if="tipo === 'food'">

        </div>
      </div>
      
      
      <!-- Coloque o resto dos detalhes do produto aqui -->
    </div>
    <div class="loadingProducts" v-else>
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
    imgs?: string;
    quantity: number;
    camera?: GLfloat; 
    bateria?: number;
    peso?: number;
    Capacidade?: number;
    tela?: string;
    processador?: string;
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
    imgs: product.imgs, // Adicione a URL da imagem do produto, se disponível
    quantity: 1 // Quantidade inicial ao adicionar ao carrinho
  });
};

  
  // Chamada da função fetchData, se necessário
  onMounted(() => {
    fetchData();
  });
</script>
  