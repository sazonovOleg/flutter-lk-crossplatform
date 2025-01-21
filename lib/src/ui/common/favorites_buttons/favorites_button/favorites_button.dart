import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_button_vm.dart';

class FavoritesButton extends StatefulWidget {
  const FavoritesButton({Key? key}) : super(key: key);

  @override
  State<FavoritesButton> createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton> {
  @override
  void initState() {
    context.read<FavoritesButtonVm>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FavoritesButtonVm>(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
          splashRadius: 20,
          onPressed: () => vm.goToFavoritesPage(context),
          icon: Badge(
            isLabelVisible: vm.quantity != 0,
            label: vm.loading
                ? const Center(
                    child: SizedBox(),
                  )
                : Text(
                    '${vm.quantity}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
            child: const Icon(
              Icons.favorite_border,
            ),
          ),
        ),
      ),
    );
  }
}
