import React from 'react'
import { CCard, CCardBody, CCol, CCardHeader, CRow } from '@coreui/react'
import { CChartDoughnut, CChartLine } from '@coreui/react-chartjs'

const PieWidget = () => {
  const random = () => Math.round(Math.random() * 100)

  return (
    <CRow>
      <CCol sm={6} lg={3}>
        <CCard className="mb-4">
          <CCardHeader>Doughnut Chart</CCardHeader>
          <CCardBody>
            <CChartDoughnut
              data={{
                labels: ['VueJs', 'EmberJs', 'ReactJs', 'AngularJs'],
                datasets: [
                  {
                    backgroundColor: ['#41B883', '#E46651', '#00D8FF', '#DD1B16'],
                    data: [500, 220, 70, 100],
                  },
                ],
              }}
            />
          </CCardBody>
        </CCard>
      </CCol>
      <CCol sm={6} lg={3}>
        <CCard className="mb-4">
          <CCardHeader>Doughnut Chart</CCardHeader>
          <CCardBody>
            <CChartDoughnut
              data={{
                labels: ['VueJs', 'EmberJs', 'ReactJs', 'AngularJs'],
                datasets: [
                  {
                    backgroundColor: ['#41B883', '#E46651', '#00D8FF', '#DD1B16'],
                    data: [40, 20, 80, 10],
                  },
                ],
              }}
            />
          </CCardBody>
        </CCard>
      </CCol>
      <CCol sm={6} lg={6}>
        <CCard className="mb-4">
          <CCardHeader>Line Chart</CCardHeader>
          <CCardBody>
            <CChartLine
              data={{
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [
                  {
                    label: 'My First dataset',
                    backgroundColor: 'rgba(220, 220, 220, 0.2)',
                    borderColor: 'rgba(220, 220, 220, 1)',
                    pointBackgroundColor: 'rgba(220, 220, 220, 1)',
                    pointBorderColor: '#fff',
                    data: [random(), random(), random(), random(), random(), random(), random()],
                  },
                  {
                    label: 'My Second dataset',
                    backgroundColor: 'rgba(151, 187, 205, 0.2)',
                    borderColor: 'rgba(151, 187, 205, 1)',
                    pointBackgroundColor: 'rgba(151, 187, 205, 1)',
                    pointBorderColor: '#fff',
                    data: [random(), random(), random(), random(), random(), random(), random()],
                  },
                ],
              }}
            />
          </CCardBody>
        </CCard>
      </CCol>
    </CRow>
  )
}

export default PieWidget
