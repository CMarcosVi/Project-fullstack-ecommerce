<script setup lang="ts">
import { reactive, onMounted } from 'vue';
import axios from 'axios';
import { useCartStore } from "../stores/counter";
import NavBar from '@/components/NavBar.vue';

const cartStore = useCartStore();

interface Product {
  id: number;
  name: string;
  img: string;
  type?: string;
  price: number;
  quantity: number;
}

async function findProducts(categories: string[]): Promise<{ products: Product[] }> {
  try {
    const requests = categories.map(async (category) => {
      const url = `http://localhost:3000/${category}ListProducts`;
      const response = await axios.get<{ products: Product[] }>(url);
      return response.data.products;
    });

    // Esperar que todas as requisições sejam completadas
    const productsArrays = await Promise.all(requests);

    // Combina os arrays de produtos em um único array
    const combinedProducts = productsArrays.reduce((acc, products) => [...acc, ...products], []);

    return { products: combinedProducts };
  } catch (error) {
    console.error('Error fetching products:', error);
    throw error;
  }
}


const state = reactive<{ products: Product[] }>({
  products: []
});

const addCartStore = (item: Product) => {
  cartStore.addCart({ type: 'drinks', ...item });
}

onMounted(async () => {
  try {
    const categories = [
      'drinks',
      'foods',
      'gamesAndConsoles',
      'smartPhones'
    ];

    const fetchedProducts = await findProducts(categories);
    state.products = fetchedProducts.products;
    console.log(state.products); // Verifique se os dados são exibidos corretamente aqui
  } catch (error) {
    console.error('Error fetching products:', error);
  }
});

</script>

<template>
  <NavBar />
  <main class="homeView">
    <section class="extrasServices">
      <!-- Links para outras seções -->
      <a href="" target="_blank" class="cardCriate">
        <h1>faça seu cartão agora <br> sem taxas e anuidades</h1>
      </a>
      <a href="https://cmarcosvi.github.io/Project-B/" target="_blank" class="iaPromotion">
        <h1>Conheça Born Of Putridy uma experiencia <br> de terror direto no seu navegador</h1>
      </a>
    </section>
    <section class="products">
      <div class="productsList">
        <div v-for="item in state.products" :key="item.id" class="productItem">
          <img :src="item.img">
          <p>{{ item.name }}</p>
          <p>R${{ item.price }}.00</p>
          <div>
            <!-- Use RouterLink para navegação -->
            <!--<RouterLink v-if="item.id" :to="{ name: 'ProdutoDetalhe', params: { tipo: item.type || '', id: item.id.toString() } }">Comprar</RouterLink>-->
            <!-- Botão para adicionar ao carrinho -->
            <button class="addCartProduct" @click.prevent="addCartStore(item)">
              <img src="../../assets/imgs/shoppingCartBlack.png" alt="botão adicionar ao carrinho">
            </button>
          </div>
        </div>
      </div>
    </section>
  </main>
</template>
