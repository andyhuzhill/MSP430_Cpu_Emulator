
start:
     mov #20, r10
.L1:
     mov r10, r11
.L2:
     mov 2(r10), 6(r11)
     mov .L1, .L2
     mov &.L1, &.L2
     .end
