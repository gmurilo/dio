import styled from "styled-components";

export const Container = styled.div`
    width: 100%;
    width: 100%;
    height: 100%;
    background-color: #eee;
    position: relative;
`
export const Spacer = styled.div`
    content: " ";
    display: block;
    padding-bottom: var(--footer-height, 105px );
`

export const Content = styled.div`
    max-width: 545px;
    min-width: 320px;
    width: 100%;
    background-color: #f3f3f3;
    padding: 4px;
    border-radius: 4px;
    margin: auto;
    display: flex;
    flex-direction: column;
    position: relative;
`

export const Row = styled.div`
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    gap: 4px;
    margin: 4px 0px;
`

export const Column = styled.div`
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
`

