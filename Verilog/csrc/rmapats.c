// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

scalar dummyScalar;
scalar fScalarIsForced=0;
scalar fScalarIsReleased=0;
scalar fScalarHasChanged=0;
scalar fForceFromNonRoot=0;
scalar fNettypeIsForced=0;
scalar fNettypeIsReleased=0;
void  hsG_0 (struct dummyq_struct * I1020, EBLK  * I1021, U  I723);
void  hsG_0 (struct dummyq_struct * I1020, EBLK  * I1021, U  I723)
{
    U  I1252;
    U  I1253;
    U  I1254;
    struct futq * I1255;
    I1252 = ((U )vcs_clocks) + I723;
    I1254 = I1252 & 0xfff;
    I1021->I656 = (EBLK  *)(-1);
    I1021->I660 = I1252;
    if (I1252 < (U )vcs_clocks) {
        I1253 = ((U  *)&vcs_clocks)[1];
        sched_millenium(I1020, I1021, I1253 + 1, I1252);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I723 == 1)) {
        I1021->I661 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I656 = I1021;
        peblkFutQ1Tail = I1021;
    }
    else if ((I1255 = I1020->I985[I1254].I673)) {
        I1021->I661 = (struct eblk *)I1255->I672;
        I1255->I672->I656 = (RP )I1021;
        I1255->I672 = (RmaEblk  *)I1021;
    }
    else {
        sched_hsopt(I1020, I1021, I1252);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
