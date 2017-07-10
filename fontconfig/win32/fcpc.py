# Simple script to generate pkg-config (.pc) file
# for gsettings-desktop-schemas

import os
import sys
import argparse

from replace import replace_multi
from pc_base import BasePCItems

def main(argv):
    base_pc = BasePCItems()
    fc_parser = argparse.ArgumentParser(description='Setup basic .pc file info')
    fc_parser.add_argument('--libxml2',
                           action='store_const',
                           const=1, default=0,
                           help='Create .pc for fontconfig')

    base_pc.setup(argv, fc_parser)

    fc_args = fc_parser.parse_args()
    if getattr(fc_args, 'libxml2', None) is 1:
        expat_cflags = ''
        expat_lib = ''
        libxml2_cflags = '-I${includedir}/libxml2'
        libxml2_lib = 'libxml2.lib'
    else:
        expat_cflags = ''
        expat_lib = '-lexpat'
        libxml2_cflags = ''
        libxml2_lib = ''

    fc_pc_replace_items = {'@sysconfdir@': '${prefix}/bin',
                           '@localstatedir@': '',
                           '@PACKAGE@': 'fontconfig',
                           '@BASECONFIGDIR@': '${sysconfdir}/fonts',
                           '@fc_cachedir@': '',
                           '@PKGCONFIG_REQUIRES@': 'freetype2',
                           '@PKGCONFIG_REQUIRES_PRIVATELY@': '',
                           '@FREETYPE_CFLAGS@': '',
                           '@FREETYPE_LIBS@': '-lfreetype',
                           '@ICONV_CFLAGS@': '',
                           '@ICONV_LIBS@': '-liconv',
                           '@EXPAT_CFLAGS@': expat_cflags,
                           '@LIBXML2_CFLAGS@': libxml2_cflags,
                           '@EXPAT_LIBS@': expat_lib,
                           '@LIBXML2_LIBS@': libxml2_lib}

    fc_pc_replace_items.update(base_pc.base_replace_items)

    # Generate fontconfig.pc
    replace_multi(base_pc.top_srcdir + '/fontconfig.pc.in',
                  base_pc.prefix + '/lib/pkgconfig/fontconfig.pc',
                  fc_pc_replace_items)

if __name__ == '__main__':
    sys.exit(main(sys.argv))
