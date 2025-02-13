abstract interface class Converter<Model extends Object, Dto extends Object> {
  Dto toDto(Model model);
  Model toModel(Dto dto);
}
