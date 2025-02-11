#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

#define BUF_SIZE 4096

char *readline(const char *prompt)
{
	size_t prompt_len = strlen(prompt);
	if(prompt_len > 0)
	{
		write(STDOUT_FILENO, prompt, prompt_len);
	}

	char *line = mmap(NULL, BUF_SIZE,
			PROT_READ | PROT_WRITE,
			MAP_ANON | MAP_PRIVATE, -1, 0);
	int len = 0;
	if(line == MAP_FAILED)
	{
		return "";
	}

	char c = 0;
	while(c != '\n' && len+1 < BUF_SIZE)
	{
		read(STDIN_FILENO, &c, 1);
		if(c != '\n')
			line[len++] = c;
	}
	line[len] = 0;

	return line;
}

