/// Utility class that simplifies handling errors.
///
/// Return a [Resultado] from a function to indicate success or failure.
///
/// A [Resultado] is either an [Ok] with a value of type [T]
/// or an [Error] with an [Exception].
///
/// Use [Resultado.ok] to create a successful Resultado with a value of type [T].
/// Use [Resultado.error] to create an error Resultado with an [Exception].
sealed class Resultado<T> {
  const Resultado();

  /// Creates an instance of Resultado containing a value
  factory Resultado.ok(T value) => Ok(value);

  /// Create an instance of Resultado containing an error
  factory Resultado.error(Exception error) => Error(error);
}

/// Subclass of Resultado for values
final class Ok<T> extends Resultado<T> {
  const Ok(this.value);

  /// Returned value in Resultado
  final T value;
}

/// Subclass of Resultado for errors
final class Error<T> extends Resultado<T> {
  const Error(this.error);

  /// Returned error in Resultado
  final Exception error;
}
