<!-- src/views/ProdutoDetalhe.vue -->
<template>
    <div>
      <h2>Detalhes do Produto</h2>
      <p>ID: {{ id }}</p>
      <p>Tipo: {{ tipo }}</p>
      <!-- Coloque o resto dos detalhes do produto aqui -->
    </div>
  </template>
  
  <script setup lang="ts">
  import { defineProps } from 'vue';
  
  const props = defineProps<{ id: string; tipo: string; }>();
  
  const id = props.id;
  const tipo = props.tipo;
  </script>
  