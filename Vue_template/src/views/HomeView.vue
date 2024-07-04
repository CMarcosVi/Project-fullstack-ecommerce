<script setup lang="ts">
import NavBar from '@/components/NavBar.vue';
import { ref, onMounted } from 'vue';
import axios, { AxiosResponse } from 'axios';

// Define tipos para os produtos e para os dados buscados
interface Product {
  id: number;
  name: string;
  img: string;
  type?: string;
  price: number;
  quantity: number;
}

const products = ref<Product[]>([]);
const fetchedData = ref<Product[][]>([]);

const urls: string[] = [
  'http://localhost:3000/computersListProducts',
  'http://localhost:3000/drinksListProducts',
  'http://localhost:3000/foodsListProducts',
  'http://localhost:3000/gamesAndConsolesListProducts',
  'http://localhost:3000/kitchenListProducts',
  'http://localhost:3000/smartPhonesListProducts'
];

const fetchData = async () => {
  try {
    const requests = urls.map(url => axios.get<Product[]>(url));
    const responses = await Promise.allSettled(requests);

    // Filtra apenas as respostas bem-sucedidas
    const successfulResponses = responses.filter(res => res.status === 'fulfilled') as PromiseFulfilledResult<AxiosResponse<Product[]>>[];

    // Mapeia cada resposta para pegar apenas os produtos e armazena em fetchedData
    fetchedData.value = successfulResponses.map(response => response.value.data);

    // Concatena todos os produtos de todas as respostas em um único array
    let allProducts: Product[] = [];
    successfulResponses.forEach(response => {
      allProducts = allProducts.concat(response.value.data);
    });

    // Atualiza a variável reativa products com todos os produtos
    products.value = allProducts;

  } catch (err) {
    console.error('Erro ao buscar dados:', err);
  }
};

onMounted(() => {
  fetchData();
});
</script>


<template>
  <NavBar />
  <main class="homeView">
    <section class="extrasServices">
      <a href="" target="_blank" class="cardCriate">
        <h1>faça seu cartão agora <br> sem taxas e anuidades</h1>
      </a>
      <a href="https://cmarcosvi.github.io/Project-B/" target="_blank" class="iaPromotion">
        <h1>Conheça Born Of Putridy uma experiencia <br> de terror direto no seu navegador</h1>
      </a>
    </section>
    <section class="products">
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
    </section>
  </main>
</template>
