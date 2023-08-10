// Refernce : https://www.geeksforgeeks.org/kmp-algorithm-for-pattern-searching/
#include<iostream>
#include<cstring>
#include<cstdlib>
using namespace std;

char txt[] = "ABABDABACDABABCABABC";
char pat[] = "ABABC";
const int patternSize = 5;
const int inputSize = 20;

void computeLPSArray(char* pat, int M, int* lps){
    int len = 0;
    lps[0] = 0;
  
    int i = 1;
    while (i < M) {
        if (pat[i] == pat[len]) {
            len++;
            lps[i] = len;
            i++;
        }
        else {
            if (len != 0) {
                len = lps[len - 1];
            } 
            else {
                lps[i] = 0;
                i++;
            }
        }
    }
}

void KMPSearch(){
    int lps[patternSize];

    computeLPSArray(&pat[0], patternSize, &lps[0]);

    int i = 0;
    int j = 0; 
    while (i < inputSize) {
        if (pat[j] == txt[i]) {
            j++;
            i++;
        }
        if (j == patternSize) {
            printf("Found pattern at index %d \n", i - j);
            j = lps[j - 1];
        } 
        else if (i < inputSize && pat[j] != txt[i]) {
            if (j != 0)
                j = lps[j - 1];
            else
                i = i + 1;
        }
    }
}
  
int main(){
    KMPSearch();
    return 0;
}