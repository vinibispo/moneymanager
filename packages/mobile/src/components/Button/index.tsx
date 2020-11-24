import React from "react";
import { RectButtonProperties } from "react-native-gesture-handler";
import { TextButton, Container } from "./style";

interface ButtonProps extends RectButtonProperties {
  children: string;
}
const Button: React.FC<ButtonProps> = ({ children, ...rest }) => {
  return (
    <Container {...rest}>
      <TextButton>{children}</TextButton>
    </Container>
  );
};
export default Button;
