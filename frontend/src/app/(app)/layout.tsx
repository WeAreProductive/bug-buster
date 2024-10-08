"use client";
import "@mantine/core/styles.css";
import "@mantine/dates/styles.css";
import React, { FC } from "react";

import { Analytics } from "@vercel/analytics/react";
import { Shell } from "./shell";
// import { SWRConfig } from "swr";

// const fetcher = async <JSON = any,>(
//     input: RequestInfo,
//     init?: RequestInit
// ): Promise<JSON> => {
//     const res = await fetch(input, init);
//     return res.json();
// };

const Layout: FC<{ children: React.ReactNode }> = ({ children }) => {
    return (
        <Shell>
            {children}
            <Analytics />
        </Shell>
    );
};

export default Layout;
