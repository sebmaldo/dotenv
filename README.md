# Dotenv
Repositorio de los archivos de configuración de algunas herramientas.

## Instrucciones
Estás son instrucciones para mi para poder instalar mi ambiente, y no son instrucciones genéricas.


* Clona el repositorio en la carpera home
```bash
git clone git@github.com:sebmaldo/dotenv.git
```
* Crea link simbólico el vimrc de la carpeta.
```bash
ln -sf ~/dotenv/vimrc ~/.vimrc
```
* Instalar pathogen
```bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
* Install solarized8
```bash
git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8
```
