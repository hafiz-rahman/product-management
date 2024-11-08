@extends('layouts.app')

@section('content')
    <div class="max-w-3xl mx-auto my-8">
        <h2 class="text-2xl font-semibold mb-4">Create New Product</h2>

        @if(session('success'))
            <div x-data="{ show: true }" x-show="show" x-init="setTimeout(() => show = false, 3000)"
                 x-transition.opacity class="p-4 mb-4 bg-green-500 text-white rounded-md">
                <p>{{ session('success') }}</p>
            </div>
        @endif

        <form action="{{ route('products.store') }}" method="POST" enctype="multipart/form-data" class="space-y-4">
            @csrf

            <!-- Product ID -->
            <div>
                <label for="product_id" class="block text-sm font-medium text-gray-700">Product ID</label>
                <input type="text" name="product_id" id="product_id" value="{{ old('product_id') }}"
                       class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                @error('product_id')
                <p class="mt-2 text-red-600 text-sm">{{ $message }}</p>
                @enderror
            </div>

            <!-- Product Name -->
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Product Name</label>
                <input type="text" name="name" id="name" value="{{ old('name') }}"
                       class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                @error('name')
                <p class="mt-2 text-red-600 text-sm">{{ $message }}</p>
                @enderror
            </div>

            <!-- Product Description -->
            <div>
                <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                <textarea name="description" id="description" rows="4"
                          class="mt-1 block w-full p-2 border border-gray-300 rounded-md">{{ old('description') }}</textarea>
                @error('description')
                <p class="mt-2 text-red-600 text-sm">{{ $message }}</p>
                @enderror
            </div>

            <!-- Product Price -->
            <div>
                <label for="price" class="block text-sm font-medium text-gray-700">Price</label>
                <input type="number" step="0.01" name="price" id="price" value="{{ old('price') }}" min="0"
                       class="mt-1 block w-full p-2 border border-gray-300 rounded-md" required>
                @error('price')
                <p class="mt-2 text-red-600 text-sm">{{ $message }}</p>
                @enderror
            </div>

            <!-- Product Stock -->
            <div>
                <label for="stock" class="block text-sm font-medium text-gray-700">Stock</label>
                <input type="number" name="stock" id="stock" value="{{ old('stock') }}" min="0"
                       class="mt-1 block w-full p-2 border border-gray-300 rounded-md">
                @error('stock')
                <p class="mt-2 text-red-600 text-sm">{{ $message }}</p>
                @enderror
            </div>

            <!-- Product Image -->
            <div x-data="{ imagePreview: null }">
                <label for="image" class="block text-sm font-medium text-gray-700">Product Image</label>
                <input type="file" name="image" id="image"
                       class="mt-1 block w-full p-2 border border-gray-300 rounded-md"
                       @change="imagePreview = URL.createObjectURL($event.target.files[0])">
                @error('image')
                <p class="mt-2 text-red-600 text-sm">{{ $message }}</p>
                @enderror

                <!-- Image Preview -->
                <div x-show="imagePreview" class="mt-4">
                    <span class="block text-sm text-gray-600 mb-2">Image Preview:</span>
                    <img :src="imagePreview" alt="Image Preview" class="w-32 h-32 object-cover border rounded-md">
                </div>
            </div>

            <div class="flex justify-end mt-4">
                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700">Save Product</button>
            </div>
        </form>
    </div>
@endsection
