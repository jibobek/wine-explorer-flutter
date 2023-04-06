import 'package:flutter/material.dart';
import 'package:wine_explorer/constants/color_constants.dart';
import 'package:wine_explorer/constants/country_constants.dart';
import 'package:wine_explorer/models/filter/wines_filter_model.dart';

class FilterWidget extends StatefulWidget {
  final VoidCallback onFilterApply;
  final WinesFilter winesFilter;

  const FilterWidget(
      {super.key, required this.onFilterApply, required this.winesFilter});
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final List<String> _countryCodes = kCountryCodes;
  final List<int> _ratings = [1, 2, 3, 4, 5];

  final List<Map<String, String>> _orderByOptions = [
    {
      'value': 'price',
      'label': 'Cena',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filtr",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(width: 24.0),
                      const Text("Řazení"),
                      DropdownButton<String>(
                        value: widget.winesFilter.orderBy,
                        onChanged: (String? value) {
                          widget.winesFilter.orderBy = value!;
                        },
                        items: _orderByOptions
                            .map((option) => DropdownMenuItem<String>(
                                  value: option['value'],
                                  child: Text(option['label']!),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    children: [
                      const Text("Země"),
                      DropdownButton<String>(
                        value: widget.winesFilter.countryCode,
                        onChanged: (String? value) {
                          setState(() {
                            widget.winesFilter.countryCode = value!;
                          });
                        },
                        items: _countryCodes
                            .map(
                              (countryCode) => DropdownMenuItem<String>(
                                value: countryCode,
                                child: Text(countryCode),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24.0),
                  Column(
                    children: [
                      const Text("Min. hodnocení"),
                      DropdownButton<int>(
                        value: widget.winesFilter.minRating,
                        onChanged: (int? value) {
                          setState(() {
                            widget.winesFilter.minRating = value!;
                          });
                        },
                        items: _ratings
                            .map(
                              (rating) => DropdownMenuItem<int>(
                                value: rating,
                                child: Row(
                                  children: List.generate(
                                    rating,
                                    (index) => const Icon(Icons.star,
                                        color: Colors.yellow),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  )
                ],
              ),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Vzestupně'),
              value: widget.winesFilter.order == "asc",
              onChanged: (bool? value) {
                setState(() {
                  if (value!) {
                    widget.winesFilter.order = "asc";
                  } else {
                    widget.winesFilter.order = "desc";
                  }
                });
              },
            ),
            const Text("Cenový rozptyl (CZK)"),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Minimum",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        widget.winesFilter.minPrice =
                            double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Maximum",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        widget.winesFilter.maxPrice =
                            double.tryParse(value) ?? 100.0;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                child: ElevatedButton(
                  onPressed: widget.onFilterApply,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    ),
                  ),
                  child: const Text(
                    "Použít filtr",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
