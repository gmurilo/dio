import React from 'react'

import {ButtonContainer} from "./styles";

function Button({disable, onClick}) {
  return (
    <ButtonContainer onClick={onClick} disabled={disable}>
      Buscar
    </ButtonContainer>
  )
}

export default Button;
