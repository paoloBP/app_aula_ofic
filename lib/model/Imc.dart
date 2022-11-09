class Imc {
  late String _nome;
  late double _peso;
  late double _altura;
  late double _imc;

  Imc() {
    _nome = '';
    _peso = 0;
    _altura = 0;
    _imc = 0;
  }

  Imc.iniciarTudo(this._nome, this._peso, this._altura);

  Imc.iniciarNome(nome) {
    this._nome = nome;
    this._peso = 0;
    this._altura = 0;
    this._imc = 0;
  }

  double getImc() {
    return _imc = _peso / (_altura * _altura);
  }

  double get imc2 => getImc();

  String getResult() {
    if (_imc < 18.5) {
      return ' você está abaixo do peso';
    } else if (_imc >= 18.5 && _imc < 24.9) {
      return 'você está com o peso normal';
    } else if (_imc >= 25 && _imc < 29.9) {
      return 'você está com sobrepeso';
    } else if (_imc >= 30 && _imc < 34.9) {
      return 'você está com obesidade grau 1';
    } else if (_imc >= 35 && _imc < 39.9) {
      return 'você está com obesidade grau 2';
    } else {
      return 'você está com obesidade grau 3';
    }
  }

  String getResultado() {
    return '$_nome  ${getResult()}';
  }

  String get nome {
    return _nome;
  }

  set nome(String nome) {
    this._nome = nome;
  }

  double get peso {
    return _peso;
  }

  set peso(double peso) {
    this._peso = peso;
  }

  double get altura {
    return _altura;
  }

  set altura(double altura) {
    this._altura = altura;
  }

  double get imc {
    return _imc;
  }
}
