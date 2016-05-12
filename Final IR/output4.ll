; ModuleID = 'output4.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [36 x i8] c"rand1 = %d, rand2 = %d, rand3 = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @diff(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @randomStuff(i32 %a, i32 %b, i32 %c, i32 %d) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %temp1 = alloca i32, align 4
  %temp2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = call i32 @diff1(i32 %5)
  store i32 %6, i32* %temp1, align 4
  %7 = load i32* %2, align 4
  %8 = load i32* %3, align 4
  %9 = call i32 @diff(i32 %7, i32 %8)
  store i32 %9, i32* %temp2, align 4
  %10 = load i32* %temp1, align 4
  %11 = load i32* %temp2, align 4
  %12 = mul nsw i32 %10, %11
  %13 = load i32* %4, align 4
  %14 = mul nsw i32 %12, %13
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %rand1 = alloca i32, align 4
  %rand2 = alloca i32, align 4
  %rand3 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 11, i32* %a, align 4
  store i32 13, i32* %b, align 4
  store i32 17, i32* %c, align 4
  store i32 19, i32* %d, align 4
  %2 = load i32* %c, align 4
  %3 = load i32* %d, align 4
  %4 = call i32 @randomStuff2(i32 %2, i32 %3)
  store i32 %4, i32* %rand1, align 4
  %5 = load i32* %a, align 4
  %6 = call i32 @randomStuff3(i32 %5)
  store i32 %6, i32* %rand2, align 4
  %7 = load i32* %a, align 4
  %8 = load i32* %b, align 4
  %9 = load i32* %c, align 4
  %10 = load i32* %d, align 4
  %11 = call i32 @randomStuff(i32 %7, i32 %8, i32 %9, i32 %10)
  store i32 %11, i32* %rand3, align 4
  %12 = load i32* %rand1, align 4
  %13 = load i32* %rand2, align 4
  %14 = load i32* %rand3, align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str, i32 0, i32 0), i32 %12, i32 %13, i32 %14)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @diff1(i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 10, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define internal i32 @randomStuff2(i32 %c, i32 %d) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %temp1 = alloca i32, align 4
  %temp2 = alloca i32, align 4
  store i32 1, i32* %1, align 4
  store i32 3, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = call i32 @diff14(i32 %5)
  store i32 %6, i32* %temp1, align 4
  %7 = load i32* %2, align 4
  %8 = load i32* %3, align 4
  %9 = call i32 @diff(i32 %7, i32 %8)
  store i32 %9, i32* %temp2, align 4
  %10 = load i32* %temp1, align 4
  %11 = load i32* %temp2, align 4
  %12 = mul nsw i32 %10, %11
  %13 = load i32* %4, align 4
  %14 = mul nsw i32 %12, %13
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define internal i32 @randomStuff3(i32 %d) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %temp1 = alloca i32, align 4
  %temp2 = alloca i32, align 4
  store i32 5, i32* %1, align 4
  store i32 6, i32* %2, align 4
  store i32 7, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = call i32 @diff15(i32 %5)
  store i32 %6, i32* %temp1, align 4
  %7 = load i32* %2, align 4
  %8 = load i32* %3, align 4
  %9 = call i32 @diff(i32 %7, i32 %8)
  store i32 %9, i32* %temp2, align 4
  %10 = load i32* %temp1, align 4
  %11 = load i32* %temp2, align 4
  %12 = mul nsw i32 %10, %11
  %13 = load i32* %4, align 4
  %14 = mul nsw i32 %12, %13
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define internal i32 @diff14(i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 10, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define internal i32 @diff15(i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 10, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub nsw i32 %3, %4
  ret i32 %5
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
