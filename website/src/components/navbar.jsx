import { Link, useLocation } from 'react-router-dom';
import {
  Box,
  Heading,
  Stack,
  HStack
} from '@chakra-ui/react'

const LinkItem = ({ text, href }) => {
  const is_active = useLocation().pathname === `${href}`
  const active_bg = is_active ? "blue" : "white"
  const active_color = is_active ? "white" : "none"

  return (
    <Box>
      <Heading
        as="h4"
        size="m"
        color={active_color}
        bg={active_bg}
        borderRadius="lg"
        p={2}
      >
        <Link to={href}>
          {text}
        </Link>
      </Heading>
    </Box>
  )
}


const Navbar = () => {
  const LinkItems = (
    <>
      <LinkItem text="Home" href="/" />
      <LinkItem text="About" href="/about" />
      <LinkItem text="Works" href="/works" />
    </>
  )
  return (
    <>
      <Stack
        direction={{ base: 'column', md: 'row' }}
        display={{ base: 'flex', md: 'none' }}
      >
        {LinkItems}
      </Stack>

      <Box
        p={4}
        width="100%"
        display={{ base: 'none', md: 'flex' }}
        flexDir="column"
        alignItems="center"
      >
        <HStack> {LinkItems} </HStack>
      </Box>

    </>
  )
}

export default Navbar
