import React from 'react';

import {InputContainer} from './styles';

function Input({value, onChange}) {
  return (
    <InputContainer value={value} onChange={onChange}>
        <input />
        
    </InputContainer>
  )
}

export default Input;