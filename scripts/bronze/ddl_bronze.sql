----- this script will create tables in the bronze schema---------------


--- Creating and loading table crm_cust_info---------------
DROP table crm_cust_info
create table crm_cust_info( 
  cst_id int,
  cst_key STRING,
  cst_firstname STRING,
  cst_lastname STRING,
  cst_marital_status STRING,
  cst_gndr STRING,
  cst_create_date date
);

COPY INTO Datawarehouse.bronze.crm_cust_info
FROM '/Volumes/datawarehouse/landings/datasets/cust_info.csv'
FILEFORMAT = csv
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true');

--- creating and loading table crm_prod_info----------
drop table crm_prod_info
create table crm_prod_info(
  prd_id int,
  prd_key STRING,
  prd_nm STRING,
  prd_cost int,
  prd_line STRING,
  prd_start_dt date,
  prd_end_dt date
)
copy into crm_prod_info
from '/Volumes/datawarehouse/landings/datasets/prd_info.csv'
FILEFORMAT = csv
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true')


-----creating and loading into crm_sales_details---------------

drop table crm_sales_details
create table crm_sales_details(
  sls_ord_num string,
  sls_prd_key STRING,
  sls_cust_id int,
  sls_order_dt int,
  sls_ship_dt int,
  sls_due_dt int,
  sls_sales int,
  sls_quantity int,
  sls_price int
)

copy into crm_sales_details
from '/Volumes/datawarehouse/landings/datasets/sales_details.csv'
FILEFORMAT = csv
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true')

------Creating and loading table erp_cus_az12---------------------

drop table erp_cust_az12
create table erp_cust_az12(
  CID string,
  BDATE date,
  GEN STRING
)
copy into erp_cust_az12
from '/Volumes/datawarehouse/landings/datasets/CUST_AZ12.csv'
FILEFORMAT = csv
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true')

----- Creating and loading table erp_loc_a101--------------------

drop table erp_loc_a101
create table erp_loc_a101(
  CID string,
  CNTRY string
)
copy into erp_loc_a101
from '/Volumes/datawarehouse/landings/datasets/LOC_A101.csv'
FILEFORMAT = csv
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true')

-------- creating and loading erp_px_cat_g1v2----------

drop table erp_px_cat_g1v2
create table erp_px_cat_g1v2(
  ID string,
  CAT string,
  SUBCAT string,
  MAINTENANCE string
)
copy into erp_px_cat_g1v2
from '/Volumes/datawarehouse/landings/datasets/PX_CAT_G1V2.csv'
FILEFORMAT = csv
FORMAT_OPTIONS ('header'='true', 'inferSchema'='true')

