import 'package:b2b_client_lk/src/ui/web/common/responsive/adaptive_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'add_to_shoping_cart_button_vm.dart';

class AddToShoppingCartButton extends StatefulWidget {
  final String kod;
  final String groupId;
  final String ownerId;
  final String warehouseId;
  final bool byArticle;
  final String art;
  final String brand;
  final String name;
  final String price;

  const AddToShoppingCartButton({
    super.key,
    required this.kod,
    required this.groupId,
    required this.ownerId,
    required this.warehouseId,
    this.byArticle = false,
    this.art = '',
    this.brand = '',
    this.name = '',
    this.price = '',
  });

  @override
  State<AddToShoppingCartButton> createState() => _AddToShoppingCartButtonState();
}

class _AddToShoppingCartButtonState extends State<AddToShoppingCartButton> {
  @override
  void initState() {
    context.read<AddToShoppingCartButtonVm>().init(
          widget.kod,
          widget.groupId,
          widget.byArticle,
          widget.warehouseId,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AddToShoppingCartButtonVm>(context);

    return Row(
      children: [
        Container(
          child: vm.loading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  ),
                )
              : !vm.itemInShopingCart
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFFFF6347,
                        ),
                      ),
                      onPressed: () => widget.byArticle
                          ? vm.addArticlesGoodToCart(
                              widget.kod,
                              (vm.itemQuantity + 1).toString(),
                              widget.ownerId,
                              widget.art,
                              widget.brand,
                              widget.name,
                              widget.price,
                            )
                          : vm.changeQuantity(
                              vm.itemQuantity + 1,
                              widget.kod,
                              widget.groupId,
                              widget.ownerId,
                            ),
                      child: const Text(
                        style: TextStyle(color: Colors.white),
                        'В корзину',
                      ),
                    )
                  : _ChangeItemQuantityBox(
                      kod: widget.kod,
                      vm: vm,
                      groupId: widget.groupId,
                      ownerId: widget.ownerId,
                      byArticle: widget.byArticle,
                      art: widget.art,
                      brand: widget.brand,
                      name: widget.name,
                      price: widget.price,
                    ),
        ),
      ],
    );
  }
}

class _ChangeItemQuantityBox extends StatelessWidget {
  final String kod;
  final String groupId;
  final String ownerId;
  final bool byArticle;
  final String art;
  final String brand;
  final String name;
  final String price;

  final AddToShoppingCartButtonVm vm;

  const _ChangeItemQuantityBox({
    required this.kod,
    required this.vm,
    required this.groupId,
    required this.ownerId,
    required this.byArticle,
    required this.art,
    required this.brand,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ChangeQuantityButton(
          () => byArticle
              ? vm.addArticlesGoodToCart(
                  kod,
                  (vm.itemQuantity - 1).toString(),
                  ownerId,
                  art,
                  brand,
                  name,
                  price,
                )
              : vm.changeQuantity(
                  vm.itemQuantity - 1,
                  kod,
                  groupId,
                  ownerId,
                ),
          const Icon(
            Icons.horizontal_rule,
            color: Colors.white,
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 40,
          height: 30,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            key: Key(
              vm.itemQuantity.toString(),
            ),
            decoration: const InputDecoration(
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(1),
            ),
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            initialValue: vm.itemQuantity.toString(),
            onChanged: (value) => vm.changeQuantityTimer(
              int.parse(value),
              kod,
              groupId,
              ownerId,
            ),
            onFieldSubmitted: (value) => byArticle
                ? vm.addArticlesGoodToCart(
                    kod,
                    value,
                    ownerId,
                    art,
                    brand,
                    name,
                    price,
                  )
                : vm.changeQuantity(
                    int.parse(value),
                    kod,
                    groupId,
                    ownerId,
                  ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              FilteringTextInputFormatter.deny(
                RegExp('["_"]'),
              ),
              LengthLimitingTextInputFormatter(3),
            ],
          ),
        ),
        _ChangeQuantityButton(
          () => vm.changeQuantity(
            vm.itemQuantity + 1,
            kod,
            groupId,
            ownerId,
          ),
          const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _ChangeQuantityButton extends StatelessWidget {
  final Function() chageQuantity;
  final Icon icon;

  const _ChangeQuantityButton(this.chageQuantity, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(
          0xFFFF6347,
        ).withOpacity(0.85),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        radius: 15,
        onTap: chageQuantity,
        child: icon,
      ),
    );
  }
}
