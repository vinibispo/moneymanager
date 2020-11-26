import React from "react";
import { Form } from "@unform/web";
import Title from "../components/Title";
import { Container, Section } from "../styles/pages/Home";
import Input from "../components/Input";

export default function Home() {
  return (
    <Container>
      <Section>
        <Title>Home</Title>
        <Form onSubmit={console.log}>
          <Input name="email" />
        </Form>
      </Section>
      <Section>
        <Title>About</Title>
      </Section>
    </Container>
  );
}
