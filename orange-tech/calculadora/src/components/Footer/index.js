import { FooterStyled } from './styles';

const Footer = () => {
    const Developer = {
        name: "Giovani Murilo D. Correa",
        linkedin: "https://www.linkedin.com/in/gmurilo",
        github: "https://github.com/gmurilo"
    };
    return (
        <FooterStyled>
            <div className='rodape'>
                <ul>
                    <li><a href={Developer.github} target={'_blank'} rel="noopener noreferrer"><i className="fa-brands fa-github"></i></a></li>
                    <li><a href={Developer.linkedin} target={'_blank'} rel="noopener noreferrer"><i className="fa-brands fa-linkedin"></i></a></li>
                </ul>
                <p><i>{Developer.name}</i></p>
            </div>
        </FooterStyled>
    );
}

export default Footer;