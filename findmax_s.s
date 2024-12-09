.global findmax_s

# a0 - int arr[]
# a1 - int len
# t1 - i
# t2 - current value
# t3 - current highest

findmax_s:
    li t1, 1
    lw t3, (a0)

loop:
    beq t1, a1, done
    slli t4, t1, 2 # multiply i by 4, get byte offset
    add t5, a0, t4 # calc address of arr[i]
    lw t2, (t5) # load arr[i] to t2
    bge t3, t2, lower # compare current max to newest num
    mv t3, t2 # update highest value

lower:
    addi t1, t1, 1 # increment counter
    j loop
    
done:
    mv a0, t3
    ret
