#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

/**
 * infinite_while - creates an infinite loop that sleeps for 1 second
 * Return: Always 0 (success)
 */
int infinite_while(void)
{
    while (1)
    {
        sleep(1);
    }
    return (0);
}

/**
 * main - creates 5 zombie processes
 * Return: Always 0 (success)
 */
int main(void)
{
    pid_t pid;
    int i;

    for (i = 0; i < 5; i++)
    {
        pid = fork();
        if (pid > 0)  // Parent process
        {
            printf("Zombie process created, PID: %d\n", pid);
        }
        else if (pid == 0)  // Child process
        {
            return (0); // Child exits immediately, becoming a zombie
        }
        else
        {
            perror("fork");
            return (1);
        }
    }

    infinite_while();
    return (0);
}
