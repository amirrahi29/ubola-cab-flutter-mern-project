import axios from 'axios';
import React, { useEffect, useState } from 'react';
import DataTable from 'react-data-table-component';
import { CSpinner } from '@coreui/react';
import { AllColors } from 'src/global_equipments/Allcolors';

const ViewStore = () => {
  const [products, setProducts] = useState([]);
  const [filteredProducts, setFilteredProducts] = useState([]);
  const [search, setSearch] = useState("");
  const [selectedRows, setSelectedRows] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    getAllProducts();
  }, []);

  useEffect(() => {
    const result = products.filter(product => {
      return product.title.toLowerCase().includes(search.toLowerCase());
    });
    setFilteredProducts(result);
  }, [search]);

  const getAllProducts = async () => {
    try {
      const response = await axios("https://fakestoreapi.com/products");
      setProducts(response.data);
      setFilteredProducts(response.data);
      setLoading(false);
    } catch (error) {
      console.error("Error fetching products:", error);
      setLoading(false);
    }
  }

  const handleSelectedRowsChange = (state) => {
    setSelectedRows(state.selectedRows);
    state.selectedRows.forEach(row => {
      console.log(`Title: ${row.title}, ID: ${row.id}`);
    });
  };

  const columns = [
    {
      name: "ID",
      selector: (row) => row.id,
      sortable: true
    },
    {
      name: "IMAGE",
      selector: (row) => <img width={60} height={60} src={row.image} alt={row.title} />
    },
    {
      name: "TITLE",
      selector: (row) => row.title,
      sortable: true
    },
    {
      name: "EDIT",
      cell: (row) => <button className='btn btn-primary' onClick={() => alert(row.title)}>Edit</button>,
    },
    {
      name: "DELETE",
      cell: (row) => <button className='btn btn-danger' style={{ color: 'white' }} onClick={() => alert(row.title)}>Delete</button>
    }
  ];

  const conditionalRowStyles = [
    {
      when: (row) => row.title === "Mens Casual Slim Fit",
      style: {
        backgroundColor: 'grey',
        color: 'white',
      },
    },
  ];

  return (
    <>
      {selectedRows.length > 0 && (
        <p style={{ marginLeft: 20, marginBottom: 0 }}>
          SELECTED ITEMS
          <hr style={{ margin: 0, padding: 0 }} />
        </p>
      )}
      <ul>
        {selectedRows.length > 0 && (
          <>
            {selectedRows.map(row => (
              <li key={row.id}>{row.title}</li>
            ))}
          </>
        )}
      </ul>

      {loading ? (
        <div
          style={{
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: '100vh',
          }}
        >
          <CSpinner style={{ color: AllColors.appBackgroundColor }} />
        </div>
      ) : (
        <DataTable
          title='All Stores'
          data={filteredProducts}
          columns={columns}
          pagination
          fixedHeader
          fixedHeaderScrollHeight='420px'
          selectableRows
          selectableRowsHighlight
          highlightOnHover
          actions={<button className="btn btn-sm btn-info">Export</button>}
          subHeader
          subHeaderAlign='left'
          subHeaderComponent={
            <input
              type='text'
              value={search}
              placeholder='Search here'
              className='w-25 form-control'
              onChange={(e) => setSearch(e.target.value)}
            />
          }
          conditionalRowStyles={conditionalRowStyles}
          onSelectedRowsChange={handleSelectedRowsChange}
          noDataComponent={
            <div
              style={{
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                height: '100vh',
              }}
            >
              {filteredProducts.length === 0 && products.length > 0 ? (
                <p>No products found with the given search criteria.</p>
              ) : null}
            </div>
          }
        />
      )}
    </>
  );
};

export default ViewStore;
