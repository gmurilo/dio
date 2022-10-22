import { ButtonStyled } from './styles';

const Button = ({label, onClick, className}) => {
    return (
        <ButtonStyled onClick={onClick} className={className}>{label}</ButtonStyled>
    );
}

export default Button;