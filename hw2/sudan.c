#include <stdio.h>
int result;
int sudan(int m, int n, int k)
{
   if (k == 0)
      return m + n;
   else if (n == 0)
      return m;
   else
	   return sudan(sudan(m, n-1 ,k), sudan(m, n-1, k) + n, k-1);
}
int main(void){
    result = sudan(6, 5, 1);
    printf("%d\n", result);
    return 0;
}
