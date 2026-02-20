import 'package:flutter/material.dart';

class Commodity {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final String description;
  final double
  pricePerKg; // Changed from int to double for flexibility, or keep int if that's what it was. It was int in previous view. let's stick to int to minimize breakage, or double. I'll check usage. actually int is fine for price in IDR usually.
  final String harvestSeason;
  final int growthDurationDays;
  final String region;
  final IconData? icon; // New field for commodities without images

  const Commodity({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.pricePerKg,
    required this.harvestSeason,
    required this.growthDurationDays,
    required this.region,
    this.icon,
  });
}
