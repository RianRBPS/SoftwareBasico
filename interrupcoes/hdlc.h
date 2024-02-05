#ifndef HDLC_H



#include <stdlib.h>



//----------------------------------------------------------------------------

// Considere:

//   * size_t  -> unsigned long



struct handler_s {

  int input;

  int output;

  size_t size;

  char *buffer;

};



typedef struct handler_s handler_t;



void hdlc_init(handler_t *h, const char *filename, int flags);

void hdlc_release(handler_t *h);

int hdlc_encode(handler_t *h);



#endif

