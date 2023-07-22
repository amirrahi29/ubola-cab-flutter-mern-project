import React, { Suspense } from 'react'
import { Navigate, Route, Routes } from 'react-router-dom'
import { CContainer, CSpinner } from '@coreui/react'
import { AllColors } from 'src/global_equipments/Allcolors'

// routes config
import routes from '../routes'

const AppContent = () => {
  return (
    <CContainer lg>
      <Suspense
        fallback={
          <div className="spinner-container">
            <CSpinner style={{ color: AllColors.appBackgroundColor }} />
          </div>
        }
      >
        <Routes>
          {routes.map((route, idx) => {
            return (
              route.element && (
                <Route
                  key={idx}
                  path={route.path}
                  exact={route.exact}
                  name={route.name}
                  element={<route.element />}
                />
              )
            )
          })}
          <Route path="/" element={<Navigate to="login" replace />} />
          {/* <Route path="/" element={<Navigate to="dashboard" replace />} /> */}
        </Routes>
      </Suspense>
    </CContainer>
  )
}

export default React.memo(AppContent)
