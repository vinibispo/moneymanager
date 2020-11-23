import React from "react";
import { Container, TitleContainer } from "./style";

const Title: React.FC = ({ children }) => {
  return (
    <Container>
      <TitleContainer>{children}</TitleContainer>
    </Container>
  );
};

export default Title;
