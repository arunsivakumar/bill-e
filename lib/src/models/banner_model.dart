class BannerModel {
  final String _title1, _title2, _title3, buttonTitle3, _rankImage;

  BannerModel(this._title1, this._title2, this._title3, this.buttonTitle3,
      this._rankImage);

  get rankImage => _rankImage;

  get title3 => _title3;

  get title2 => _title2;

  String get title1 => _title1;
}