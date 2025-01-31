<?php

namespace Tests\Feature\Api;

use Illuminate\Support\Facades\Log;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;

class RegistrationTest extends TestCase
{
    use RefreshDatabase;

    public function test_new_users_can_register_through_api(): void
    {
        $response = $this->post('/api/register', [
            'first_name' => 'Test',
            'last_name' => 'User',
            'email' => 'test@example.com',
            'password' => 'password',
        ]);

        $response->assertStatus(201);

        $response->assertJsonStructure(['user_id', 'first_name', 'last_name', 'email']);

        $response->assertJson([
            'first_name' => 'Test',
            'last_name' => 'User',
            'email' => 'test@example.com',
        ]);

        $this->assertAuthenticated();
    }

    public function test_new_users_cannot_register_twice(): void
    {
        $response = $this->post('/api/register', [
            'first_name' => 'Test',
            'last_name' => 'User',
            'email' => 'test@example.com',
            'password' => 'password',
        ]);

        $response->assertStatus(201);
        $user = User::find($response['user_id']);
        $response = $this->actingAs($user)->post('/logout');
        $this->assertGuest();

        $response = $this->post('/api/register', [
            'first_name' => 'Test',
            'last_name' => 'User',
            'email' => 'test@example.com',
            'password' => 'password',
        ]);

        $response->assertStatus(400);
        $response->assertJsonStructure(['error_code', 'error_title', 'error_message']);

    }
}
