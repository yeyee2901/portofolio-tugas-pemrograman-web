// harus pake Img karena katanya Image ada
// bug https://github.com/chakra-ui/chakra-ui/issues/2815#issuecomment-747611286
import { Box, Heading, Img, VStack } from '@chakra-ui/react'

const Header = ({ context }) => (
    <Box bg="gray.900" color="white" p={4} width="100%" display="flex" flexDir="column" alignItems="center">
        <VStack>
            <Heading as="h1" bg="gray.800" borderRadius="50px" p={3}>
                Yeyee&apos;s Website
            </Heading>

            <Img
                src="assets/profile.png"
                alt="Profile"
                boxSize="200px"
                borderRadius="full"
            />
        </VStack>
    </Box>
)

export default Header;
