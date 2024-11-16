import { defineStore } from 'pinia';
import Cookies from 'js-cookie';

export const useCartStore = defineStore('cart', {
  state: () => ({
    cartItems: JSON.parse(Cookies.get('cart') || '[]'),
  }),
  actions: {
    addToCart(product) {
      const existingItem = this.cartItems.find(item => item.id === product.id);
      if (existingItem) {
        existingItem.quantity++;
      } else {
        this.cartItems.push({ ...product, quantity: 1 });
      }
      this.updateCartCookie();
    },
    removeFromCart(productId) {
      this.cartItems = this.cartItems.filter(item => item.id !== productId);
      this.updateCartCookie();
    },
    updateCartCookie() {
      Cookies.set('cart', JSON.stringify(this.cartItems), { expires: 7 });
    },
    updateItemQuantity(item) {

        const existingItem = this.cartItems.find(cartItem => cartItem.id === item.id);
        if (existingItem) {
          existingItem.quantity = item.quantity;
        }
        console.log( existingItem.quantity , item.quantity );
        this.updateCartCookie();
    },
    emptyCart() {
      this.cartItems = [];
      Cookies.remove('cart');
    },
  },
});
