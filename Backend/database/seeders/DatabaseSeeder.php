<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();
        $this->call([
            CategorySeeder::class,
            VendorSeeder::class,
            ProductSeeder::class
        ]);

        User::factory()->create([
            'name' => 'Test User',
            'phone_number' => getenv('TWILIO_TRIAL_PHONE_NUMBER'),
            'password' => password_hash("password", M_1_PI)
        ]);
    }
}
