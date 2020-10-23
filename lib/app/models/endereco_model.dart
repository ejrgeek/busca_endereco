class EnderecoModel {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ibge;
  String gia;
  String ddd;
  String siafi;

  EnderecoModel(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafi});

  EnderecoModel.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() => {
        'cep': this.cep,
        'logradouro': this.logradouro,
        'complemento': this.complemento,
        'bairro': this.bairro,
        'localidade': this.localidade,
        'uf': this.uf,
        'ibge': this.ibge,
        'gia': this.gia,
        'ddd': this.ddd,
        'siafi': this.siafi,
      };

  @override
  String toString() {
    return this
        .toJson()
        .toString()
        .replaceAll('{', '')
        .replaceAll('}', '');
  }
}
