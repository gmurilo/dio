import styled from "styled-components";

export const ItemContainer = styled.div`
    width: 90%;
    height: auto;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex: 1;

    h3 {
        font-size: 32px;
        color: #FAFAFA;
    }

    p {
        font-size:16px;
        color: #FAFAFA60;
        margin-bottom: 10px;

    }

    a {
        color: #FAFAFA;
        width: 20px;
        text-decoration: none;
        
    }

    a.remover {
        color: #FF0000;
        text-decoration: none;
        
    }

    hr {
        color: #FAFAFA60;
        margin: 20px 0;
    }
`