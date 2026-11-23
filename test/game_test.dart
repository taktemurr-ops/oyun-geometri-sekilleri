import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_geometri_sekilleri/oyun_geometri_sekilleri.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(geometriConfig.title.length, 33);
    expect(geometriConfig.tagline.length, 33);
    for (final s in geometriConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(geometriConfig.gameId, geometriId);
    expect(geometriRules.gameId, geometriId);
    expect(geometriConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(geometriRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: geometriId, optionalMechanics: geometriRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(geometriRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
