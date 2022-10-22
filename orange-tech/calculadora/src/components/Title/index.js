import { TitleStyled } from './styles'

const Title = () => {
    const title = "Criando Uma Calculadora Com React";
    const description = "Projeto criado para o desafio de projeto.";
    return (
        <TitleStyled>
            <div className='cabecalho'>
                <h1>{title}</h1>
                <p>{description}</p>
            </div>
        </TitleStyled>
    );
}

export default Title;