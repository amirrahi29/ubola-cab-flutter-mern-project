import React from 'react'

const Dashboard = React.lazy(() => import('./views/dashboard/Dashboard'))

//stores
const AddStore = React.lazy(() => import('./views/stores/AddStore'))
const ViewStore = React.lazy(() => import('./views/stores/ViewStore'))

//products
const AddProduct = React.lazy(() => import('./views/products/AddProduct'))
const ViewProduct = React.lazy(() => import('./views/products/ViewProduct'))

//attributes
const Category = React.lazy(() => import('./views/attributes/Category'))
const SubCategory = React.lazy(() => import('./views/attributes/SubCategory'))
const Color = React.lazy(() => import('./views/attributes/Color'))

//orders
const AllOrders = React.lazy(() => import('./views/orders/AllOrders'))
const PendingOrders = React.lazy(() => import('./views/orders/PendingOrders'))
const CompletedOrders = React.lazy(() => import('./views/orders/CompletedOrders'))

// Notifications
const UserNotification = React.lazy(() => import('./views/notifications/UserNotification'))
const AgentNotification = React.lazy(() => import('./views/notifications/AgentNotification'))
const DeliveryBoyNotification = React.lazy(() =>
  import('./views/notifications/DeliveryBoyNotification'),
)
const StoreNotification = React.lazy(() => import('./views/notifications/StoreNotification'))

// Emails
const UserEmail = React.lazy(() => import('./views/emails/UserEmail'))
const AgentEmail = React.lazy(() => import('./views/emails/AgentEmail'))
const DeliveryBoyEmail = React.lazy(() => import('./views/emails/DeliveryBoyEmail'))
const StoreEmail = React.lazy(() => import('./views/emails/StoreEmail'))

//Agents
const AddAgent = React.lazy(() => import('./views/agents/AddAgent'))
const ViewAgent = React.lazy(() => import('./views/agents/ViewAgents'))

//Delivery Boys
const AddDeliveryBoys = React.lazy(() => import('./views/delivery_boys/AddDeliveryBoys'))
const ViewDeliveryBoys = React.lazy(() => import('./views/delivery_boys/ViewDeliveryBoys'))

//Users
const AddUsers = React.lazy(() => import('./views/users/AddUsers'))
const ViewUsers = React.lazy(() => import('./views/users/ViewUsers'))

//vehicles
const AddVehicles = React.lazy(() => import('./views/vehicles/AddVehicles'))
const ViewVehicles = React.lazy(() => import('./views/vehicles/ViewVehicles'))

//payments
const AllPayments = React.lazy(() => import('./views/payments/AllPayments'))
const PendingPayments = React.lazy(() => import('./views/payments/PendingPayments'))
const CompletedPayments = React.lazy(() => import('./views/payments/CompletedPayments'))

//queries
const ViewQueries = React.lazy(() => import('./views/queries/ViewQueries'))

//reviews
const ViewReviews = React.lazy(() => import('./views/reviews/ViewReviews'))

const routes = [
  { path: '/', exact: true, name: 'Home' },
  { path: '/dashboard', name: 'Dashboard', element: Dashboard },

  //stores
  { path: '/store/add_store', name: 'Add Store', element: AddStore },
  { path: '/store/view_store', name: 'View Store', element: ViewStore },

  //products
  { path: '/products/add_product', name: 'Add Product', element: AddProduct },
  { path: '/products/view_product', name: 'View Product', element: ViewProduct },

  //attributes
  { path: '/attributes/category', name: 'Category', element: Category },
  { path: '/attributes/sub_category', name: 'Sub Category', element: SubCategory },
  { path: '/attributes/color', name: 'Color', element: Color },

  //orders
  { path: '/orders/all_orders', name: 'All Orders', element: AllOrders },
  { path: '/orders/pending_orders', name: 'Pending Orders', element: PendingOrders },
  { path: '/orders/completed_orders', name: 'Completed Orders', element: CompletedOrders },

  //payments
  { path: '/payments/all_payments', name: 'All Payments', element: AllPayments },
  { path: '/payments/pending_payments', name: 'Pending Payments', element: PendingPayments },
  { path: '/payments/completed_payments', name: 'Completed Payments', element: CompletedPayments },

  //notifications
  {
    path: '/notifications/agent_notification',
    name: 'Send notifications to agent',
    element: AgentNotification,
  },
  {
    path: '/notifications/delivery_boy_notification',
    name: 'Send notifications to Delivery Boy',
    element: DeliveryBoyNotification,
  },
  {
    path: '/notifications/store_notification',
    name: 'Send notifications to Store',
    element: StoreNotification,
  },
  {
    path: '/notifications/user_notification',
    name: 'Send notifications to user',
    element: UserNotification,
  },

  //emails
  {
    path: '/emails/agent_notification',
    name: 'Send emails to agent',
    element: AgentEmail,
  },
  {
    path: '/email/delivery_boy_notification',
    name: 'Send emails to Delivery Boy',
    element: DeliveryBoyEmail,
  },
  {
    path: '/emails/store_notification',
    name: 'Send emails to Store',
    element: StoreEmail,
  },
  {
    path: '/emails/user_notification',
    name: 'Send emails to user',
    element: UserEmail,
  },

  //agents
  {
    path: '/agents/add_agent',
    name: 'Add agent',
    element: AddAgent,
  },
  {
    path: '/agents/view_agents',
    name: 'View agent',
    element: ViewAgent,
  },

  //delivery boys
  {
    path: '/delivery_boys/add_delivery_boys',
    name: 'Add Delivery Boys',
    element: AddDeliveryBoys,
  },
  {
    path: '/delivery_boys/view_delivery_boys',
    name: 'View Delivery Boys',
    element: ViewDeliveryBoys,
  },

  //users
  {
    path: '/users/add_users',
    name: 'Add Users',
    element: AddUsers,
  },
  {
    path: '/users/view_users',
    name: 'View Users',
    element: ViewUsers,
  },

  //vehicles
  {
    path: '/vehicles/add_vehicles',
    name: 'Add Vehicles',
    element: AddVehicles,
  },
  {
    path: '/vehicles/view_vehicles',
    name: 'View Vehicles',
    element: ViewVehicles,
  },

  //queries
  {
    path: '/queries/view_queries',
    name: 'View Queries',
    element: ViewQueries,
  },
  //reviews
  {
    path: '/reviews/view_reviews',
    name: 'View Reviews',
    element: ViewReviews,
  },
]

export default routes
