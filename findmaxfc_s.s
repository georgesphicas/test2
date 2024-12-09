.global findmaxfc_s

# a0 - int a
# a1 - int b
max2_s:
    bge a0, a1, lower # compare nums
    mv a0, a1 # update highest
    ret
    
lower:
    ret 

# a0 - int arr[]
# a1 - int len
# t1 - i
findmaxfc_s:
    li t1, 0
    lw t2, (a0)
    addi sp, sp, -48  
    sd ra, (sp) # preserve ra on stack
    
loop:
    beq t1, a1, done
    slli t3, t1, 2 # multiply i by 4, get byte offset
    add t4, a0, t3 # get addr of arr[i]
    lw a2, (t4)
    sd t1, 8(sp) # preserve i on stack
    sd a1, 16(sp) # preserve len on stack
    sd a0, 24(sp) # preserve arr[] on stack
    mv a1, a2 # move current val to a1
    mv a0, t2 # move current high to a0
 
    call max2_s
    
    mv t2, a0 # move current highest value to t2
    ld t1, 8(sp) # restore i from stack
    ld a1, 16(sp) # restore len from stack
    ld a0, 24(sp) # restore arr[] from stack 
    addi t1, t1, 1 # increment the i 
    j loop

done:
    ld ra, (sp) # restore ra from stack
    addi sp, sp, 48 # deallocate stack
    mv a0, t2
    ret
