/*Write a C program to simulate the following DFA 0 follow by 1. The program should read a string from the user and print "Valid" if it is accepted by the DFA, otherwise print "Invalid".*/

#include <stdio.h>

void main()
{
    char pat[50], ch, *str;

    int state = 1;
    printf("Enter the string: ");
    scanf("%s", pat);
    str = pat;
    while (*str != '\0')
    {
        ch = *str;
        switch (ch)
        {
        case '0':
            if (state == 1)
            {
                state = 1;
            }
            else
            {
                state = 3;
            }

            break;

        case '1':
            if (state == 1)
            {
                state = 2;
            }
            else
            {
                state = 3;
            }
            break;

        default:
            break;
        }

        str++;
    }
    if (state == 2)
    {
        printf("Valid\n");
    }
    else
    {
        printf("Invalid\n");
    }
}