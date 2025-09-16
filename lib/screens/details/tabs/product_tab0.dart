import 'package:flutter/material.dart';
import 'package:untitled1/model/product.dart';
import 'package:untitled1/res/app_colors.dart';
import 'package:untitled1/res/app_icons.dart';
import 'package:untitled1/res/app_theme_extension.dart';

class ProductTab0 extends StatelessWidget {
  const ProductTab0({super.key});

  static const _kImageHeight = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const _ProductImage(),
            const _ProductBody(),
            PositionedDirectional(
              child: _HeaderIcon(
                icon: Icons.adaptive.arrow_back,
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage();

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 0.0,
      start: 0.0,
      end: 0.0,
      height: ProductTab0._kImageHeight,
      child: Image.network(
        'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        fit: BoxFit.cover,
        cacheHeight:
            (ProductTab0._kImageHeight * MediaQuery.devicePixelRatioOf(context))
                .toInt(),
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  const _HeaderIcon({
    required this.icon,
    // ignore: unused_element
    this.tooltip,
    // ignore: unused_element
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: MediaQuery.viewPaddingOf(context).top,
        start: 8.0,
        end: 8.0,
        bottom: 8.0,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Tooltip(
          message: tooltip,
          child: InkWell(
            onTap: onPressed ?? () {},
            customBorder: const CircleBorder(),
            child: Ink(
              padding: const EdgeInsetsDirectional.only(
                start: 18.0,
                end: 12.0,
                top: 15.0,
                bottom: 15.0,
              ),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductBody extends StatelessWidget {
  const _ProductBody();

  static const double _kHorizontalPadding = 20.0;
  static const double _kVerticalPadding = 30.0;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: ProductTab0._kImageHeight - 16.0,
      start: 0.0,
      end: 0.0,
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10.0,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Semantics(
          container: true,
          label: 'Text1 Text2',
          excludeSemantics: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: _kHorizontalPadding,
                  vertical: _kVerticalPadding,
                ),
                child: _ProductHeader(),
              ),
              _ProductScores(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductHeader extends StatelessWidget {
  const _ProductHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Petits pois et carottes', style: context.theme.title1),
        const SizedBox(height: 3.0),
        Text('Cassegrain', style: context.theme.title2),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

class _ProductScores extends StatelessWidget {
  static const double _horizontalPadding = _ProductBody._kHorizontalPadding;
  static const double _verticalPadding = 18.0;

  const _ProductScores();

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.theme.altText,
      child: Container(
        color: AppColors.gray1,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: _verticalPadding,
                horizontal: _horizontalPadding,
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 44,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5.0),
                        child: _Nutriscore(nutriscore: ProductNutriscore.A),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      flex: 66,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 25.0),
                        child: _NovaGroup(novaScore: ProductNovaScore.group4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1.0),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: _verticalPadding,
                horizontal: _horizontalPadding,
              ),
              child: _GreenScore(greenScore: ProductGreenScore.D),
            ),
          ],
        ),
      ),
    );
  }
}

class _Nutriscore extends StatelessWidget {
  final ProductNutriscore nutriscore;

  const _Nutriscore({required this.nutriscore});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.0,
      children: [
        Text('Nutri-Score', style: context.theme.title3),
        Image.asset(_findAssetName(), height: 50.0),
      ],
    );
  }

  String _findAssetName() {
    return switch (nutriscore) {
      ProductNutriscore.A => 'res/drawables/nutriscore_a.png',
      ProductNutriscore.B => 'res/drawables/nutriscore_b.png',
      ProductNutriscore.C => 'res/drawables/nutriscore_c.png',
      ProductNutriscore.D => 'res/drawables/nutriscore_d.png',
      ProductNutriscore.E => 'res/drawables/nutriscore_e.png',
      ProductNutriscore.unknown => 'TODO',
    };
  }
}

class _NovaGroup extends StatelessWidget {
  final ProductNovaScore novaScore;

  const _NovaGroup({required this.novaScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.0,
      children: [
        Text('Groupe NOVA', style: context.theme.title3),
        Text(_findLabel(), style: const TextStyle(color: AppColors.gray2)),
      ],
    );
  }

  String _findLabel() {
    return switch (novaScore) {
      ProductNovaScore.group1 =>
        'Aliments non transformés ou transformés minimalement',
      ProductNovaScore.group2 => 'Ingrédients culinaires transformés',
      ProductNovaScore.group3 => 'Aliments transformés',
      ProductNovaScore.group4 =>
        'Produits alimentaires et boissons ultra-transformés',
      ProductNovaScore.unknown => 'Score non calculé',
    };
  }
}

class _GreenScore extends StatelessWidget {
  final ProductGreenScore greenScore;

  const _GreenScore({required this.greenScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Green-Score', style: context.theme.title3),
        const SizedBox(height: 5.0),
        Row(
          children: [
            Icon(_findIcon(), color: _findIconColor()),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                _findLabel(),
                style: const TextStyle(color: AppColors.gray2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _findIcon() {
    return switch (greenScore) {
      ProductGreenScore.Aplus => AppIcons.ecoscore_a_plus,
      ProductGreenScore.A => AppIcons.ecoscore_a,
      ProductGreenScore.B => AppIcons.ecoscore_b,
      ProductGreenScore.C => AppIcons.ecoscore_c,
      ProductGreenScore.D => AppIcons.ecoscore_d,
      ProductGreenScore.E => AppIcons.ecoscore_e,
      ProductGreenScore.F => AppIcons.ecoscore_f,
      // TODO
      ProductGreenScore.unknown => AppIcons.ecoscore_e,
    };
  }

  Color _findIconColor() {
    return switch (greenScore) {
      ProductGreenScore.Aplus => AppColors.greenScoreAPlus,
      ProductGreenScore.A => AppColors.greenScoreA,
      ProductGreenScore.B => AppColors.greenScoreB,
      ProductGreenScore.C => AppColors.greenScoreC,
      ProductGreenScore.D => AppColors.greenScoreD,
      ProductGreenScore.E => AppColors.greenScoreE,
      ProductGreenScore.F => AppColors.greenScoreF,
      ProductGreenScore.unknown => Colors.transparent,
    };
  }

  String _findLabel() {
    return switch (greenScore) {
      ProductGreenScore.Aplus => 'Très faible impact environnemental',
      ProductGreenScore.A => 'Très faible impact environnemental',
      ProductGreenScore.B => 'Faible impact environnemental',
      ProductGreenScore.C => 'Impact modéré sur l\'environnement',
      ProductGreenScore.D => 'Impact environnemental élevé',
      ProductGreenScore.E => 'Impact environnemental très élevé',
      ProductGreenScore.F => 'Impact environnemental très élevé',
      ProductGreenScore.unknown => 'Score non calculé',
    };
  }
}
