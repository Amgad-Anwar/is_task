<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function checkout(Request $request) {
        $request->validate([
            'cart' => 'required|array',
            'cart.*.product_id' => 'required|integer|exists:products,id',
            'cart.*.quantity' => 'required|integer|min:1',
        ]);

        $total = 0;
        foreach ($request->cart as $item) {
            $product = Product::find($item['product_id']);
            if ($product) {
                $total += $item['quantity'] * $product->price;
            }
        }

        $order = Order::create([
            'user_id' => auth()->id(),
            'total' => $total,
        ]);

        foreach ($request->cart as $item) {
            $product = Product::find($item['product_id']);
            if ($product) {
                OrderDetail::create([
                    'order_id' => $order->id,
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity'],
                    'price' => $product->price,
                ]);
            }
        }

        // Return a successful response
        return response()->json([
            'success' => true,
            'message' => 'Order placed successfully',
        ]);
    }

}
