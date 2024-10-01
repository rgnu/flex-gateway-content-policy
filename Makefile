all: help

# Include tasks
include $(wildcard $(CURDIR)/tasks/*.mk)

policy.%: ANYPOINT_URL?=https://anypoint.mulesoft.com

policy.anypoint.definition.publish: NAME=Response-Content
policy.anypoint.definition.publish: VERSION=0.1.0
policy.anypoint.definition.publish: DESCRIPTION=Response Content Policy
policy.anypoint.definition.publish: ## Publish Policy Definition (VERSION=0.1.0)

policy.anypoint.implementation.publish: NAME=Response-Content-Flex
policy.anypoint.implementation.publish: VERSION=0.1.0
policy.anypoint.implementation.publish: DESCRIPTION=Response Content Flex
policy.anypoint.implementation.publish: EXTENDS=Response-Content:0.1.0
policy.anypoint.implementation.publish: policy.build ## Publish Policy Implementation (VERSION=0.1.0 EXTENDS=Response-Content:0.1.0)
