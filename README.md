# gtk-msvc-projects
MSVC Projects to build GTK+ from Stock Installation of MSVC 2008-2013; some dependencies support up to Visual Studio 2022.

Due to the advent of Meson and CMake that is found in many of the dependencies nowadays, this repo will be superseded gradually by the repo gtk-deps-msvc, where Visual Studio build files will be provided only for the dependencies that do not have CMake or Meson build files in upstream releases, nor Visual Studio projects nor NMake Makefiles.

The short list of such dependencies (may be expanded as things progress):
*  libffi
*  libiconv
*  gettext
