//@ts-ignore
export * from "@rgnu/flex-gateway-as-sdk/proxy"; // this exports the required functions for the proxy to interact with us.

import {
    Context,
    FilterHeadersStatusValues,
    FlexContext,
    FlexRootContext,
    registerRootContext
} from "@rgnu/flex-gateway-as-sdk";

//@ts-ignore
@serializable
class FilterConfig {
    greeting: string = "Hello"
}

export class FilterRoot extends FlexRootContext<FilterConfig> {
    createContext(context_id: u32): Context {
        return new Filter(context_id, this, this.getPolicyConfig());
    }
}

class Filter extends FlexContext<FilterRoot> {
    config: FilterConfig

    constructor(context_id: u32, root_context: FilterRoot, config: FilterConfig) {
        super(context_id, root_context);
        this.config = config
    }

    onResponseHeaders(a: u32, end: bool): FilterHeadersStatusValues {
        this.addResponseHeader("x-greeting", this.config.greeting);

        return FilterHeadersStatusValues.Continue;
    }
}

registerRootContext((context_id: u32) => {
    return new FilterRoot(context_id, new FilterConfig());
}, "main");