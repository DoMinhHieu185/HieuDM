# Chapter 11: true, false and : commands(lệnh true, false và:)
### Section 11.1: Infinite Loop(Vòng lặp vô hạn)
```
while true; do
 echo ok
done
```
Hoặc
```
while :; do
 echo ok
done
```
Hoặc
```
until false; do
 echo ok
done
```

### Section 11.2: Function Return
```
function positive() {
 return 0
}
function negative() {
 return 1
}
```

### Section 11.3: Code that will always/never be executed(Code sẽ luôn luôn hoặc không bao giờ thực thi)
```
if true; then
 echo Luôn thực thi
fi
if false; then
 echo không được thực thi
fi
```

