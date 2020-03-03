#include <stdlib.h>
#include <memory.h>
#include <string.h>

#define IN
#define OUT

typedef unsigned long long MUInt64;
typedef unsigned char	   MByte;

char hex_to_ascii(unsigned char c)
{
	if (c > 9) {
		c = c - 0x0A + 'a';
	}
	else {
		c += '0';
	}
	return c;
}

unsigned char ascii_to_hex(char c)
{
	if (c > '9') {
		c = c - 'a' + 0x0A;
	}
	else {
		c -= '0';
	}
	return c;
}

/**
 * @brief: transform hex to ascii.
 */
const char* string_hex_to_ascii(const MByte* hex, long len)
{
	long i = 0;
	char c;
	char* str = (char*)malloc(2*len + 1);

	while (i < len) {
		c = hex[i] >> 4;
		str[2*i] = hex_to_ascii(c);

		c = hex[i] & 0x0F;
		str[2*i + 1] = hex_to_ascii(c);

		++i;
	}

	str[2*i] = '\0';
	return str;
}

/**
* @brief: transform ascii to hex.
*/
unsigned char* string_ascii_to_hex(const char* ascii, long len)
{
	long i = 0;
	long hexlen = (len + 1) / 2;
	unsigned char high;
	unsigned char low;
	unsigned char* str = (unsigned char*)malloc(hexlen);

	while (i < hexlen) {
		high = ascii_to_hex(ascii[2*i]);
		if ((2*i + 1) < len) {
			low = ascii_to_hex(ascii[2*i + 1]);
		}
		else {
			low = 0;
		}

		str[i] = high * 0x10 + low;
		++i;
	}

	return str;
}

/**
 * @brief: exclusive or a hex string.
 */
char* string_hex_str_xor(const char* str, unsigned char u)
{
	long i = 0;
	long len = strlen(str);
	long xorlen = (len + 1) / 2;
	unsigned char* hex = string_ascii_to_hex(str, len);
	char* xorchar;

	while (i < xorlen) {
		hex[i++] ^= u;
	}
	xorchar = string_hex_to_ascii(hex, xorlen);
	free(hex);
	return xorchar;
}

/**
 * @brief: exclusive or a hex string extended version.
 */
char* string_hex_str_xor_ex(const char* str)
{
	long i;
	long off = 0;
	long len = strlen(str);
	unsigned char u[] = {0xca, 0xfe, 0xba, 0xbe};
	long xor_block_len = sizeof(u);
	unsigned char* hex = (unsigned char*)malloc((len + 1) / 2);
	unsigned char* tmp;
	char* xorchar;

	while (*str != '\0') {
		i = 0;
		tmp = string_ascii_to_hex(str, xor_block_len * 2);
		while (i < xor_block_len) {
			tmp[i] ^= u[i];
			++i;
		}
		memcpy(hex + off, tmp, xor_block_len);
		free(tmp);
		off += xor_block_len;
		str += xor_block_len * 2;
	}

	xorchar = string_hex_to_ascii(hex, (len + 1) / 2);
	free(hex);
	return xorchar;
}

/**
 * @brief: append two strings together and return a newly allocated string.
 */
char* string_append(const char* s1, const char* s2)
{
	int s1_len;
	int s2_len;
	char *pszNewStr;

	s1_len = strlen(s1);
	s2_len = strlen(s2);

	pszNewStr = (char*)malloc(s1_len + s2_len +1);
	if (NULL == pszNewStr) {
		return NULL;
	}
	
	strcpy(pszNewStr, s1);
	strcpy(pszNewStr + s1_len, s2);
	return pszNewStr;
}

/**
 * @brief: get the offset of a char.
 * @return: offset(starts from 0) of a char. -1 when the char does not exist.
 */
int string_get_char_offset(const char* s, char c, int occurence)
{
	int off = 0;
	
	if (0 == occurence) {
		return -1;
	}

	while (s[off] != '\0') {
		if (s[off] == c) {
			if (--occurence == 0) {
				return off;
			}
		}
		++off;
	}

	return -1;
}

/**
 * @brief: get the numth word in a string seperated by a char.
 * @param: numth starts from 1.
 * @return: a newly allocated buffer pointer points to the word. NULL: not enough words in the string.
 */
char* string_get_word(IN const char* s, char seperator, int numth)
{
	int len = 0;
	const char* start = s;
	char* pszWord;

	while (*s != '\0') {
		if (*s == seperator) {
			if (s == start) { // the string starts with a seperator
				start = ++s;
				continue;
			}
			if (--numth == 0) {
				break;
			}
			if (numth == 1) {
				start = s + 1;
			}
		}
		++s;
	}

	len = s - start;
	pszWord = (char*)malloc(len + 1);
	if (NULL == pszWord) {
		return NULL;
	}
	strncpy(pszWord, start, len);
	pszWord[len] = '\0';

	return pszWord;
}

/**
 * @brief: get the number of words in a string seperated by a char.
 * @return: the number of words in a string.
 */
int string_get_word_num(const char* s, char seperator)
{
	char is_prev_sep = 1;
	int num = 0;

	while (*s != '\0') {
		if (*s == seperator) {
			is_prev_sep = 1;
		}
		else {
			if (is_prev_sep) {
				++num;
				is_prev_sep = 0;
			}
		}
		++s;
	}

	return num;
}

/**
 * @brief: get the last word in a string seperated by a char.
 * @return: the last word in a string.
 */
char* string_get_last_word(const char* s, char seperator)
{
	int len = 0;
	const char* start = s;
	const char* end = s;
	char* pszWord;
	char is_prev_sep = 1;
	char is_prev_word = 0;

	while (*s != '\0') {
		if (*s == seperator) {
			is_prev_sep = 1;
			if (is_prev_word) {
				end = s;
				is_prev_word = 0;
			}
		}
		else {
			if (is_prev_sep) {
				start = s;
				is_prev_sep = 0;
				is_prev_word = 1;
			}
			end = s;
		}
		++s;
	}

	len = end - start;
	pszWord = (char*)malloc(len + 1);
	if (NULL == pszWord) {
		return NULL;
	}
	strncpy(pszWord, start, len);
	pszWord[len] = '\0';

	return pszWord;
}

/**
 * @brief: transform an unsigned number to a string
 * @return: the string.
 */
char* string_number_to_string(MUInt64 n)
{
	int c = 19;
	char* s;

	s = (char*)malloc(21);
	if (NULL == s) {
		return NULL;
	}
	s[20] = '\0';
	
	while (n) {
		s[c--] = n % 10 + '0';
		n /= 10;
	}

	strcpy(s, s + c + 1);
	return s;
}
