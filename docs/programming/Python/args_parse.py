import argparse

def main():
    # Initializing the parser
    parser = argparse.ArgumentParser(description= 'Arguments parser')

    # Adding arguments to the parse
    parser.add_argument('-m','--mode', choices = ['train', 'test'], default = 'train', help= 'specify the execution mode')
    parser.add_argument('--cpu', action= 'store_true', help='indicate that the program is running on CPU')
    parser.add_argument('--square', help='display a square of a given number', type=int)
    # Parsing arguments and using them
    args = parser.parse_args()

    if args.cpu:
        print('CPU in use.')
    if args.mode == 'test':
        print('Test mode in use.')
    if args.square:
        print(args.square**2)

if __name__ == '__main__':
    main()