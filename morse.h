#ifndef MORSE_H_
#define MORSE_H_

#define false 0
#define true  1

typedef int boolean;

/*
 *  FAKE_SPACE IS MARKING FOR A SPACE
 */
#define FAKE_SPACE '/'

/*
 * THE CHARACTER THAT BETWEEN TWO MORSE STRING
 */
#define SEPARATOR ' '

#include <string.h>
#include <stdint.h>


typedef struct Morse Morse_t;
struct Morse{
	char c[9];
};

Morse_t* new_morse();

boolean str2morse(char m , Morse_t *morse);
boolean morse2str(Morse_t *morse, char *ch);

boolean mark2morse(char n, Morse_t *morse);
boolean morse2mark(Morse_t *morse, char *n);

boolean num2morse(char n, Morse_t *morse);
boolean morse2num(Morse_t *morse, char *n);

void morse_str_to_str(char *morse ,char *string, int buf_len);

void str_to_morse_str(char *string ,char *morse, int buf_len);

void str2lowcase(char *str, char *out, int buf_len);

#endif /* MORSE_H_ */
