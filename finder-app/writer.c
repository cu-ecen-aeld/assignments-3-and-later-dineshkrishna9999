#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        syslog(LOG_ERR, "Invalid number of arguments: Expected 2, got %d", argc-1);
        printf("Usage: %s <file_path> <string_to_write>\n", argv[0]);
        return 1;
    }

    const char *file_path = argv[1];
    const char *string_to_write = argv[2];

    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    FILE *file = fopen(file_path, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error opening file %s", file_path);
        perror("Error opening file");
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", string_to_write, file_path);
    if (fprintf(file, "%s", string_to_write) < 0) {
        syslog(LOG_ERR, "Error writing to file %s", file_path);
        perror("Error writing to file");
        fclose(file);
        return 1;
    }

    fclose(file);
    syslog(LOG_DEBUG, "Successfully wrote to %s", file_path);

    closelog();

    return 0;
}
