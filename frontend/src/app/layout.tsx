"use client";
import "@mantine/core/styles.css";
import "@mantine/dates/styles.css";
import React, { FC } from "react";
import { ColorSchemeScript } from "@mantine/core";
import Head from "next/head";

import GraphQLProvider from "../providers/graphqlProvider";
import StyleProvider from "../providers/styleProvider";
import WalletProvider from "../providers/walletProvider";

import { Analytics } from "@vercel/analytics/react";
import Template from "./template";
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
        <html lang="en">
            <Head>
                <ColorSchemeScript />
            </Head>
            <body>
                <GraphQLProvider>
                    <StyleProvider>
                        <WalletProvider>
                            {children}
                            <Analytics />
                        </WalletProvider>
                    </StyleProvider>
                </GraphQLProvider>
            </body>
        </html>
    );
};

export default Layout;
