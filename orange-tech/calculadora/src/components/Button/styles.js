import styled from "styled-components";

export const ButtonStyled = styled.button`
    padding: 0.75rem;
    border: 1px solid #b3b3b3;
    background-color: #F7F9FC;
    color: #000;
    font-size: 24px;
    font-weight: 700;
    flex: 1;
    border-radius: 10px;
    &.active {
        color: #fff;
        background-color: #1975c5;
    }
    &:hover {
        opacity: 0.6;
        transition: 0.3s;
    }
`