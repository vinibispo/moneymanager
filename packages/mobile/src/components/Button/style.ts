import styled from "styled-components/native";
import { RectButton } from "react-native-gesture-handler";

export const Container = styled(RectButton)`
  background: #23ce34;
  width: 80%;
  height: 50px;
  border-radius: 10px;
  justify-content: center;
  align-items: center;
  padding: 0 30px;
`;

export const TextButton = styled.Text`
  color: #ffffff;
  text-transform: uppercase;
  font-size: 24px;
  font-family: "Roboto-Bold";
`;
