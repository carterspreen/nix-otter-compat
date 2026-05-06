#---------------------------------------
# This bootstrap code does three things:
#
# (1) It initializes the stack pointer
# (2) It calls main, which may return
# (3) It loops forever if main returns
#
# It is up to you to define "main"
#---------------------------------------

.section .text.init

entry:
    la sp, __sp-32
    call main

end:
    j end
