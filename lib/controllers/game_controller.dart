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
  }
}
