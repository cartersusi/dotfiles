import argparse
import subprocess
import sys

PROCESSES = {
    'news': ['NewsToday', 'NewsToday2', 'NewsTag']
}

def k_procs(process_names):
    try:
        ps = subprocess.Popen(('ps', 'ax'), stdout=subprocess.PIPE)
        output = subprocess.check_output(('grep', '-v', 'grep'), stdin=ps.stdout)
        ps.wait()

        output = output.decode('utf-8')

        for line in output.split("\n"):
            for process_name in process_names:
                if process_name in line:
                    pid = int(line.split(None, 1)[0])
                    print(f"Killing {process_name} with PID {pid}")
                    subprocess.run(['kill', str(pid)])
    except Exception as e:
        print(f"An error occurred: {e}")

def parse_args():
    parser = argparse.ArgumentParser(description='Process Killer')
    parser.add_argument('-n', '--news', action='store_true',
                        help='Kill all news-related processes.')
    args = parser.parse_args()
    return args

if __name__ == "__main__":
    args = parse_args()

    if args.news:
        k_procs(PROCESSES['news'])
    else:
        print("No arguments provided.")
        sys.exit(1)
