; ModuleID = 'example3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [48 x i8] c"prod1 = %d, prod2 = %d, prod3 = %d, prod4 = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @multiply(i32 %x, i32 %y, i32 %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %z, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = load i32* %2, align 4
  %6 = mul nsw i32 %4, %5
  %7 = load i32* %3, align 4
  %8 = mul nsw i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @sub(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %diff1 = alloca i32, align 4
  %diff2 = alloca i32, align 4
  %diff3 = alloca i32, align 4
  %prod1 = alloca i32, align 4
  %prod2 = alloca i32, align 4
  %prod3 = alloca i32, align 4
  %prod4 = alloca i32, align 4
  store i32 10, i32* %a, align 4
  store i32 20, i32* %b, align 4
  store i32 30, i32* %c, align 4
  %1 = load i32* %a, align 4
  %2 = load i32* %b, align 4
  %3 = load i32* %c, align 4
  %4 = call i32 @multiply(i32 %1, i32 %2, i32 %3)
  store i32 %4, i32* %prod1, align 4
  %5 = load i32* %b, align 4
  %6 = load i32* %c, align 4
  %7 = call i32 @multiply1(i32 100, i32 %5, i32 %6)
  store i32 %7, i32* %prod2, align 4
  %8 = load i32* %prod1, align 4
  %9 = load i32* %prod2, align 4
  %10 = call i32 @sub(i32 %8, i32 %9)
  store i32 %10, i32* %diff1, align 4
  %11 = load i32* %diff1, align 4
  %12 = call i32 @sub2(i32 100, i32 %11)
  store i32 %12, i32* %diff2, align 4
  %13 = load i32* %diff2, align 4
  %14 = call i32 @multiply3(i32 15, i32 %13, i32 25)
  store i32 %14, i32* %prod3, align 4
  %15 = call i32 @multiply4(i32 2, i32 3, i32 4)
  store i32 %15, i32* %prod4, align 4
  %16 = load i32* %prod1, align 4
  %17 = load i32* %prod2, align 4
  %18 = load i32* %prod3, align 4
  %19 = load i32* %prod4, align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str, i32 0, i32 0), i32 %16, i32 %17, i32 %18, i32 %19)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @multiply1(i32 %x, i32 %y, i32 %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 100, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %z, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = load i32* %2, align 4
  %6 = mul nsw i32 %4, %5
  %7 = load i32* %3, align 4
  %8 = mul nsw i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define internal i32 @sub2(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 100, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = sub nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define internal i32 @multiply3(i32 %x, i32 %y, i32 %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 15, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 25, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = load i32* %2, align 4
  %6 = mul nsw i32 %4, %5
  %7 = load i32* %3, align 4
  %8 = mul nsw i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define internal i32 @multiply4(i32 %x, i32 %y, i32 %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 2, i32* %1, align 4
  store i32 3, i32* %2, align 4
  store i32 4, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = load i32* %2, align 4
  %6 = mul nsw i32 %4, %5
  %7 = load i32* %3, align 4
  %8 = mul nsw i32 %6, %7
  ret i32 %8
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
