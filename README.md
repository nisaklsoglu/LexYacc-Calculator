# LexYacc-Calculator

## Overview
This project implements a simple arithmetic calculator using **Lex (Flex) and Yacc (Bison)**. The calculator supports basic arithmetic operations, parentheses, and handles invalid inputs gracefully. The program reads mathematical expressions from the user, parses them, evaluates the result, and prints the output immediately.

## Features
- Supports integer numbers.
- Recognizes arithmetic operators: `+`, `-`, `*`, `/`.
- Handles parentheses for order of operations.
- Evaluates expressions in real-time without requiring EOF (CTRL+D).
- Includes error handling for invalid inputs and division by zero.

## Design Decisions
1. **Tokenization (Lex)**:
   - The **Lex file (`calculator.l`)** is responsible for recognizing numbers, arithmetic operators, and whitespace.
   - It assigns appropriate tokens to operators and numbers.
   - Ignores spaces and invalid characters, printing an error for unexpected inputs.

2. **Parsing & Evaluation (Yacc)**:
   - The **Yacc file (`calculator.y`)** defines a grammar for arithmetic expressions.
   - Operator precedence is set using `%left` to ensure correct evaluation order.
   - Includes a `while` loop to process user input continuously.
   - Uses an error-handling function (`yyerror`) to notify users of incorrect expressions.

3. **Real-Time Execution**:
   - Instead of waiting for EOF (CTRL+D), the parser evaluates expressions as they are entered.
   - A `while` loop in `main()` ensures immediate execution after every valid input.

## Implementation Steps
### 1. Create `calculator.l` (Lex file)
   - Define regular expressions to identify numbers and operators.
   - Assign token values and return them to the parser.
   - Ignore whitespace and handle invalid characters.

### 2. Create `calculator.y` (Yacc file)
   - Define the grammar for arithmetic expressions.
   - Implement actions to evaluate expressions.
   - Add precedence rules to resolve shift/reduce conflicts.
   - Handle division by zero errors.
   - Ensure expressions are evaluated and printed immediately.

### 3. Compile and Run the Program
1. **Compile Yacc (Bison) file:**
     bison -d calculator.y
  
2. **Compile Lex (Flex) file:**
     lex calculator.l
  
3. **Compile using GCC:**
     gcc lex.yy.c y.tab.c -o calculator -ll

4. **Run the calculator:**
     ./calculator


## Usage
Once the program starts, you can enter mathematical expressions such as:
3 + 5
Output: 8

(10 - 4) * 2
Output: 12

10 / 0
Output: Error: Division by zero!
To exit, press **CTRL+D**.

## Error Handling
- **Invalid characters:** Prints an error message for unrecognized input.
- **Division by zero:** Prints an error message and prevents crashing.
- **Mismatched parentheses:** Returns a syntax error.


