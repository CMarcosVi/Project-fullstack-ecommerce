// stores/cart.ts
import { defineStore } from 'pinia';

interface CartItem {
  id: number;
  name: string;
  imgs?: string;
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
    // Getter para retornar todos os detalhes dos itens no carrinho
    detailedItems(state): CartItem[] {
      return state.items.map(item => ({
        id: item.id,
        name: item.name,
        imgs: item.imgs,
        type: item.type,
        price: item.price,
        quantity: item.quantity,
        // adicione outras propriedades conforme necessário
      }));
    },
    totalPrice(state): number {
      return state.items.reduce((total, item) => total + item.price * item.quantity, 0);
    },
    totalQuantity(state): number {
      return state.items.reduce((total, item) => total + item.quantity, 0);
    }
  },
  actions: {
    addCart(item: CartItem): void {
      this.items.push(item);
    },
    removeFromCart(index: number): void {
      this.items.splice(index, 1);
    },
    clearCart(): void {
      this.items = [];
    }
  }
});
