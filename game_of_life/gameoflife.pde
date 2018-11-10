class gameoflife{

int w = 10 ;
int rows ;
int colloms;
int grid[][];
int gen =0;


gameoflife(){

rows = height/w;
colloms = width/w;

grid = new int[rows][colloms];

}

void startrand(){

for (int i =0 ;i<rows;i++){// could use grid.length

  for(int j =0 ;j<colloms;j++){// could use grid[1].length
  
    grid[i][j] = (int)random(0,2);
  }
}
}

void start(){

grid[rows/2+1][colloms/2]=1;
grid[rows/2-1][colloms/2]=1;
grid[rows/2][colloms/2]=1;


}



void display(){
fill(0);
for (int i =0 ;i<rows;i++){// could use grid.length

  for(int j =0 ;j<colloms;j++){// could use grid[1].length
  
    if(grid[i][j] ==1){
        
      noStroke();
      rect(j*w,i*w,w,w);
    }
  }
}

}

void nextgen(){
  int next[][] = new int[rows][colloms]; // here we use  a new array to stroe the info about the next gen cause so that we dont edit the current gen befoure we calucalte all of the next gen

 
// also starting at 1 to length-1 cause of not wanting to use the edages 
for (int i =1 ;i<rows-1;i++){// could use grid.length

  for(int j =1 ;j<colloms-1;j++){// could use gird[1].length  
        
    
    next[i][j]= check(i,j,grid[i][j]);
    
    
  }
}

grid = next; // setting current gen to next gen move gen by 1
gen++;      // just there if you wanted the gen number
}



int check(int i ,int j,int current){
  int n =0 ;// n is the number of neighbors
// game of life calucation rules  
// any cell with less than 2 n dies
  // any cell with more than 3 n dies
  // if a dead cell had n =3 then it becomes 1

// checks what the cells next sate will be
if ( grid[i-1][j]==1){ n++;       }
if ( grid[i+1][j]==1){ n++;       }
if ( grid[i][j-1]==1){ n++;       }   // checking all cells around the cell the given one 
if ( grid[i][j+1]==1){ n++;       }   // and counting the number then applying game of life 
if ( grid[i-1][j-1]==1){ n++;     }  // rules .
if ( grid[i+1][j-1]==1){ n++;       }
if ( grid[i-1][j+1]==1){ n++;       }
if ( grid[i+1][j+1]==1){ n++;       }

if (n<2){  return 0; }  // returns 0 death due to lack of company 
if (n>3){ return 0;  } // returns 0 death due to overpoplution
if (n==3){return 1;} // any dead cell with n = 3 come backt o life and if its live n = 3 it satys 1
if (n==2){return current;}  // if its n=2 stay in current state 


return 0;  // if some how this shit does not work return 0 to kill that cell
}



}
