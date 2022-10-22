import { InputStyled } from './styles'

const Input = ({value}) => {
    return (
        <InputStyled>
            <input disabled value={value} />
        </InputStyled>
    );
}

export default Input;