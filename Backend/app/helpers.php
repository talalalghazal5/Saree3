<?php

if (!function_exists('convertPriceToCents')) {
    /**
     * Convert price to cents.
     *
     * @param ?float $price
     * @return ?int
     */
    function convertPriceToCents(?float $price): ?int
    {
        return isset($price) ? intval(round($price * 100)) : null;
    }
}

if (!function_exists('convertPriceToDollars')) {
    /**
     * Convert price to cents.
     *
     * @param ?float $price
     * @return ?int
     */
    function convertPriceToDollars(?int $price): ?float
    {
        return isset($price) ? round($price / 100, 2) : null;
    }
}

if (!function_exists('convertRatingToPercentage')) {
    /**
     * Convert rating to percentage.
     *
     * @param ?float $rating
     * @return ?int
     */
    function convertRatingToPercentage(?float $rating): ?int
    {
        return isset($rating) ? intval(round($rating * 100)) : null;
    }
}

if (!function_exists('convertRatingToMax5')) {
    /**
     * Convert rating to percentage.
     *
     * @param ?float $rating
     * @return ?int
     */
    function convertRatingToMax5(?int $rating): ?float
    {
        return isset($rating) ? round($rating / 100, 2) : null;
    }
}
