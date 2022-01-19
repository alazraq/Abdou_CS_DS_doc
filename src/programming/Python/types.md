# Python types tips

## String

- **Line feed \n (lf) vs carriage return line feed \r (clrf) :** 
    - A line feed means moving one line forward. The code is **\n**.
    - A carriage return means moving the cursor to the beginning of the line. The code is **\r**.
    - Windows editors often still use the combination of both as \r\n in text files. Unix uses mostly only the \n.
    - The separation comes from typewriter times, when you turned the wheel to move the paper to change the line and moved the carriage to restart typing on the beginning of a line. This was two steps.