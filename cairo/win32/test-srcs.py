#!/usr/bin/env python3

import os
import sys
import re

def main(argv):
    if (len(argv) < 5):
        sys.exit ('Usage: %s type mode output_filename input_filename [input_filename1]...' % argv[0])

    type = argv[1]
    if type != 'boilerplate' and type != 'test':
        sys.exit('type must be \'boilerplate\' or \'test\'')

    mode = argv[2]
    if mode != 'call' and mode != 'extern':
        sys.exit('mode must be \'call\' or \'extern\'')

    out_file = argv[3]
    with open(out_file, 'a') as out:
        files = argv[4:]
        for file in files:
            with open(os.path.join('..', type, file), 'r') as f:
                lines = f.readlines()
                for l in lines:
                    check_type = ''
                    if type == 'boilerplate':
                        check_type = 'BOILERPLATE'
                    if type == 'test':
                        check_type = 'TEST'
                    line_match = re.match('\s*CAIRO_' + check_type + '\s*\(.*', l)

                    if line_match is not None:
                        result = []
                        if mode == 'call':
                            tmp_result = re.sub(r'\s*CAIRO_' + check_type + '\s*\(', r'    _register_', line_match.group(0))
                            result = re.sub(r',.*', r' ();', tmp_result)
                        if mode == 'extern':
                            tmp_result = re.sub(r'\s*CAIRO_' + check_type + '\s*\(', r'extern void _register_', line_match.group(0))
                            result = re.sub(r',.*', r' (void);', tmp_result)
                        out.write(result + '\n')

if __name__ == '__main__':
    sys.exit(main(sys.argv))