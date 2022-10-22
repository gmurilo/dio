import styled from "styled-components";

export const FooterStyled = styled.footer`
    position: fixed;
    bottom: 0px;
    width: 100%;
    height: var(--footer-height, 100px );
    background-color: #eee;
    display: flex;
    flex: 1 1;
    justify-content: center;
    align-items: center;

    .rodape {
        text-align: center;
        color: #000;
        font-family: 'Calibri';

        ul {
            text-decoration: none;
            font-size: 25px;
            display: flex;
            justify-content: center;
            margin: 0 0 10px 10px;
            list-style: none;
        }

        ul li {
            padding-right: 10px;
            color: #000;
        }

        a {
            color: inherit;
            transition: 0.3s;
        }

        a:hover{
            color: #6A5ACD;
        }
        a:selected{
            color: pink;
        }

    }
`