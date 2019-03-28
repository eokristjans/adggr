 /* 
 * File:   main.cpp
 * Author: Erling Óskar Kristjánsson eok4@hi.is
 */

#include <cstdlib>
#include <stdio.h> 
 
// Returns true if there is a subset of set[] with sun equal to given sum 
bool isSubsetSumRecurse(int set[], int n, int sum) 
{ 
   // Base Cases 
   if (sum == 0) 
     return true; 
   if (n == 0 && sum != 0) 
     return false; 
  
   // If last element is greater than sum, then ignore it 
   if (set[n-1] > sum) 
     return isSubsetSumRecurse(set, n-1, sum); 
  
   /* else, check if sum can be obtained by any of the following 
      (a) including the last element 
      (b) excluding the last element   */
   return isSubsetSumRecurse(set, n-1, sum) ||  
                        isSubsetSumRecurse(set, n-1, sum-set[n-1]); 
} 



// A Dynamic Programming solution for subset sum problem 
// Returns true if there is a subset of set[] with sun equal to given sum 
bool isSubsetSumDP(int set[], int n, int sum) 
{ 
    // The value of subset[i][j] will be true if there is a  
    // subset of set[0..j-1] with sum equal to i 
    bool subset[n+1][sum+1]; 
   
    // If sum is 0, then answer is true 
    for (int i = 0; i <= n; i++) 
      subset[i][0] = true; 
   
    // If sum is not 0 and set is empty, then answer is false 
    for (int i = 1; i <= sum; i++) 
      subset[0][i] = false; 
   
     // Fill the subset table in botton up manner 
     for (int i = 1; i <= n; i++) 
     { 
       for (int j = 1; j <= sum; j++) 
       { 
         if(j<set[i-1]) 
         subset[i][j] = subset[i-1][j]; 
         if (j >= set[i-1]) 
           subset[i][j] = subset[i-1][j] ||  
                                 subset[i - 1][j-set[i-1]]; 
       } 
     } 
   
     /*   // uncomment this code to print table 
     for (int i = 0; i <= n; i++) 
     { 
       for (int j = 0; j <= sum; j++) 
          printf ("%4d", subset[i][j]); 
       printf("\n"); 
     }*/
   
     return subset[n][sum]; 
} 
   
// Driver program to test above function 
int main() 
{ 
  int set[] = {242, 188, 193, 234, 173, 663, 310, 270, 377, 294, 473, 299, 286, 227, 273, 322, 485, 262, 204, 225, 448, 350, 181, 674, 309, 680, 361, 196, 200, 396, 312, 431, 496, 222, 224, 686, 323, 257, 822, 615, 441, 339, 400, 771, 334, 206, 374, 228, 463, 190, 343, 609, 512, 260, 326, 201, 346, 306, 645, 349, 415, 468, 543, 385, 412, 384, 373, 325, 168, 328, 219, 416, 169, 290, 345, 330, 944, 253, 382, 221, 459, 292, 239, 479, 317, 251, 287, 213, 184, 237, 274, 602, 295, 238, 230, 240, 465, 555, 461, 703, 279, 233, 176, 272, 357, 291, 324, 161, 366, 380, 311, 513, 657, 564, 390, 531, 175, 500, 268, 546, 329, 199, 121, 304, 183, 289, 975, 392, 442, 444, 661, 303, 283, 248, 220, 247, 683, 355, 498, 399, 379, 650, 258, 348, 378, 428, 305, 368, 207, 453, 319, 525, 182, 539, 249, 687, 145, 699, 214, 244, 243, 921, 250, 266, 217, 489, 235, 474, 656, 490, 197, 164, 372, 353, 318, 365, 747, 579, 558, 335, 450, 314, 278, 740, 195, 271, 344, 158, 553, 297, 606, 336, 604, 229, 282, 246, 254, 563, 574, 659, 327, 522, 414, 352, 446, 177, 425, 475, 277, 951, 623, 514, 342, 218, 332, 245, 211, 375, 632, 293, 577, 381, 362, 300, 156, 226, 370, 493, 205, 284, 359, 573, 179, 482, 148, 421, 405, 457, 170, 433, 341, 432, 852, 167, 301, 532, 180, 189, 340, 315, 149, 685, 367, 464, 477, 160, 212, 133, 376, 628, 591, 458, 209, 589, 174, 172, 637, 333, 364, 231, 420, 351, 154, 391, 261, 526, 288, 559, 585, 584, 582, 358, 298, 252, 715, 560, 394, 467, 466, 644, 369, 255, 398, 285, 388, 544, 259, 275, 460, 789, 265};
  int sum = 63000; 
  int n = sizeof(set)/sizeof(set[0]); 
    
  if(isSubsetSumRecurse(set, n, sum) == true)
      printf("Found a subset with given sum using Recursion");
  else
     printf("No subset with given sum using Recursion"); 
  
  return 0; 
} 

/*
 https://www.geeksforgeeks.org/subset-sum-backtracking-4/
 https://www.geeksforgeeks.org/subset-sum-problem-dp-25/
 https://www.geeksforgeeks.org/perfect-sum-problem-print-subsets-given-sum/
 * 
 * Spurning með að summa upp og skoða minnst 10 eignir saman til að minnka endurkvæmni
 */