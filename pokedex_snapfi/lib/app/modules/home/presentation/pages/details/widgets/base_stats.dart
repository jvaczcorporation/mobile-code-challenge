import 'package:flutter/material.dart';
import 'package:pokedex_snapfi/app/modules/home/home.dart';

class BaseStats extends StatelessWidget {
  final List<BaseStatPokemonEntity> stats;
  final Color color;

  const BaseStats({
    super.key,
    required this.stats,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
      ),
      child: Column(
        children: [
          Text(
            "Base Stats",
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
            ),
            child: Row(
              children: [
                Column(
                  children: stats
                      .map(
                        (item) => SizedBox(
                          height: 16,
                          child: Text(
                            item.stat.name.abbr,
                            style: TextStyle(
                              color: color,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                CustomDivider(
                  height: stats.length * 16,
                ),
                _buildStats,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildStats => Expanded(
        child: Column(
          children: [
            ...stats.map(
              (item) => SizedBox(
                height: 16,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: Text(
                        item.baseStat.toString().padLeft(3, '0'),
                        style: const TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(
                                4.0,
                              ),
                            ),
                          ),
                          Container(
                            width: item.baseStat.toDouble(),
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(
                                4.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
