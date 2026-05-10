ENTRY(entry)

/* define the stack pointer address */
__sp = 0x00010000;

SECTIONS
{
    /* defines the start of
     * program memory */
    . = 0x00000000;

    /* this places the contents 
     * of init.s at the start
     * of program memory */
    .text.init :
    {
        *(.text.init)
    }

    /* this places the rest
     * of the text segment at
     * the subsequent addresses */
    .text :
    {
        *(.text)
    }

    /* this is a disorganized mess, 
     * but it has to be exactly like this
     * for binary compatibility with
     * the files provided on Canvas */
    __global_pointer$ = .  + 0x800;
    .data :
    {
        *(.sbss)
        *(COMMON)
        *(.bss)
        *(.data*)
        *(.sdata)
        *(.srodata*)
        *(.rodata)
        *(.got*)
        *(._end)
        _edata = .;
        PROVIDE(edata = .);
    }

    /* define a symbol for the end of program memory */
    _end = .;

}
