import React from "react";
import { TextInputProps } from "react-native";
import { Container, TextInput } from "./style";

interface InputProps extends TextInputProps {
  name: string;
}
const Input: React.FC<InputProps> = ({ name, ...rest }) => {
  return (
    <Container>
      <TextInput {...rest} placeholderTextColor="#AAAAAA" />
    </Container>
  );
};
export default Input;
