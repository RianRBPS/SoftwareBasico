#include <stdlib.h>

#include <stdio.h>

#include <fcntl.h>

#include <unistd.h>



#include "hdlc.h"



char start = 0x7E;

char escape1[2] = {0x7D, 0x5E};



void hdlc_init(handler_t *h, const char *filename, int flags)

{

    // 0600 octal = 0x180 hexadecimal

    h->output = open(filename, flags, 0600);

}



/*

 * Esse não é o HDLC completo, apenas um trecho para este laboratório.

 */

int hdlc_encode(handler_t *h)

{

    char b;

    int r;



    r = write(h->output, &start, 1);

    if (r != 1) { return 0; }



    for (int i = 0; i < h->size; i++) {

        b = h->buffer[i];

        if (b == 0x7E) {

            r = write(h->output, &escape1, 2);

            if (r != 2) { return 0; }

            continue;

        }

        r = write(h->output, &b, 1);

        if (r != 1) { return 0; }

    }

    return 1;

}



void hdlc_release(handler_t *h)

{

    close(h->output);

}