# Argument Parsing

A complete tutorial for the Argparse library can be found [here](https://docs.python.org/3/howto/argparse.html).

## Complete example 

```python
import argparse

def main():
    # Initializing the parser
    parser = argparse.ArgumentParser(description= 'Arguments parser')

    # Adding arguments to the parse
    parser.add_argument('-m','--mode', choices = ['train', 'test'], default = 'train', help= 'specify the execution mode')
    parser.add_argument('--cpu', action= 'store_true', help='indicate that the program is running on CPU')
    parser.add_argument('square', help='display a square of a given number', type=int)
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
```

## Command line usage

- Specify an argument:

    ```
    python args_parse.py -- mode test
    ```

- Get help and indications on what arguments are possible:

    ```
    python args_parse.py -h
    ```

## Useful optional arguments

- **type**: to specify the type of the argument.
- **action= 'store_true'**: to indicate that the argument doesn't need a value and is a boolean either true if specified or false if not.
- **short options**: see the `-m` example above. 