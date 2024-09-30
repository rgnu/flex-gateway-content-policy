all: help

# Include tasks
include $(wildcard $(CURDIR)/tasks/*.mk)

policy.%: ANYPOINT_URL?=https://anypoint.mulesoft.com

policy.anypoint.definition.publish: NAME=Greeting
policy.anypoint.definition.publish: VERSION=0.1.1
policy.anypoint.definition.publish: DESCRIPTION=Greeting Policy
policy.anypoint.definition.publish: ## Publish Policy Definition

policy.anypoint.implementation.publish: NAME=Greeting-Flex
policy.anypoint.implementation.publish: VERSION=0.1.0
policy.anypoint.implementation.publish: DESCRIPTION=Greeting Flex
policy.anypoint.implementation.publish: EXTENDS=Greeting:0.1.1
policy.anypoint.implementation.publish: policy.build ## Publish Policy Implementation
