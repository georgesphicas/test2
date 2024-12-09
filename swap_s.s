.global swap_s

# swap_s - swap two elements of an integer array
# swap arr[i] with arr[j]
#
# a0 - int arr[]
# a1 - int i
# a2 - int j
swap_s:
    li t0, 4 # t0 = 4
    li t1, 4 # t1 = 4
    li t2, 0 # hold i val
    li t3, 0 # hold j val
    
    mul t0, a1, t0 # t0 = i * 4
    add t0, a0, t0 # address of arr[i]
    lw t2, (t0) # save the value at i

    mul t1, a2, t1
    add t1, a0, t1
    lw t3, (t1) # save the value at j

    sw t3, (t0) # storing j value into i position
    sw t2, (t1) # store i value into j position

    ret
