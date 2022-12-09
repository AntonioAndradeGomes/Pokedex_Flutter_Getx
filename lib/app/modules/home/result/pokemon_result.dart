import 'package:freezed_annotation/freezed_annotation.dart';
part 'pokemon_result.freezed.dart';

@freezed
class PokemonResult<T> with _$PokemonResult {
  factory PokemonResult.success(T data) = Success;
  factory PokemonResult.error(String message) = Error;
}
