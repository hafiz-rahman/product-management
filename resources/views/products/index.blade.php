@extends('layouts.app')

@section('content')
    <div class="container mx-auto p-4">
        <!-- Search and Sorting Form -->
        <div class="flex justify-between items-center mb-4">
            <form action="{{ route('products.index') }}" method="GET" class="flex space-x-4">
                <input type="text" name="search" placeholder="Search by ID or Description" class="border p-2 rounded">
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Search</button>
            </form>

            <form action="{{ route('products.index') }}" method="GET" class="flex items-center space-x-4">
                <select name="sort_by" class="border p-2 rounded">
                    <option value="name">Sort by Name</option>
                    <option value="price">Sort by Price</option>
                </select>
                <select name="direction" class="border p-2 rounded">
                    <option value="asc">Ascending</option>
                    <option value="desc">Descending</option>
                </select>
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Sort</button>
            </form>
        </div>

        <!-- Product Cards -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            @foreach ($products as $product)
                <div class="bg-white border rounded-lg shadow-md overflow-hidden">
                    <img src="{{ asset('storage/' . $product->image) }}" alt="Product Image" class="w-full h-auto
                    max-w-[250px] object-contain rounded-md">
                    <div class="p-4">
                        <h3 class="font-semibold text-xl">{{ $product->name }}</h3>
                        <p class="text-gray-600 text-sm py-3">{{ \Illuminate\Support\Str::limit($product->description,
                        100, '...') }}</p>
                        <p class="text-gray-900 font-bold">Tk.{{ number_format($product->price, 2) }}</p>

                        <div class="flex justify-between mt-4">
                            <!-- Edit Button -->
                            <a href="{{ route('products.edit', $product->id) }}" class="text-blue-500">Edit</a>

                            <!-- Delete Button -->
                            <form action="{{ route('products.destroy', $product->id) }}" method="POST" onsubmit="return confirm('Are you sure?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="text-red-500">Delete</button>
                            </form>

                            <!-- Quick View Button (Modal) -->
                            <div x-data="{ open: false }">
                                <button @click="open = true" class="text-green-500">Quick View</button>

                                <!-- Quick View Modal -->
                                <div x-show="open" @click.away="open = false" class="fixed inset-0 bg-gray-500 bg-opacity-75 z-50 flex items-center justify-center">
                                    <div class="bg-white p-8 rounded-lg shadow-xl max-w-lg w-full">
                                        <img src="{{ asset('storage/' . $product->image) }}" alt="Product Image" class="w-full h-auto
                    max-w-[250px] object-contain rounded-md">
                                        <h3 class="font-semibold text-xl pt-3">{{ $product->name }}</h3>
                                        <p class="text-sm py-3">{!! $product->description !!}</p>
                                        <p class="text-gray-900 font-bold">Tk.{{ number_format($product->price, 2) }}</p>
                                        <button @click="open = false" class="mt-4 bg-red-500 text-white px-4 py-2 rounded">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <!-- Pagination -->
        <div class="mt-4">
            {{ $products->links() }}
        </div>
    </div>
@endsection
