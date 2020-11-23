import React from "react";
import { render, screen } from "@testing-library/react";

import Home from "../src/pages/index";

describe("Home", () => {
  it("should render the heading", () => {
    render(<Home />);
    const heading = screen.getByText("Home");
    expect(heading).toBeInTheDocument();
  });
});
