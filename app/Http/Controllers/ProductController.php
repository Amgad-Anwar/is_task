<?php

namespace App\Http\Controllers;

use App\Http\Resources\PaginationResource;
use App\Http\Resources\ProductResource;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index() {
        $products = Product::when(request('search'), function($q) {
            $q->where('title', 'like', '%' . request('search') . '%');
        })->paginate(10);

        return response()->json([
            'success' => true,
            'result' => new PaginationResource( $products, ProductResource::class)
        ]);
    }
}
