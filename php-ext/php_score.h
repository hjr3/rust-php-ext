#ifndef PHP_SCORE_H

#define PHP_SCORE_H

#define PHP_SCORE_EXTNAME "score"
#define PHP_SCORE_EXTVER  "1.0"

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"

extern zend_module_entry score_module_entry;
#define phpext_score_ptr &score_module_entry

extern double ext_score(unsigned char *, unsigned int, unsigned char *, unsigned int);

#endif
