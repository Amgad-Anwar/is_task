import { defineStore } from 'pinia';
import axios from 'axios';


export const useProductsStore = defineStore('products', {
  state: () => ({
    products: [],
    currentPage: 1,
    loading: false,
    hasMore: true,
  }),
  actions: {
    async fetchProducts(search = '') {
        if (this.loading || !this.hasMore) return;

        this.loading = true;
        try {
          const token = localStorage.getItem('token'); // Retrieve token from localStorage

          const headers = token ? { Authorization: `Bearer ${token}` } : {};
          if (search) {
            this.currentPage = 1;
            this.products=[];

          }

          const response = await axios.get(`/api/products?page=${this.currentPage}&search=${search}`, { headers });

          //console.log(response);
          const data = response.data.result.data ;
          const last_page = response.data.result.meta.last_page
          this.products.push(...data);
          this.hasMore = last_page !== this.currentPage;

          if (this.hasMore) this.currentPage++;
        } catch (error) {
          console.error(error);
        } finally {
          this.loading = false;
          if (search) {
            this.loading = false;
            this.hasMore= true;
        }
        }
      },

  },
});
