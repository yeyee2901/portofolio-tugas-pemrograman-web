import { Box, Heading, Image, VStack } from '@chakra-ui/react'
import { Link } from 'react-router-dom'

const Header = () => (
  <Box p={4} width="100%" display="flex" flexDir="column" alignItems="center">
    <VStack>
      <Heading as="h1" borderRadius="lg" p={3} >
  <Link to="/">
  Yeyee&apos;s Website
  </Link>
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
