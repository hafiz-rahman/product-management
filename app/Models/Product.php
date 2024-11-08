<?php

    namespace App\Models;

    use Illuminate\Database\Eloquent\Factories\HasFactory;
    use Illuminate\Database\Eloquent\Model;

    class Product extends Model
    {
        use HasFactory;

        protected $fillable = [
            'product_id', 'name', 'description', 'price', 'stock', 'image'
        ];

        // Optionally: If you need to add an accessor for image path
        public function getImageUrlAttribute()
        {
            return $this->image ? asset('storage/' . $this->image) : null;
        }
    }
