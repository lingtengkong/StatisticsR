a = "I"

b = "am"

c = paste(a, b)

d = 1

print(c)

print(paste("d = ", d))

mylist = c(0, 2, d, b)

print(mylist)
print(mylist[1]) # start from 1
print(mylist[0])
print(mylist[5]) # NA
print(is.na(mylist[5]))

mylist[9] = "me" # R fills the gap

print(mylist)

yourlist = mylist[c(1, 2)] # 1, 2 elements

print(yourlist)

yourlist = mylist[seq(3,5)] # from 3 to 5 elements

print(yourlist)

yourlist = mylist[seq(7, 1, -1)] # inverse

print(yourlist)

hislist = c("red", "green", "blue")

print(hislist[c(TRUE, FALSE, TRUE)]) # print 1 and 3

print(length(hislist))

hislist = append(hislist, "white")
print(hislist)

for (item in hislist){
  print(paste("color is: ", item))
} # shift + enter to enter multiply lines in console

print(128 > 100)

my_number <- 128

if (my_number > 100){
  print(paste(my_number, "is large"))
} else if (my_number < 0){
  print(paste(my_number, "is negative"))
} else {
  print(paste(my_number, "is not large"))
}

# dictionaries
sounds <- c(
  "cat"="meow", 
  "dog"="woof", 
  "horse"="neigh"
)

cat_sound <- sounds["cat"]

print(cat_sound)
print(as.character(cat_sound))

sounds["cow"] <- "moo"

print(sounds)

for (thing in sounds){
  print(thing)
}

for (sound in names(sounds)){
  print(sound)
}

for (i in seq(1,length(sounds))){
  sound <- sounds[i]
  print(paste(names(sound), "goes", sound))
}

lines <- readLines(file("BeginningR.R"))

for (line in lines){
  print(line, quote=FALSE) # remove quote
}

for (line in lines){
  cat(line, sep="\n") # remove [1] and use \n to specify new line
}

a = "12"

print(1 + as.numeric(a))