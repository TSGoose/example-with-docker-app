<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index(): Collection
    {
        return Post::all();
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string',
            'content' => 'required|string',
        ]);

        return Post::create($validated);
    }

    public function show($id)
    {
        return Post::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $post = Post::findOrFail($id);

        $post->update($request->only(['title', 'content']));

        return $post;
    }
    /**
     * @param mixed $id
     */
    public function destroy($id): JsonResponse
    {
        Post::destroy($id);
        return response()->json(['message' => 'Post deleted']);
    }
}

