enum BuildStage {
  coreForming('core_forming', 'Core Forming', 1),
  drying('drying', 'Drying', 2),
  dustingCapping('dusting_capping', 'Dusting & Capping', 3),
  polishing('polishing', 'Polishing', 4),
  finished('finished', 'Finished', 5);

  const BuildStage(this.firestoreValue, this.displayName, this.order);

  final String firestoreValue;
  final String displayName;
  final int order;

  BuildStage? get next {
    final nextIndex = index + 1;
    if (nextIndex >= BuildStage.values.length) return null;
    return BuildStage.values[nextIndex];
  }

  bool get isTerminal => this == BuildStage.finished;
}
