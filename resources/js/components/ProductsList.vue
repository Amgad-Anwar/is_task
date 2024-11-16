<template>
  <div>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container">
        <a class="navbar-brand" href="#">Shop</a>
        <div class="d-flex">
          <button class="btn btn-primary" @click="toggleCartModal">
            View Cart
            <span v-if="cartStore.cartItems.length !== 0">{{
              cartStore.cartItems.length
            }}</span>
          </button>
          <button class="btn btn-danger ms-2" @click="logout">Logout</button>
        </div>
      </div>
    </nav>


    <div class="container mt-4">
      <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
          <div class="input-group">
            <input
              v-model="searchQuery"
              type="text"
              @keyup="searchProducts"
              class="form-control"
              placeholder="Search products..."
              aria-label="Search products"
            />

          </div>
        </div>
      </div>
    </div>

    <!-- Product List -->
    <div class="container mt-4">
      <div class="row">
        <div
          v-for="product in productsStore.products"
          :key="product.id"
          class="col-4 mb-4"
        >
          <div class="card text-center">
            <img :src="product.image" alt="product" class="card-img-top" />
            <div class="card-body">
              <h5 class="card-title">{{ product.title }}</h5>
              <p class="card-text">${{ product.price }}</p>
              <button @click="addToCart(product)" class="btn btn-primary">
                Add to Cart
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Loading spinner while fetching products -->
      <div v-if="productsStore.loading" class="text-center m-5">Loading...</div>
    </div>

    <!-- Cart Modal -->
    <div
      v-if="showCartModal"
      class="modal fade show"
      style="display: block"
      tabindex="-1"
      role="dialog"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Shopping Cart</h5>
            <button type="button" class="close" @click="toggleCartModal">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div v-if="cartStore.cartItems.length === 0" class="text-center">
              <p>Your cart is empty.</p>
            </div>
            <table v-else class="table table-bordered">
              <thead>
                <tr>
                  <th scope="col">Product</th>
                  <th scope="col">Price</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Total</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="item in cartStore.cartItems" :key="item.id">
                  <td class="text-center">
                    <img width="50px" :src="item.image" />
                    {{ item.title }}
                  </td>
                  <td>${{ item.price }}</td>
                  <td>
                    <input
                      type="number"
                      v-model="item.quantity"
                      min="1"
                      class="form-control"
                      @change="updateQuantity(item)"
                    />
                  </td>
                  <td>${{ item.price * item.quantity }}</td>
                  <td>
                    <button
                      class="btn btn-danger"
                      @click="removeFromCart(item.id)"
                    >
                      Remove
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              @click="toggleCartModal"
            >
              Close
            </button>
            <button
              type="button"
              v-if="cartStore.cartItems.length !== 0"
              class="btn btn-warning"
              @click="emptyCart"
            >
              Empty Cart
            </button>
            <button
              v-if="cartStore.cartItems.length !== 0"
              type="button"
              class="btn btn-primary"
              @click="checkout"
            >
              Checkout
            </button>
          </div>
        </div>
      </div>
    </div>
    <div v-if="showCartModal" class="modal-backdrop fade show"></div>
  </div>
</template>

<script>
import { ref } from "vue";
import { useProductsStore } from "@/stores/products";
import { useCartStore } from "@/stores/cart";
import { useAuthStore } from "@/stores/auth";
import { toast } from "vue3-toastify";
import { useRouter } from "vue-router";
import axios from 'axios';

import "vue3-toastify/dist/index.css";

export default {
  name: "ProductsList",
  setup() {
    const productsStore = useProductsStore();
    const cartStore = useCartStore();
    const authStore = useAuthStore();
    const router = useRouter();


    // Reactive variable for controlling the cart modal visibility
    const showCartModal = ref(false);

    // Fetch products on mount
    productsStore.fetchProducts();

    // Add product to the cart
    const addToCart = (product) => {
      cartStore.addToCart(product);
      toast.success("Item added to cart!", { position: "bottom-right" });
    };

    // Toggle cart modal visibility
    const toggleCartModal = () => {
      showCartModal.value = !showCartModal.value;
    };

    // Remove item from cart
    const removeFromCart = (index) => {
      cartStore.removeFromCart(index);
      toast.info("Item removed from cart", { position: "bottom-right" });
    };

    // Update quantity of a cart item
    const updateQuantity = (item) => {
      cartStore.updateItemQuantity(item);
      toast.info("Cart updated", { position: "buttom-right" });
    };

    const emptyCart = () => {
      cartStore.emptyCart();
      toast.info("Cart has been emptied", { position: "bottom-right" });
    };

    // Checkout function
const checkout = async () => {
  try {
    toast.info("Proceeding to checkout...", { position: "bottom-right" });

    // Prepare cart data to be sent
    const cartData = cartStore.cartItems.map((item) => ({
      product_id: item.id,
      quantity: item.quantity,
      price: item.price,
    }));

    // Retrieve token from localStorage
    const token = localStorage.getItem('token');
    // If the token exists, include it in the request headers
    const headers = token ? { Authorization: `Bearer ${token}` } : {};

    const response = await axios.post("/api/checkout", { cart: cartData }, { headers });

    if (response.data.success) {
      toast.success("Order placed successfully! in DB", {
        position: "bottom-right",
      });
      cartStore.emptyCart();
    } else {
      toast.error("Failed to place the order", {
        position: "bottom-right",
      });
    }
  } catch (error) {
    toast.error("An error occurred during checkout" + error, {
      position: "bottom-right",
    });
  }
};

    const  logout = async () => {
     await authStore.logout();
      toast.info("Logged out successfully", { position: "bottom-right" });

      router.push("login");
    };

    const onScroll = () => {
      const scrollable = document.documentElement.scrollHeight;
      const scrolled = window.scrollY + window.innerHeight;

      if (scrolled >= scrollable - 100) {
        productsStore.fetchProducts();
      }
    };
    const searchQuery = ref("");

    const searchProducts = () => {
      productsStore.fetchProducts(searchQuery.value);
    };

    window.addEventListener("scroll", onScroll);

    return {
      productsStore,
      cartStore,
      addToCart,
      toggleCartModal,
      showCartModal,
      removeFromCart,
      updateQuantity,
      checkout,
      logout,
      emptyCart,
      searchQuery,
      searchProducts,
      authStore,
    };
  },
};
</script>

<style scoped>
.card {
  cursor: pointer;
}

.modal-backdrop {
  z-index: 1050;
}

.modal {
  z-index: 1060;
}
</style>
