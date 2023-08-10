/* Dynamic Programming implementation of LCS problem */
#include<iostream>
#include<cstring>
#include<cstdlib>
#include<algorithm>
using namespace std;

char SequenceA[] = "ACGTTCGCGACA";
char SequenceB[] = "ATCGATGCGC";
const int SASize = 12;
const int SBSize = 10;

/* Returns length of LCS for SequenceA[0..m-1], SequenceB[0..n-1] */
void lcs()
{
  int L[SASize+1][SBSize+1];
 
  /* Following steps build L[m+1][n+1] in bottom up fashion. Note
    that L[i][j] contains length of LCS of SequenceA[0..i-1] and SequenceB[0..j-1] */
  for (int i=0; i<=SASize; i++)
  {
    for (int j=0; j<=SBSize; j++)
    {
      if (i == 0 || j == 0)
        L[i][j] = 0;
      else if (SequenceA[i-1] == SequenceB[j-1])
        L[i][j] = L[i-1][j-1] + 1;
      else
        L[i][j] = max(L[i-1][j], L[i][j-1]);
    }
  }
 
  // Print the lcs
  cout << "Found LCS length : " << L[SASize][SBSize] << "\n";
}
 
int main()
{
  lcs();
  return 0;
}