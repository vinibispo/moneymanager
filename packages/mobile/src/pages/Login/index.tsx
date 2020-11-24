import React from "react";
import { Container, FormContainer } from "./style";
import Title from "../../components/Title";
import Button from "../../components/Button";
import Input from "../../components/Input";

const Login: React.FC = () => {
  return (
    <Container>
      <FormContainer>
        <Title>Bem vindo de volta</Title>
        <Input name="email" placeholder="Email" />
        <Button onPress={() => {}}>Login</Button>
      </FormContainer>
    </Container>
  );
};
export default Login;
