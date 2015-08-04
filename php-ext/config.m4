PHP_ARG_WITH(score,
    [whether to enable the "score" extension],
    [  --enable-score          Enable "score" extension support])

if test "$PHP_SCORE" != "no"; then
    dnl SCORE_LIB_DIR=/usr/local/lib

    SEARCH_PATH="/usr/local /usr"
    SEARCH_FOR="/libscore.so"
    if test -r $PHP_SCORE/$SEARCH_FOR; then # path given as parameter
      SCORE_LIB_DIR=$PHP_SCORE
    else # search default path list
      AC_MSG_CHECKING([for pecl-example files in default path])
      for i in $SEARCH_PATH ; do
        if test -r $i/lib/$SEARCH_FOR; then
          SCORE_LIB_DIR=$i
          AC_MSG_RESULT(found in $i)
        fi
      done
    fi
    
    if test -z "$SCORE_LIB_DIR"; then
      AC_MSG_RESULT([not found])
      AC_MSG_ERROR([Please reinstall the score rust library])
    fi

    PHP_ADD_INCLUDE(./ffi.h)

    PHP_CHECK_LIBRARY(score, ext_score,
    [
        PHP_ADD_LIBRARY_WITH_PATH(score, $SCORE_LIB_DIR, SCORE_SHARED_LIBADD)
        AC_DEFINE(HAVE_SCORE, 1, [whether you have score])
    ],[
        AC_MSG_ERROR([ext_score function not found in libscore])
    ],[
        -L$SCORE_LIB_DIR -R$SCORE_LIB_DIR
    ])

    PHP_SUBST(SCORE_SHARED_LIBADD)
    PHP_NEW_EXTENSION(score, score.c, $ext_shared)
fi
