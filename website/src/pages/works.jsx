import { useLocation } from 'react-router-dom'

const Works = () => {
    const current_path = useLocation().pathname
    return (
        <p>
            This is {current_path} page
        </p>
    )
}

export default Works
