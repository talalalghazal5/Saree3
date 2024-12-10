<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

-   [Simple, fast routing engine](https://laravel.com/docs/routing).
-   [Powerful dependency injection container](https://laravel.com/docs/container).
-   Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
-   Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
-   Database agnostic [schema migrations](https://laravel.com/docs/migrations).
-   [Robust background job processing](https://laravel.com/docs/queues).
-   [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

# Laravel API Project

This is a Laravel-based API project for a Flutter **multi vendor** app, using Laravel Breeze API boilerplate.

### Follow these steps to set up the project.

## Requirements

Before you begin, ensure you have the following installed:

-   PHP >= 8.2
-   MySQL ( or your favorite database management system )
-   Composer

## Setup Instructions

after cloning the repository...

### 1. Install Dependencies

Run the following command to install PHP dependencies:

```bash
composer install
```

### 2. Set Up the Environment

1. Copy the `.env.example` file to `.env`:

    ```bash
    cp .env.example .env
    ```

2. Update the database configuration in the `.env` file with your local database credentials ( the `.env.example` is using SQLite so if you're fine with it just leave it ):

    ```env
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=your_database_name
    DB_USERNAME=your_username
    DB_PASSWORD=your_password
    ```

3. Update twilio variables following this tutorial [twilio otp verification with laravel](https://www.twilio.com/en-us/blog/verify-phone-numbers-php-laravel-application-twilio-verify#verifying-phone-number-otp) and add your verified phone number:

    ```env
    TWILIO_SID="your Twilio sid"
    TWILIO_AUTH_TOKEN="your Twilio token"
    TWILIO_VERIFY_SID="your Twilio sync service sid"
    TWILIO_TRIAL_PHONE_NUMBER="your verified Twilio phone number"
    ```

4. update any other environment variable to suite your need

### 3. Generate the Application Key

Run the following command to generate the app key:

```bash
php artisan key:generate
```

### 4. Run Migrations and Seed Database (Optional)

To set up the database schema and seed it with sample data:

```bash
php artisan migrate --seed
```

### 5. Serve the Application

Run the development server:

```bash
php artisan serve
```

The application will be accessible at [http://localhost:8000](http://localhost:8000).

## Updating After Pulling Changes

If you pull new changes from the repository, make sure to follow these steps:

1. **Update Dependencies**:

    ```bash
    composer install
    npm install
    ```

2. **Run Migrations** (if there are new migrations):

    ```bash
    php artisan migrate
    ```

    or if you want a fresh database with the seeded sample data:

    ```bash
    php artisan migrate:fresh --seed
    ```

3. **Clear Cache** (optional but recommended):
    ```bash
    php artisan config:clear
    php artisan cache:clear
    php artisan route:clear
    ```

## Troubleshooting

If you encounter any issues, check:

1. The `.env` file for correct configuration.
2. Ensure the database is running and accessible.
3. Clear caches:
    ```bash
    php artisan config:clear
    php artisan cache:clear
    ```

Feel free to reach out for further assistance.

---

## Additional Notes

-   Ensure that the `storage/` and `bootstrap/cache/` directories are writable:

    ```bash
    chmod -R 775 storage bootstrap/cache
    ```

-   For production environments, use the following commands to optimize the application:

    ```bash
    php artisan config:cache
    php artisan route:cache
    ```

-   If deploying to production, run:

    ```bash
    composer install --optimize-autoloader --no-dev
    ```

-   If you want to try the auth api without csrf token and xsrf cookie:

    update the `bootstrap/app.php` file and uncomment the following code:

    ```php
     $middleware->validateCsrfTokens(except: [
               '*'
           ]);
    ```

    or you keep the csrf and access the xsrf-token through this route `/sanctum/csrf-cookie` and include it in your `http` header as `X-XSRF-TOKEN`

    #### using Postman

    you can do this in postman using this pre-request script to set the xsrf token to the variable `xsrf-cookie`:

    ```javascript
    pm.sendRequest(
        {
            url: "http://localhost:8000/sanctum/csrf-cookie",
            method: "GET",
        },
        function (error, response, { cookies }) {
            if (!error) {
                pm.collectionVariables.set(
                    "xsrf-cookie",
                    cookies.get("XSRF-TOKEN")
                );
            }
        }
    );
    ```

    then adding the token to your headers as the following:

    ```
    key: X-XSRF-TOKEN
    value : {{xsrf-cookie}}
    ```

    good to go 🎉

---

Happy coding! 🎶✨
