// stores/cart.ts
import { defineStore } from 'pinia';

interface CartItem {
  id: number;
  name: string;
  img: string;
  type?: string;
  price: number;
  quantity: number;
}

export const useCartStore = defineStore({
  id: 'cart',
  state: () => ({
    items: [] as CartItem[]
  }),
  getters: {
    totalItems(): number {
      return this.items.length;
    },
    totalPrice(): number {
      return this.items.reduce((total, item) => total + item.price, 0)
    },
    totalQuantity(): number {
      return this.items.reduce((total, item) => total + item.quantity, 0)
    }
  },
  actions: {
    addCart(item : CartItem): void {
      this.items.push(item);
    },
    removeFromCart(index : number): void {
      this.items.splice(index, 1);
    },
    clearCart() : void {
      this.items = []
    }
  }
});
