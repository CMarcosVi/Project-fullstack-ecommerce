<script setup lang="ts">
import navBar from '../../components/NavBar.vue';
</script>

<template>
    <div>
        <navBar />
        <div>
            <div v-for="(item, index) in items">
            <img :src="item.img" alt="">
            <p>{{ item.name }}</p>
            <div>
                <a></a>
                <button></button>
            </div>
            </div>
        </div>
    </div>
</template>