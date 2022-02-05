import 'package:gow_memory_game/constantes.dart';
import 'package:gow_memory_game/game_settings.dart';
import 'package:gow_memory_game/models/game_opcao.dart';
import 'package:gow_memory_game/models/game_play.dart';
import 'package:gow_memory_game/pages/game_page.dart';
import 'package:mobx/mobx.dart';
part 'game_controller.g.dart';

class GameController = GameControllerBase with _$GameController;

abstract class GameControllerBase with Store {
  @observable
  List<GameOpcao> gameCards = [];

  @observable
  int score = 0;

  @observable
  bool venceu = false;

  @observable
  bool perdeu = false;

  late GamePlay _gamePlay;
  List<GameOpcao> _escolha = [];
  List<Function> _escolhaCallback = [];
  int _acertos = 0;
  int _numPares = 0;

  @computed
  bool get jogadaCompleta => (_escolha.length == 2);

  startGame({required GamePlay gamePlay}) {
    _gamePlay = gamePlay;
    _acertos = 0;
    _numPares = (_gamePlay.nivel / 2).round();
    venceu = false;
    perdeu = false;
    _resetScore();
    _generateCards();
  }

  _resetScore() {
    if (_gamePlay.modo == Modo.mortal) {
      score = 0;
    } else {
      score = _gamePlay.nivel;
    }
  }

  _generateCards() {
    // Coletar os números das cartas em ordem aleatória (shuffle)
    List<int> cardOpcoes = GameSettings.cardOpcoes.sublist(0)..shuffle();

    // Define o número de cards da lista
    cardOpcoes = cardOpcoes.sublist(0, _numPares);
    gameCards = [...cardOpcoes, ...cardOpcoes]
        .map(
            (opcao) => GameOpcao(opcao: opcao, matched: false, selected: false))
        .toList();
    gameCards.shuffle();
  }

  escolher(GameOpcao opcao, Function resetCard) async {
    opcao.selected = true;
    _escolha.add(opcao);
    _escolhaCallback.add(resetCard);
    await _compararEscolhas();
  }

  _compararEscolhas() async {
    if (jogadaCompleta) {
      if (_escolha[0].opcao == _escolha[1].opcao) {
        _acertos++;
        _escolha[0].matched = true;
        _escolha[1].matched = true;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          for (var i in [0, 1]) {
            _escolha[i].selected = false;
            _escolhaCallback[i]();
          }
        });
      }

      _resetJogada();
      _updateScore();
      //_checkGameResult();
    }
  }

  _resetJogada() {
    _escolha = [];
    _escolhaCallback = [];
  }

  _updateScore() {
    _gamePlay.modo == Modo.mortal ? score++ : score--;
  }
}
