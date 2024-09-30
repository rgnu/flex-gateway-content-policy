IN_RED=$(ECHO) "\033[0;31m$(1)\033[0m"
IN_GREEN=$(ECHO) "\033[0;32m$(1)\033[0m"
IN_YELLOW=$(ECHO) "\033[0;33m$(1)\033[0m"

LOG_INFO=$(call IN_GREEN,[INFO ] $(1))
LOG_WARN=$(call IN_YELLOW,[WARN ] $(1))
LOG_ERROR=$(call IN_RED,[ERROR] $(1))

LOG_ERROR_AND_EXIT=$(call LOG_ERROR,$(1)) && exit 1;

ASSERT_EXISTS=[ -z "$(firstword $(1))" ] && $(call LOG_ERROR,$(2)) && exit 1;
