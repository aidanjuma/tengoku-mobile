import 'dart:collection';

class Stack<T> {
  final Queue queue = Queue<T>();

  void push(T item) {
    queue.addFirst(item);
  }

  T pop() {
    final T first = queue.first;
    queue.removeFirst();
    return first;
  }
}
