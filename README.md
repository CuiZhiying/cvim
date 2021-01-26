# vim profile
This is a vim profile for myself
the best pratice
""" bash
git clone https://github.com/CuiZhiying/cvim.git
git submodule init
git submodule update

cp .vim* -r ~
"""

if there is no exesting .git dir in your home, it's the best

""" bash
git clone https://github.com/CuiZhiying/cvim.git ~
git submodule init
git submodule update
rm .git -rf

"""

Then in vim
"""
PluginInstall

"""


