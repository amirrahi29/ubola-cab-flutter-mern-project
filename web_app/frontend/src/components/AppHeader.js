import React, { useState } from 'react'
import { NavLink } from 'react-router-dom'
import { useSelector, useDispatch } from 'react-redux'
import {
  CContainer,
  CHeader,
  CHeaderBrand,
  CHeaderDivider,
  CHeaderNav,
  CHeaderToggler,
  CNavLink,
  CNavItem,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilBell, cilEnvelopeOpen, cilList, cilMenu } from '@coreui/icons'
import { AppBreadcrumb } from './index'
import { AppHeaderDropdown } from './header/index'
import logoImage from '../assets/images/logo.png'
import { AllColors } from 'src/global_equipments/Allcolors'

const AppHeader = () => {
  const dispatch = useDispatch()
  const sidebarShow = useSelector((state) => state.sidebarShow)
  const [selected, setSelected] = useState(0)

  const handleNavLinkClick = (index) => {
    setSelected(index)
  }

  return (
    <CHeader
      position="sticky"
      className="mb-4"
      style={{ backgroundColor: AllColors.appBackgroundColor }}
    >
      <CContainer fluid>
        <CHeaderToggler
          className="ps-1"
          onClick={() => dispatch({ type: 'set', sidebarShow: !sidebarShow })}
        >
          <CIcon icon={cilMenu} size="lg" style={{ color: 'white' }} />
        </CHeaderToggler>
        <CHeaderBrand className="mx-auto d-md-none" to="/">
          <img src={logoImage} alt="" style={{ height: 30, marginRight: 32 }} />
        </CHeaderBrand>
        <CHeaderNav className="d-none d-md-flex me-auto">
          <CNavItem>
            <CNavLink
              to="/dashboard"
              component={NavLink}
              active={selected === 0}
              style={{
                color: selected === 0 ? 'yellow' : 'white',
              }}
              onClick={() => handleNavLinkClick(0)}
            >
              Dashboard
            </CNavLink>
          </CNavItem>
          <CNavItem>
            <CNavLink
              href="#"
              active={selected === 1}
              style={{
                color: selected === 1 ? 'yellow' : 'white',
              }}
              onClick={() => handleNavLinkClick(1)}
            >
              Users
            </CNavLink>
          </CNavItem>
          <CNavItem>
            <CNavLink
              href="#"
              active={selected === 2}
              style={{
                color: selected === 2 ? 'yellow' : 'white',
              }}
              onClick={() => handleNavLinkClick(2)}
            >
              Settings
            </CNavLink>
          </CNavItem>
        </CHeaderNav>
        <CHeaderNav>
          <CNavItem>
            <CNavLink href="#" style={{ color: 'white' }}>
              <CIcon icon={cilBell} size="lg" style={{ color: 'white' }} />
            </CNavLink>
          </CNavItem>
          <CNavItem>
            <CNavLink href="#" style={{ color: 'white' }}>
              <CIcon icon={cilList} size="lg" style={{ color: 'white' }} />
            </CNavLink>
          </CNavItem>
          <CNavItem>
            <CNavLink href="#" style={{ color: 'white' }}>
              <CIcon icon={cilEnvelopeOpen} size="lg" style={{ color: 'white' }} />
            </CNavLink>
          </CNavItem>
        </CHeaderNav>
        <CHeaderNav className="ms-3">
          <AppHeaderDropdown />
        </CHeaderNav>
      </CContainer>
      <CHeaderDivider />
      <CContainer fluid>
        <AppBreadcrumb />
      </CContainer>
    </CHeader>
  )
}

export default AppHeader
