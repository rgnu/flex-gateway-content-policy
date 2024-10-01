//@ts-ignore
export * from "@rgnu/flex-gateway-as-sdk/proxy"; // this exports the required functions for the proxy to interact with us.

import {
    Context,
    FilterHeadersStatusValues,
    FlexContext,
    FlexRootContext,
    HeaderPair,
    Headers,
    makeHeaderPair,
    registerRootContext
} from "@rgnu/flex-gateway-as-sdk";

//@ts-ignore
@serializable
class Header {
    name: string = ""
    value: string = ""
}

//@ts-ignore
@serializable
class FilterConfig {
    status: u32 = 200
    headers: Array<Header> = []
    body: string = ""
}

export class FilterRoot extends FlexRootContext<FilterConfig> {
    createContext(context_id: u32): Context {
        return new Filter(context_id, this, this.getPolicyConfig());
    }
}

class Filter extends FlexContext<FilterRoot> {
    status: u32
    headers: Headers
    body: ArrayBuffer

    constructor(context_id: u32, root_context: FilterRoot, config: FilterConfig) {
        super(context_id, root_context);

        this.status = config.status;
        this.headers = config.headers.map<HeaderPair>((value) => makeHeaderPair(value.name, value.value));
        this.body = String.UTF8.encode(config.body);
    }

    onResponseHeaders(a: u32, end_of_stream: bool): FilterHeadersStatusValues {
        this.getRootContext().sendHttpResponse(
            this.status,
            "",
            this.body,
            this.headers,
        )

        return FilterHeadersStatusValues.StopIteration;
    }
}

registerRootContext((context_id: u32) => {
    return new FilterRoot(context_id, new FilterConfig());
}, "main");