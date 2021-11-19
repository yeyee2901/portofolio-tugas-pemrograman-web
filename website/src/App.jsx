import Layout from './layouts/main'
import About from './pages/about'
import Works from './pages/works'
import { Routes, Route } from 'react-router-dom'
import { Box } from '@chakra-ui/react'

const Main = () => {
  return (
    <Box>
      <Routes>
        <Route path="/" element={<Layout />} >
          <Route path="about" element={<About />} />
          <Route path="works" element={<Works />} />
        </Route>
      </Routes>
    </Box>
  );
}

export default Main;
