import { ChakraProvider } from '@chakra-ui/react'
import Header from './components/header'

const Main = () => {
    return (
        <ChakraProvider>
            <Header context="Main"/>
        </ChakraProvider>
    );
}

export default Main;
