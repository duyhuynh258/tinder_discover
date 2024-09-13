void registerDependency<T>(T service) {
  _ServiceLocator().register<T>(service);
}

T get<T>() {
  return _ServiceLocator().get<T>();
}

class _ServiceLocator {
  // Singleton instance of the service locator
  static final _ServiceLocator _instance = _ServiceLocator._internal();

  // Private constructor
  _ServiceLocator._internal();

  // Factory constructor to return the same instance
  factory _ServiceLocator() {
    return _instance;
  }

  // Store for registered services
  final Map<Type, dynamic> _services = {};

  // Register a service
  void register<T>(T service) {
    _services[T] = service;
  }

  // Retrieve a service
  T get<T>() {
    return _services[T] as T;
  }

  // Clear all registered services (optional)
  void clear() {
    _services.clear();
  }
}
