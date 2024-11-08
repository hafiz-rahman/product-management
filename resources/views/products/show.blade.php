@extends('layouts.app')

@section('content')
    <div class="max-w-3xl mx-auto my-8">
        <h2 class="text-2xl font-semibold mb-4">{{ $product->name }}</h2>

        <div class="bg-white p-6 shadow-md rounded-lg">
            <div class="flex mb-6">
                <!-- Product Image -->
                <img
                    src="{{ $product->image ? asset('storage/' . $product->image) : asset('images/placeholder.png') }}"
                    alt="Image of {{ $product->name }}"
                    class="w-48 h-48 object-cover rounded-md mr-6"
                >

                <div class="flex flex-col justify-between">
                    <!-- Product ID -->
                    <div>
                        <p class="text-sm text-gray-600 font-medium">Product ID:</p>
                        <p class="text-lg font-semibold">{{ $product->product_id }}</p>
                    </div>

                    <!-- Product Price -->
                    <div class="mt-4">
                        <p class="text-sm text-gray-600 font-medium">Price:</p>
                        <p class="text-lg font-semibold text-green-600">Tk.{{ number_format($product->price, 2) }}</p>
                    </div>

                    <!-- Product Stock -->
                    <div class="mt-4">
                        <p class="text-sm text-gray-600 font-medium">Stock:</p>
                        <p class="text-lg font-semibold">{{ $product->stock }} items available</p>
                    </div>
                </div>
            </div>

            <!-- Product Description -->
            <div class="mt-4">
                <p class="text-sm text-gray-600 font-medium">Description:</p>
                <p class="mt-2 text-gray-800">{{ $product->description }}</p>
            </div>

            <!-- Edit and Delete Buttons -->
            <div class="flex justify-end space-x-4 mt-6">
                <a href="{{ route('products.edit', $product->id) }}"
                   class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">
                    Edit
                </a>

                <form action="{{ route('products.destroy', $product->id) }}" method="POST"
                      onsubmit="return confirm('Are you sure you want to delete this product?');">
                    @csrf
                    @method('DELETE')
                    <button type="submit"
                            class="bg-red-600 text-white px-4 py-2 rounded-md hover:bg-red-700">
                        Delete
                    </button>
                </form>
            </div>
        </div>
    </div>
@endsection
