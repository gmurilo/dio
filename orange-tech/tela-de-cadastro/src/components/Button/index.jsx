import React from 'react'

import { ButtonContainer } from './styles';

const Button = ({title, className, variant = "primary", onClick}) => {
  return (
    <ButtonContainer className={className} variant={variant} onClick={onClick}>{title}</ButtonContainer>
  )
}

export { Button }
