import os
import signal
import sys

def signal_handler(signal, frame):
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

for strategy in ['dfs', 'cfg_result', 'random', 'random_input']:
    for i in xrange(1, 10001):
        print '{0}/input.{1}'.format(strategy, i)
        with open('{0}/input.{1}'.format(strategy, i), 'r') as f:
            argv = []
            numbers = map(lambda x: int(x), f.read().splitlines()[1::2])
            if len(numbers) > 0:
                argc = numbers.pop(0)
                for j in xrange(1, argc):
                    try:
                        arg_len = numbers.pop(0)
                    except IndexError:
                        break
                    arg = ''
                    for k in xrange(0, arg_len):
                        try:
                            ch = numbers.pop(0)
                            if ch < 0:
                                ch += 256
                            if ch == 0:
                                break
                            arg += chr(ch)
                        except IndexError:
                            break
                    else:
                        argv.append(arg)

                is_optarg = False
                non_options = 0
                for j in xrange(0, len(argv)):
                    if not is_optarg:
                        if argv[j] in ['-A', '-B', '-X', '-e', '-f']:
                            is_optarg = True
                        elif not argv[j].startswith('-'):
                            non_options += 1
                            if non_options == 2:
                                argv[j] = 'regex.h'
                    else:
                        isoptarg = False
            cmd = './grep_orig ' + ' '.join(map(lambda x: '"{0}"'.format(x), argv))
            os.system(cmd)
