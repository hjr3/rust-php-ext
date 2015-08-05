#include "php_score.h"

PHP_FUNCTION(score)
{
    char *choice;
    int choice_len;
    char *query;
    int query_len;

    if (zend_parse_parameters(ZEND_NUM_ARGS() TSRMLS_CC, "ss", &choice, &choice_len, &query, &query_len) == FAILURE) {
        return;
    }

    double s = ext_score(choice, choice_len, query, query_len);

    RETURN_DOUBLE(s);
}

ZEND_BEGIN_ARG_INFO_EX(arginfo_score, 0, 0, 1)
    ZEND_ARG_INFO(0, choice)
    ZEND_ARG_INFO(0, query)
ZEND_END_ARG_INFO()

zend_function_entry php_score_functions[] = {
    PHP_FE(score, arginfo_score)
    {NULL, NULL, NULL} /* must be the last line */
};

zend_module_entry score_module_entry = {
  STANDARD_MODULE_HEADER,
  PHP_SCORE_EXTNAME,
  php_score_functions,
  NULL, /* minit */
  NULL, /* mshutdown */
  NULL, /* rinit */
  NULL, /* rshutdown */
  NULL, /* minfo */
  PHP_SCORE_EXTVER,
  STANDARD_MODULE_PROPERTIES
};

#ifdef COMPILE_DL_SCORE
ZEND_GET_MODULE(score)
#endif
