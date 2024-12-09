.global swap_s
.global sort_s
    
# sort_s - sorts an array of 32-bit integers in-place,
#          in ascending order
#
# a0 - int arr[]
# a1 - int len
# t1 - i
# t2 - j
# t3 - 4
# t4 - arr[j]
# t5 - arr[j-1]
sort_s:
    li t1, 1
    li t2, 0
    addi sp, sp, -64 # allocate 64 bytes of stack space
    sd ra, (sp) # put ra in the first 64 bit stack slot

for_loop:
    mv t2, t1 # move j to i
    blt t1, a1, inner_loop
    ld ra, (sp) # restore ra from stack
    addi sp, sp, 64 # deallocate stack
    ret
    
inner_loop:
    li t3, 4 # value to add
    li t5, 4
    mul t3, t2, t3
    add t3, a0, t3 # accessing the next value
    lw t3, (t3)
    addi t4, t2, -1 # j - 1 value
    mul t5, t4, t5
    add t5, a0, t5
    lw t5, (t5)
    ble t2, zero, done # check if j is greater than 0
    bge t3, t5, done # check if the the value at j-1 is greater than j

    sd a0, 8(sp) # preserve a0 on stack
    sd a1, 16(sp) # preserve len on stack
    sd t1, 24(sp) # preserve i on stack
    sd t2, 32(sp) # preserve j on stack
    sd t3, 40(sp) # preserve 4 on stack
    sd t4, 48(sp) # preserve arr[j] on stack
    sd t5, 56(sp) # preserve arr[j-1] on stack

    mv a1, t2 # move j into a1
    mv a2, t4 # move j-1 into a2

    call swap_s

    ld a0, 8(sp) # restore a0 from stack
    ld a1, 16(sp) # restore stack len
    ld t1, 24(sp) # restore i from stack
    ld t2, 32(sp) # restore j from stack
    ld t3, 40(sp) # restore 4 from stack
    ld t4, 48(sp) # restore arr[i] from stack
    ld t5, 56(sp) # restore arr[j-1] from stack

    addi t2, t2, -1 # decrement j
    j inner_loop

done:
    addi t1, t1, 1
    j for_loop
                                                                                                                         
