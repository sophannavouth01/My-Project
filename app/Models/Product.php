<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'pname', 'bcode', 'brandname', 'color', 'image', 'category', 'qty', 'price', 'description'
    ];
    

}
