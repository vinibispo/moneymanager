import { render } from "@testing-library/react-native";
import React from "react";
import Title from "../../src/components/Title";

it("should render the title", async () => {
  const { getByText } = render(<Title>Bem vindo de volta</Title>);
  expect(getByText("Bem vindo de volta")).toBeTruthy();
});
