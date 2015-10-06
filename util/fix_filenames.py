#!/usr/bin/env python
import argparse
import logging
import os.path

logging.basicConfig(format='%(levelname)s: %(message)s')
LOGGER = logging.getLogger(__name__)
LOGGER.setLevel(logging.WARNING)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('filename')
    args = parser.parse_args()
    with open(args.filename) as statfile:
        stats = statfile.readlines()
    statiter = iter(stats)
    fixedstats = []
    for fileline, statline in zip(statiter, statiter):
        LOGGER.debug('parsing fileline: %s', fileline)
        LOGGER.debug('statline: %s', statline)
        num, name = fileline.split(':')
        name = name.rstrip('\n')
        fixedname = os.path.normpath(name)
        fixedname = fixedname.replace('\\', '/')
        if fixedname != name:
            LOGGER.info('changing %s to %s', name, fixedname)
            fileline = '{}:{}\n'.format(num, fixedname)
        else:
            LOGGER.debug('no fix required')
        if not os.path.exists(fixedname):
            LOGGER.warning('%s does not exist', fixedname)
        fixedstats.append(fileline)
        fixedstats.append(statline)
    with open(args.filename, 'w') as statfile:
        statfile.writelines(fixedstats)

if __name__ == '__main__':
    main()
