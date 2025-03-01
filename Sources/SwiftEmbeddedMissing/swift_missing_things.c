
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdarg.h>




uint64_t swift_float32ToString(char *Buffer, size_t BufferLength,
    float Value, bool Debug, bool Debug2, bool Debug3) {
    if (Buffer == NULL || BufferLength == 0) {
        return 0;
    }
    return (uint64_t)snprintf(Buffer, BufferLength, "%.*g", 9, Value);
}

uint64_t swift_float64ToString(char *Buffer, size_t BufferLength,
    double Value, bool Debug, bool Debug2, bool Debug3) {
    if (Buffer == NULL || BufferLength == 0) {
        return 0;
    }
    
    return (uint64_t)snprintf(Buffer, BufferLength, "%.*g", 17, Value);
}