import {Outlet} from 'react-router-dom'
import Header from '../components/header'
import Navbar from '../components/navbar'

const Layout = () => (
    <>
        <Header />
        <Navbar />
        <Outlet />
    </>
)
export default Layout
