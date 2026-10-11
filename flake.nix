{
  description = "Shared devenv environments and project templates";

  outputs = _: {
    templates = {
      dioxus = {
        path = ./templates/dioxus;
        description = "Dioxus web app";
      };
      js-npm = {
        path = ./templates/js-npm;
        description = "JavaScript with npm";
      };
      python = {
        path = ./templates/python;
        description = "Python with uv";
      };
      sagemath = {
        path = ./templates/sagemath;
        description = "SageMath with uv and marimo";
      };
    };
  };
}
