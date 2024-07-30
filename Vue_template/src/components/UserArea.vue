<template>
    <main>
        <NavBar />
        <div class="userArea">
            <div>
                <p class="nameProfile">{{name}}</p>
                <p class="emailProfile">{{email}}</p>
            </div>
        </div>
    </main>
</template>
<script setup lang="ts">
import { defineProps } from 'vue';
import NavBar from '../components/Navbar.vue';
const props = defineProps<{
    name: string | null;
    email: string | null;
}>();

const { name, email } = props;
</script>