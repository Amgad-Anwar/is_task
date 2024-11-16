<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Faker\Factory as Faker;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        foreach (range(1, 100) as $index) {
            Product::create([
                'title' => $faker->word,
                'price' => $faker->randomFloat(0, 10, 500),
                'image' => 'https://www.cnet.com/a/img/resize/483f6629791616f58f3a205df4d52e40b8cba429/hub/2024/03/06/725a8e72-aa72-439a-9357-af161b30f3c9/apple-macbook-air-m3-2024-14.jpg?auto=webp&fit=crop&height=1200&width=1200',
            ]);
        }
    }
}
