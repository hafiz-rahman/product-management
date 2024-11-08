<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>@yield('title', 'Product Management')</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Alpine.js for interactivity (modals, toasts, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2/dist/alpine.js" defer></script>

</head>
<body class="bg-gray-100 text-gray-800">

<!-- Navbar -->
<nav class="bg-white shadow-lg">
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center">
        <a href="{{ route('products.index') }}" class="text-lg font-semibold text-gray-900">
            Product Management
        </a>
        <div class="space-x-4">
            <a href="{{ route('products.index') }}" class="text-gray-600 hover:text-gray-800">Products</a>
            <a href="{{ route('products.create') }}" class="text-gray-600 hover:text-gray-800">Add New Product</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<main class="max-w-7xl mx-auto px-4 py-8">
    <!-- Toast Notifications -->
    <div x-data="{ show: true }" x-show="show" @click.away="show = false" class="fixed top-4 right-4 z-50">
        @if(session('success'))
            <div x-data="{ show: true }" x-show="show" @click.away="show = false" x-init="setTimeout(() => show = false, 3000)"
                 class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 rounded-md shadow-md mb-4">
                <p>{{ session('success') }}</p>
            </div>
        @endif
        @if(session('danger'))
            <div x-data="{ show: true }" x-show="show" @click.away="show = false" x-init="setTimeout(() => show = false, 3000)"
                 class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 rounded-md shadow-md mb-4">
                <p>{{ session('danger') }}</p>
            </div>
        @endif
    </div>

    <!-- Page Content -->
    <div class="bg-white shadow-md rounded-lg p-6">
        @yield('content')
    </div>
</main>

<!-- Footer -->
<footer class="bg-gray-800 text-gray-200 py-4 mt-8">
    <div class="max-w-7xl mx-auto px-4 text-center">
        <p>&copy; {{ date('Y') }} Product Management System. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
