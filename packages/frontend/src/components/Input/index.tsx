import React, { InputHTMLAttributes } from "react";

import { Container, StyleInput } from "./style";

interface InputProps extends InputHTMLAttributes<HTMLInputElement> {
  name: string;
}
const Input: React.FC<InputProps> = ({ name, ...rest }) => {
  return (
    <Container>
      <StyleInput name={name} {...rest} />
    </Container>
  );
};
export default Input;
