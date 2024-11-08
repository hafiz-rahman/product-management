<?php

    namespace App\Http\Controllers;

    use App\Models\Product;
    use Illuminate\Http\Request;
    use Illuminate\Support\Facades\Storage;

    class ProductController extends Controller
    {
        public function index(Request $request)
        {
            $query = Product::query();

            // Apply search filter if requested
            if ($request->has('search')) {
                $query->where('product_id', 'like', '%' . $request->search . '%')
                    ->orWhere('description', 'like', '%' . $request->search . '%');
            }

            // Apply sorting based on user input; default to created_at in descending order
            if ($request->has('sort_by')) {
                $query->orderBy($request->sort_by, $request->direction ?? 'asc');
            } else {
                // Default ordering by latest created products
                $query->orderBy('created_at', 'desc');
            }

            // Retrieve products with pagination
            $products = $query->paginate(12);

            return view('products.index', compact('products'));
        }

        public function create()
        {
            return view('products.create');
        }

        public function store(Request $request)
        {
            $request->validate([
                'product_id' => 'required|unique:products',
                'name' => 'required',
                'price' => 'required|numeric',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);

            $imagePath = null;
            if ($request->hasFile('image')) {
                $imagePath = $request->file('image')->store('products', 'public');
            }

            Product::create([
                'product_id' => $request->product_id,
                'name' => $request->name,
                'description' => $request->description,
                'price' => $request->price,
                'stock' => $request->stock,
                'image' => $imagePath,
            ]);

            return redirect()->route('products.index')->with('success', 'Product created successfully!');
        }

        public function show($id)
        {
            $product = Product::findOrFail($id);

            // Pass the product data to the show view
            return view('products.show', compact('product'));
        }

        public function edit($id)
        {
            $product = Product::findOrFail($id);
            return view('products.edit', compact('product'));
        }

        public function update(Request $request, $id)
        {
            $product = Product::findOrFail($id);

            $request->validate([
                'product_id' => 'required|unique:products,product_id,' . $product->id,
                'name' => 'required',
                'price' => 'required|numeric',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);

            $imagePath = $product->image;
            if ($request->hasFile('image')) {
                if ($imagePath) {
                    Storage::delete('public/' . $imagePath);
                }
                $imagePath = $request->file('image')->store('products', 'public');
            }

            $product->update([
                'product_id' => $request->product_id,
                'name' => $request->name,
                'description' => $request->description,
                'price' => $request->price,
                'stock' => $request->stock,
                'image' => $imagePath,
            ]);

            return redirect()->route('products.index')->with('success', 'Product updated successfully!');
        }

        public function destroy($id)
        {
            $product = Product::findOrFail($id);

            if ($product->image) {
                Storage::delete('public/' . $product->image);
            }

            $product->delete();

            return redirect()->route('products.index')->with('success', 'Product deleted successfully!');
        }
    }
