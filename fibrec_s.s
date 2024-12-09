.global fibrec_s

# fibrec - compute the nth fibonacci number
# a0 - int n

fibrec_s:
    li t0, 1            # for base case check
    addi sp, sp, -32    # allocate sp on stack
    sd ra, 8(sp)        # save ra
    sd s0, 0(sp)        # save s0
    mv s0, a0           # move a0 into s0      
    ble a0, t0, base    # if less than or equal to 1
    addi a0, s0, -1     # calculate n - 1

    call fibrec_s
    
    mv t1, a0           # move a0 into t1
    addi a0, s0, -2     # calculate n - 2

    call fibrec_s
    
    add a0, t1, a0      # save result
    j done

base:
    mv a0, s0

done:
    ld ra, 8(sp)        # load ra from stack
    ld s0, 0(sp)        # load s0 from stack
    addi sp, sp, 32     # deallocate sp
    ret
