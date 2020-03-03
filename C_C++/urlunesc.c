#include <stdio.h>
#include <stdlib.h>
#include <memory.h>

extern unsigned char* string_ascii_to_hex(const char* ascii, long len);

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        printf("missing url\n");
        printf("Usage: ./urlunesc https://github.com\n");
        return 0;
    }

    char* p = argv[1];
    int len = strlen(p);
    char* url = malloc(len + 1);
    char* pUrl = url;
    while (*p) {
        if (*p == '%') {
            if (p[1] >= 'A' && p[1] <= 'Z') {
                p[1] = p[1] - 'A' + 'a';
            }
            if (p[2] >= 'A' && p[2] <= 'Z') {
                p[2] = p[2] - 'A' + 'a';
            }
            unsigned char* hex = string_ascii_to_hex(p + 1, 2);
            *url = *hex;
            free(hex);
            p += 2;
        } else {
            *url = *p;
        }
        ++p;
        ++url;
    }
    *url = 0;
    printf("URL[%d]: %s\n", len, pUrl);
    free(pUrl);
    return 0;
}
