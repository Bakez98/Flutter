import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactorseFree,
  vegatarian,
  vegan,
}

class FiltersSceen extends StatefulWidget {
  const FiltersSceen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;
  @override
  State<FiltersSceen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersSceen> {
  var _glutenFreeFliterSet = false;
  var _lactoseFreeFliterSet = false;
  var _vegatarianFliterSet = false;
  var _veganFliterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFliterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFliterSet = widget.currentFilters[Filter.lactorseFree]!;
    _vegatarianFliterSet = widget.currentFilters[Filter.vegatarian]!;
    _veganFliterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFliterSet,
            Filter.lactorseFree: _lactoseFreeFliterSet,
            Filter.vegatarian: _vegatarianFliterSet,
            Filter.vegan: _veganFliterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFliterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFliterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only Include gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFliterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFliterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only Include Lactose-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegatarianFliterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegatarianFliterSet = isChecked;
                });
              },
              title: Text(
                'Vegatarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only Include Vegatarian meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFliterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFliterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only Include Vegan meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
