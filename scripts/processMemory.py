'''
Converts an input file `TW_BW_out.dat` with lines of 128 bit numbers read 32 bits at time
in hex (32 bits per line is not required) to 128 bit numbers in hex to `out_TW_BW_out.dat`
In big endian, the high word is always 0xADD3
This is removed, leaving three words in the final output
'''
import argparse

parser = argparse.ArgumentParser(description='You can select which file to run over, and set the bit widths')
parser.add_argument('--input',   '-i', default='TW_BW_out.dat',    help = 'Input file to process')
parser.add_argument('--events',  '-n', default='1',                help = 'Number of events to write')
args = parser.parse_args()

indata = args.input
nevents = int(args.events)
outdata = indata.replace('dat', 'coe')
inlines = []
lines = []
tmp = []
with open(indata) as fin:
    inlines = fin.readlines()
count = 0
for line in inlines:
    if 'Event' in line: count = count + 1
if nevents > count:
    raise Exception('Please specify a number of events below {}!'.format(count))
lines.append('memory_initialization_radix=16;\n') # BX means new event
lines.append('memory_initialization_vector=')
nlines = 0
for line in inlines: # Read a line
    if nlines > nevents: break # Wrote as many as requested
    if 'BX' in line or line is inlines[-1]:
        nlines = nlines + 1
        if len(tmp) > 0:
            if line is inlines[-1]:
                lines.append(','.join(tmp + ['0']*(108 - len(tmp))))
            else:
                lines.append(','.join(tmp + ['0']*(108 - len(tmp)))+',' if line is not inlines[-1] else '')
            tmp = []
    else:
        tmp.append(line.split(' ')[-1].strip()[2:])
if ',' in lines[-1][-1]:
    lines[-1] = lines[-1][0:-1]
lines[-1] = lines[-1] + ';'
with open(outdata, 'w') as fout:
    fout.write(''.join(lines))
