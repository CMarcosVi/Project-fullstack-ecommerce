<script setup lang="ts">
import { RouterView } from 'vue-router'
import { onBeforeMount } from 'vue';
import { useCartStore } from './stores/counter';

const useCart = useCartStore();
onBeforeMount(() => {
  useCart.gettingValuesStorange();
})
</script>

<template>
  <RouterView />
</template>
