import { createGlobalStyle } from 'styled-components';

export default createGlobalStyle`
    *, body {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    html, body, #root {
        min-width: 100%;
        min-height: 100%;
        height: 100%;
    }
    :root {
        --footer-height: 105px;
    }
`