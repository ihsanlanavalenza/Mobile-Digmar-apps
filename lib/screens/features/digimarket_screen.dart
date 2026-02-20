import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_3d_button.dart';
import '../../services/dummy_data_service.dart';
import '../../models/commodity.dart';

class DigiMarketScreen extends StatefulWidget {
  const DigiMarketScreen({super.key});

  @override
  State<DigiMarketScreen> createState() => _DigiMarketScreenState();
}

class _DigiMarketScreenState extends State<DigiMarketScreen> {
  final _searchController = TextEditingController();
  String _selectedCommodityId = DummyDataService.commodities.first.id;

  Commodity get _selectedCommodity => DummyDataService.commodities.firstWhere(
    (c) => c.id == _selectedCommodityId,
    orElse: () => DummyDataService.commodities.first,
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Image
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/Header Aplikasi.png',
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) =>
                  Container(height: 120, color: AppTheme.primaryGreen),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  // Title
                  Text(
                    'DIGIMARKET ROOM',
                    style: AppTheme.heading2.copyWith(
                      color: AppTheme.primaryGreen,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Pilih Komoditas:',
                    style: AppTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedCommodityId,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppTheme.primaryGreen,
                        ),
                        items: DummyDataService.commodities.map((c) {
                          return DropdownMenuItem<String>(
                            value: c.id,
                            child: Text(
                              c.name,
                              style: AppTheme.bodyLarge.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedCommodityId = newValue;
                              _searchController.text = _selectedCommodity.name;
                            });
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Product Display
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Commodity Image/Icon
                        _selectedCommodity.imagePath.isNotEmpty
                            ? Image.asset(
                                _selectedCommodity.imagePath,
                                height: 100,
                                width: 100,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.amber.shade100,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        _selectedCommodity.icon ?? Icons.grain,
                                        size: 48,
                                        color: AppTheme.primaryGreen,
                                      ),
                                    ),
                              )
                            : Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  _selectedCommodity.icon ?? Icons.grain,
                                  size: 48,
                                  color: AppTheme.primaryGreen,
                                ),
                              ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _selectedCommodity.name,
                              style: AppTheme.heading3.copyWith(
                                color: AppTheme.primaryGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rp ${_selectedCommodity.pricePerKg.toStringAsFixed(0)}/KG',
                              style: AppTheme.bodyLarge.copyWith(
                                color: AppTheme.primaryGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _buildActionButton('Ajukan Penawaran'),
                        const SizedBox(height: 12),
                        _buildActionButton('Kontrak Panen'),
                        const SizedBox(height: 12),
                        _buildActionButton('Layanan Pembayaran'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Harga Pasar Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HARGA PASAR',
                          style: AppTheme.heading3.copyWith(
                            color: AppTheme.textPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildPriceRow('Jawa', 'Rp 4.500 / Kg'),
                        const SizedBox(height: 4),
                        _buildPriceRow('Sumatera', 'Rp 5.200 / Kg'),
                        const SizedBox(height: 4),
                        _buildPriceRow('Kalimantan', 'Rp 6000 / Kg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Navigation Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Custom3DButton(
                            label: 'Kembali Keberanda',
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Custom3DButton(
                            label: 'Lihat Transaksi',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Penawaran diterima Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      width: double.infinity,
                      child: Custom3DButton(
                        label: 'Penawaran diterima',
                        onTap: () {},
                        width: double.infinity,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Footer Image
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/Buttom page.png',
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) => SizedBox(
                height: 100,
                child: ColoredBox(
                  color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label) {
    return SizedBox(
      width: double.infinity,
      child: Custom3DButton(label: label, onTap: () {}, width: double.infinity),
    );
  }

  Widget _buildPriceRow(String region, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(region, style: AppTheme.bodyMedium),
        Text(
          price,
          style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
