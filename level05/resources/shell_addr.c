#include <stdio.h>

void main(int argc, char **argv, char **envp)
{
    int i;

    for (i = 0; i < 4; i++)
    {    

        printf("%1$p: %1$s\n", envp[i]);
    }
}