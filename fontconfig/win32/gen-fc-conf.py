# Simple utility script to generate fonts.conf

import os
import sys

from pc_base import BasePCItems
from replace import replace_multi

def main(argv):
    base_pc = BasePCItems()

    base_pc.setup(argv)
    fc_conf_replace_items = {'@FC_DEFAULT_FONTS@': 'WINDOWSFONTDIR',
                             '@FC_FONTPATH@': '',
                             '@CONFIGDIR@': base_pc.prefix + '/bin/fonts/conf.d',
                             '@FC_CACHEDIR@': 'LOCAL_APPDATA_FONTCONFIG_CACHE'}

    fc_conf_replace_items.update(base_pc.base_replace_items)
    replace_multi(base_pc.top_srcdir + '/fonts.conf.in',
                  base_pc.prefix + '/bin/fonts/fonts.conf',
                  fc_conf_replace_items)

if __name__ == '__main__':
    sys.exit(main(sys.argv))