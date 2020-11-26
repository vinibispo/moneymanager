import React from "react";
import { Container } from "./style";

const Title: React.FC<{ children: string }> = ({ children }) => {
  return <Container>{children}</Container>;
};
export default Title;
