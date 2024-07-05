// use: json.find(key, (T value) => ''))    =>  tìm theo key trong json
extension Find<K, V, R> on Map<K, V> {
  R? find<T>(
      K key,
      R? Function(T value) cast,
      ) {
    final value = this[key];
    if (value != null && value is T) {
      return cast(value as T);
    } else {
      return null;
    }
  }
}

// use: json.search<int>();   =>  trả về các MapEntry(key: value) kiểu int của json đó
extension RecursiveSearchByDataType<K extends Comparable, V> on Map<K, V> {
  Iterable<MapEntry<K, T>> search<T>() sync* {
    Iterable<MapEntry<K, T>> _search(MapEntry<K, V> entry) sync* {
      if (entry.value is T) {
        yield MapEntry(
          entry.key,
          entry.value as T,
        );
      } else if (entry.value is Map<K, V>) {
        for (final entry in (entry.value as Map<K, V>).entries) {
          yield* _search(entry);
        }
      }
    }

    for (final entry in entries) {
      yield* _search(entry);
    }
  }
}