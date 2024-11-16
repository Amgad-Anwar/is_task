<template>
  <div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="cartModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="cartModalLabel">Shopping Cart</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div v-if="cartStore.cartItems.length === 0" class="text-center">Your cart is empty.</div>
          <div v-for="item in cartStore.cartItems" :key="item.id" class="d-flex justify-content-between">
            <span>{{ item.name }} x {{ item.quantity }}</span>
            <button @click="removeFromCart(item.id)" class="btn btn-danger btn-sm">Remove</button>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Checkout</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { useCartStore } from '@/stores/cart';

export default {
  name: 'CartModal',
  setup() {
    const cartStore = useCartStore();

    const removeFromCart = (productId) => {
      cartStore.removeFromCart(productId);
    };

    return {
      cartStore,
      removeFromCart,
    };
  },
};
</script>

<style scoped>
.modal-dialog {
  max-width: 400px;
}
</style>
