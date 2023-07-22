import React from 'react'
import { CFooter } from '@coreui/react'

const AppFooter = () => {
  return (
    <CFooter>
      <div>
        <a href="https://rojkharido.com/" target="_blank" rel="noopener noreferrer">
          Rojkharido
        </a>
        <span className="ms-1">&copy;2023 Super App.</span>
      </div>
      <div className="ms-auto">
        <span className="me-1">Powered by</span>
        <a href="https://rojkharido.com/" target="_blank" rel="noopener noreferrer">
          www.rojkharido.com
        </a>
      </div>
    </CFooter>
  )
}

export default React.memo(AppFooter)
