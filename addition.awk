#! /usr/bin/awk -f
BEGIN{
  FS=""
  largest_line=0
  count=1
}
{
  length_of_line=length($0)
  if(length_of_line > largest_line){
    largest_line=length_of_line
  }
  numbers[count]=$0
  count+=1
}

END{
  length_of_file=NR
  for(i=1;i<=length(numbers);i++){
    difference=largest_line-(length(numbers[i]))
    for(j=1;j<=difference;j++){
      numbers[i]=0""numbers[i]
    }
   # print numbers[i]
  }


  for(k=1;k<=length_of_file;k++){
    split(numbers[k],seperate_numbers,"")
    for(l=1;l<=largest_line;l++){
      add[l]=add[l]+seperate_numbers[l]
    }
  }

  for(i=1;i<=length(add);i++){
    #print add[i]
  }

  for(i=length(add);i>=1;i--){
    #print length(add)
    add[i]=remaining_digits+add[i]
    length_of_number=length(add[i])
    last_digit=substr(add[i],length_of_number,1)
    remaining_digits=substr(add[i],1,length_of_number-1)
    result=result""last_digit
    #sum=sum""last_digit
  }

  split(result,sum,"")

  for(i=length(sum);i>=1;i--){
    final_result=final_result""sum[i]
  }
  print remaining_digits""final_result

}

