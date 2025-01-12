import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_to_favorites_button_vm.dart';

class AddToFavoritesButton extends StatefulWidget {
  final String kod;
  final String groupId;

  const AddToFavoritesButton({
    Key? key,
    required this.kod,
    required this.groupId,
  }) : super(key: key);

  @override
  State<AddToFavoritesButton> createState() => _AddToFavoritesButtonState();
}

class _AddToFavoritesButtonState extends State<AddToFavoritesButton> {
  @override
  void initState() {
    context.read<AddToFavoritesButtonVm>().init(widget.kod);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AddToFavoritesButtonVm>(context);

    return SizedBox(
      width: 40,
      child: IconButton(
        splashRadius: 20,
        icon: vm.loading
            ? const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            : Icon(
                vm.favorite ? Icons.favorite : Icons.favorite_border,
                color: const Color(
                  0xFFFF6347,
                ),
              ),
        onPressed: () => vm.changeFavorites(widget.kod, widget.groupId),
      ),
    );
  }
}
