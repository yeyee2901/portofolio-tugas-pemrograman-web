import { Box, Heading, Image, VStack } from '@chakra-ui/react'

const Header = () => (
    <Box p={4} width="100%" display="flex" flexDir="column" alignItems="center">
        <VStack>
            <Heading as="h1" borderRadius="lg" p={3} >
                Yeyee&apos;s Website
            </Heading>

            <Image
                src="assets/profile.png"
                alt="Profile"
                boxSize="200px"
                borderRadius="full"
            />
        </VStack>
    </Box>
)

export default Header
