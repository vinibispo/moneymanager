import React from "react";
import { render, screen } from "@testing-library/react";

import { ThemeProvider } from "styled-components";
import Home from "../src/pages/index";

describe("Home", () => {
  it("should render the heading", () => {
    const theme = {
      colors: {
        background: "#fff",
        text: "#040F0F",
        buttonPrimary: "#23CE34",
      },
    };
    render(
      <ThemeProvider theme={theme}>
        <Home />
      </ThemeProvider>
    );
    const heading = screen.getByText("Home");
    expect(heading).toBeTruthy();
  });
});
