import 'package:b2b_client_lk/src/ui/web/common/shopping_cart_buttons/shopping_cart_button/shopping_cart_button_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  @override
  void initState() {
    super.initState();
    context.read<ShoppingCartButtonVm>().init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ShoppingCartButtonVm>(context);

    return Center(
      child: IconButton(
        splashRadius: 20,
        onPressed: () => vm.goToShoppingCart(context),
        icon: Badge(
          isLabelVisible: vm.quantity != 0,
          label: vm.loading
              ? Center(
                  child: SizedBox(
                    height: 10,
                    width: 10,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                )
              : Text(
                  '${vm.quantity}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                ),
          child: const Icon(
            Icons.shopping_bag_outlined,
          ),
        ),
      ),
    );
  }
}
