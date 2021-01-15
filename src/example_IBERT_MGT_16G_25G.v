
// file: IBERT_MGT_16G_25G.v
//////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version : 2012.3
//  \   \         Application : IBERT Ultrascale 
//  /   /         Filename : example_IBERT_MGT_16G_25G
// /___/   /\     
// \   \  /  \ 
//  \___\/\___\
//
//
// Module example_IBERT_MGT_16G_25G
// Generated by Xilinx IBERT_Ultrascale 
//////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ns

`define C_NUM_GTY_QUADS 30
`define C_GTY_REFCLKS_USED 14

module example_IBERT_MGT_16G_25G
(
  // GT top level ports
  output [(4*`C_NUM_GTY_QUADS)-1:0]		gty_txn_o,
  output [(4*`C_NUM_GTY_QUADS)-1:0]		gty_txp_o,
  input  [(4*`C_NUM_GTY_QUADS)-1:0]    	gty_rxn_i,
  input  [(4*`C_NUM_GTY_QUADS)-1:0]   	gty_rxp_i,
  input  [`C_GTY_REFCLKS_USED-1:0]      gty_refclk0p_i,
  input  [`C_GTY_REFCLKS_USED-1:0]      gty_refclk0n_i,
  input  [`C_GTY_REFCLKS_USED-1:0]      gty_refclk1p_i,
  input  [`C_GTY_REFCLKS_USED-1:0]      gty_refclk1n_i,
  input lclk40_i
);
  
  localparam dly = 1'd1;
  localparam C_SLV_DWIDTH = 32;
  localparam C_NUM_LUTS = 65536;
  
  //
  // Ibert refclk internal signals
  //
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qrefclk0_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qrefclk1_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qnorthrefclk0_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qnorthrefclk1_i;        	
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qsouthrefclk0_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qsouthrefclk1_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qrefclk00_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qrefclk10_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qrefclk01_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qrefclk11_i;  
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qnorthrefclk00_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qnorthrefclk10_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qnorthrefclk01_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qnorthrefclk11_i;  
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qsouthrefclk00_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qsouthrefclk10_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qsouthrefclk01_i;
   wire  [`C_NUM_GTY_QUADS-1:0]    gty_qsouthrefclk11_i; 
   wire  [`C_GTY_REFCLKS_USED-1:0] gty_refclk0_i;
   wire  [`C_GTY_REFCLKS_USED-1:0] gty_refclk1_i;
   wire  [`C_GTY_REFCLKS_USED-1:0] gty_odiv2_0_i;
   wire  [`C_GTY_REFCLKS_USED-1:0] gty_odiv2_1_i;
   wire                        gty_sysclk_i;
   wire lclk40;
    
   wire [ 0 : C_SLV_DWIDTH - 1] heater_read_add;
   wire [ 0 : C_SLV_DWIDTH - 1] heater_output;
   wire [31 : 0 ] heater_adjust;
   wire heater_reset;
   wire heater_enable;
  //
  // Refclk IBUFDS instantiations
  //

    IBUFDS_GTE4 u_buf_q0_clk0
      (
        .O            (gty_refclk0_i[0]),
        .ODIV2        (gty_odiv2_0_i[0]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[0]),
        .IB           (gty_refclk0n_i[0])
      );

    IBUFDS_GTE4 u_buf_q0_clk1
      (
        .O            (gty_refclk1_i[0]),
        .ODIV2        (gty_odiv2_1_i[0]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[0]),
        .IB           (gty_refclk1n_i[0])
      );

    IBUFDS_GTE4 u_buf_q2_clk0
      (
        .O            (gty_refclk0_i[1]),
        .ODIV2        (gty_odiv2_0_i[1]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[1]),
        .IB           (gty_refclk0n_i[1])
      );

    IBUFDS_GTE4 u_buf_q2_clk1
      (
        .O            (gty_refclk1_i[1]),
        .ODIV2        (gty_odiv2_1_i[1]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[1]),
        .IB           (gty_refclk1n_i[1])
      );

    IBUFDS_GTE4 u_buf_q4_clk0
      (
        .O            (gty_refclk0_i[2]),
        .ODIV2        (gty_odiv2_0_i[2]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[2]),
        .IB           (gty_refclk0n_i[2])
      );

    IBUFDS_GTE4 u_buf_q4_clk1
      (
        .O            (gty_refclk1_i[2]),
        .ODIV2        (gty_odiv2_1_i[2]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[2]),
        .IB           (gty_refclk1n_i[2])
      );

    IBUFDS_GTE4 u_buf_q6_clk0
      (
        .O            (gty_refclk0_i[3]),
        .ODIV2        (gty_odiv2_0_i[3]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[3]),
        .IB           (gty_refclk0n_i[3])
      );

    IBUFDS_GTE4 u_buf_q6_clk1
      (
        .O            (gty_refclk1_i[3]),
        .ODIV2        (gty_odiv2_1_i[3]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[3]),
        .IB           (gty_refclk1n_i[3])
      );

    IBUFDS_GTE4 u_buf_q8_clk0
      (
        .O            (gty_refclk0_i[4]),
        .ODIV2        (gty_odiv2_0_i[4]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[4]),
        .IB           (gty_refclk0n_i[4])
      );

    IBUFDS_GTE4 u_buf_q8_clk1
      (
        .O            (gty_refclk1_i[4]),
        .ODIV2        (gty_odiv2_1_i[4]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[4]),
        .IB           (gty_refclk1n_i[4])
      );

    IBUFDS_GTE4 u_buf_q11_clk0
      (
        .O            (gty_refclk0_i[5]),
        .ODIV2        (gty_odiv2_0_i[5]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[5]),
        .IB           (gty_refclk0n_i[5])
      );

    IBUFDS_GTE4 u_buf_q11_clk1
      (
        .O            (gty_refclk1_i[5]),
        .ODIV2        (gty_odiv2_1_i[5]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[5]),
        .IB           (gty_refclk1n_i[5])
      );

    IBUFDS_GTE4 u_buf_q14_clk0
      (
        .O            (gty_refclk0_i[6]),
        .ODIV2        (gty_odiv2_0_i[6]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[6]),
        .IB           (gty_refclk0n_i[6])
      );

    IBUFDS_GTE4 u_buf_q14_clk1
      (
        .O            (gty_refclk1_i[6]),
        .ODIV2        (gty_odiv2_1_i[6]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[6]),
        .IB           (gty_refclk1n_i[6])
      );

    IBUFDS_GTE4 u_buf_q15_clk0
      (
        .O            (gty_refclk0_i[7]),
        .ODIV2        (gty_odiv2_0_i[7]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[7]),
        .IB           (gty_refclk0n_i[7])
      );

    IBUFDS_GTE4 u_buf_q15_clk1
      (
        .O            (gty_refclk1_i[7]),
        .ODIV2        (gty_odiv2_1_i[7]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[7]),
        .IB           (gty_refclk1n_i[7])
      );

    IBUFDS_GTE4 u_buf_q17_clk0
      (
        .O            (gty_refclk0_i[8]),
        .ODIV2        (gty_odiv2_0_i[8]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[8]),
        .IB           (gty_refclk0n_i[8])
      );

    IBUFDS_GTE4 u_buf_q17_clk1
      (
        .O            (gty_refclk1_i[8]),
        .ODIV2        (gty_odiv2_1_i[8]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[8]),
        .IB           (gty_refclk1n_i[8])
      );

    IBUFDS_GTE4 u_buf_q19_clk0
      (
        .O            (gty_refclk0_i[9]),
        .ODIV2        (gty_odiv2_0_i[9]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[9]),
        .IB           (gty_refclk0n_i[9])
      );

    IBUFDS_GTE4 u_buf_q19_clk1
      (
        .O            (gty_refclk1_i[9]),
        .ODIV2        (gty_odiv2_1_i[9]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[9]),
        .IB           (gty_refclk1n_i[9])
      );

    IBUFDS_GTE4 u_buf_q21_clk0
      (
        .O            (gty_refclk0_i[10]),
        .ODIV2        (gty_odiv2_0_i[10]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[10]),
        .IB           (gty_refclk0n_i[10])
      );

    IBUFDS_GTE4 u_buf_q21_clk1
      (
        .O            (gty_refclk1_i[10]),
        .ODIV2        (gty_odiv2_1_i[10]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[10]),
        .IB           (gty_refclk1n_i[10])
      );

    IBUFDS_GTE4 u_buf_q23_clk0
      (
        .O            (gty_refclk0_i[11]),
        .ODIV2        (gty_odiv2_0_i[11]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[11]),
        .IB           (gty_refclk0n_i[11])
      );

    IBUFDS_GTE4 u_buf_q23_clk1
      (
        .O            (gty_refclk1_i[11]),
        .ODIV2        (gty_odiv2_1_i[11]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[11]),
        .IB           (gty_refclk1n_i[11])
      );

    IBUFDS_GTE4 u_buf_q26_clk0
      (
        .O            (gty_refclk0_i[12]),
        .ODIV2        (gty_odiv2_0_i[12]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[12]),
        .IB           (gty_refclk0n_i[12])
      );

    IBUFDS_GTE4 u_buf_q26_clk1
      (
        .O            (gty_refclk1_i[12]),
        .ODIV2        (gty_odiv2_1_i[12]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[12]),
        .IB           (gty_refclk1n_i[12])
      );

    IBUFDS_GTE4 u_buf_q29_clk0
      (
        .O            (gty_refclk0_i[13]),
        .ODIV2        (gty_odiv2_0_i[13]),
        .CEB          (1'b0),
        .I            (gty_refclk0p_i[13]),
        .IB           (gty_refclk0n_i[13])
      );

    IBUFDS_GTE4 u_buf_q29_clk1
      (
        .O            (gty_refclk1_i[13]),
        .ODIV2        (gty_odiv2_1_i[13]),
        .CEB          (1'b0),
        .I            (gty_refclk1p_i[13]),
        .IB           (gty_refclk1n_i[13])
      );


  //
  // Refclk connection from each IBUFDS to respective quads depending on the source selected in gui
  //
  assign gty_qrefclk0_i[0] = gty_refclk0_i[0];
  assign gty_qrefclk1_i[0] = gty_refclk1_i[0];
  assign gty_qnorthrefclk0_i[0] = 1'b0;
  assign gty_qnorthrefclk1_i[0] = 1'b0;
  assign gty_qsouthrefclk0_i[0] = 1'b0;
  assign gty_qsouthrefclk1_i[0] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[0] = gty_refclk0_i[0];
  assign gty_qrefclk10_i[0] = gty_refclk1_i[0];
  assign gty_qrefclk01_i[0] = 1'b0;
  assign gty_qrefclk11_i[0] = 1'b0;  
  assign gty_qnorthrefclk00_i[0] = 1'b0;
  assign gty_qnorthrefclk10_i[0] = 1'b0;
  assign gty_qnorthrefclk01_i[0] = 1'b0;
  assign gty_qnorthrefclk11_i[0] = 1'b0;  
  assign gty_qsouthrefclk00_i[0] = 1'b0;
  assign gty_qsouthrefclk10_i[0] = 1'b0;  
  assign gty_qsouthrefclk01_i[0] = 1'b0;
  assign gty_qsouthrefclk11_i[0] = 1'b0; 
 

  assign gty_qrefclk0_i[1] = 1'b0;
  assign gty_qrefclk1_i[1] = 1'b0;
  assign gty_qnorthrefclk0_i[1] = 1'b0;
  assign gty_qnorthrefclk1_i[1] = 1'b0;
  assign gty_qsouthrefclk0_i[1] = gty_refclk0_i[1];
  assign gty_qsouthrefclk1_i[1] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[1] = 1'b0;
  assign gty_qrefclk10_i[1] = 1'b0;
  assign gty_qrefclk01_i[1] = 1'b0;
  assign gty_qrefclk11_i[1] = 1'b0;
  assign gty_qnorthrefclk00_i[1] = 1'b0;
  assign gty_qnorthrefclk10_i[1] = 1'b0;
  assign gty_qnorthrefclk01_i[1] = 1'b0;
  assign gty_qnorthrefclk11_i[1] = 1'b0;
  assign gty_qsouthrefclk00_i[1] = gty_refclk0_i[1];
  assign gty_qsouthrefclk10_i[1] = 1'b0;
  assign gty_qsouthrefclk01_i[1] = 1'b0;
  assign gty_qsouthrefclk11_i[1] = 1'b0;
 
  assign gty_qrefclk0_i[2] = gty_refclk0_i[1];
  assign gty_qrefclk1_i[2] = gty_refclk1_i[1];
  assign gty_qnorthrefclk0_i[2] = 1'b0;
  assign gty_qnorthrefclk1_i[2] = 1'b0;
  assign gty_qsouthrefclk0_i[2] = 1'b0;
  assign gty_qsouthrefclk1_i[2] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[2] = gty_refclk0_i[1];
  assign gty_qrefclk10_i[2] = gty_refclk1_i[1];
  assign gty_qrefclk01_i[2] = 1'b0;
  assign gty_qrefclk11_i[2] = 1'b0;  
  assign gty_qnorthrefclk00_i[2] = 1'b0;
  assign gty_qnorthrefclk10_i[2] = 1'b0;
  assign gty_qnorthrefclk01_i[2] = 1'b0;
  assign gty_qnorthrefclk11_i[2] = 1'b0;  
  assign gty_qsouthrefclk00_i[2] = 1'b0;
  assign gty_qsouthrefclk10_i[2] = 1'b0;  
  assign gty_qsouthrefclk01_i[2] = 1'b0;
  assign gty_qsouthrefclk11_i[2] = 1'b0; 
 

  assign gty_qrefclk0_i[3] = 1'b0;
  assign gty_qrefclk1_i[3] = 1'b0;
  assign gty_qnorthrefclk0_i[3] = gty_refclk0_i[1];
  assign gty_qnorthrefclk1_i[3] = 1'b0;
  assign gty_qsouthrefclk0_i[3] = 1'b0;
  assign gty_qsouthrefclk1_i[3] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[3] = 1'b0;
  assign gty_qrefclk10_i[3] = 1'b0;
  assign gty_qrefclk01_i[3] = 1'b0;
  assign gty_qrefclk11_i[3] = 1'b0;
  assign gty_qnorthrefclk00_i[3] = gty_refclk0_i[1];
  assign gty_qnorthrefclk10_i[3] = 1'b0;
  assign gty_qnorthrefclk01_i[3] = 1'b0;
  assign gty_qnorthrefclk11_i[3] = 1'b0;
  assign gty_qsouthrefclk00_i[3] = 1'b0;
  assign gty_qsouthrefclk10_i[3] = 1'b0;
  assign gty_qsouthrefclk01_i[3] = 1'b0;
  assign gty_qsouthrefclk11_i[3] = 1'b0;
 
  assign gty_qrefclk0_i[4] = gty_refclk0_i[2];
  assign gty_qrefclk1_i[4] = gty_refclk1_i[2];
  assign gty_qnorthrefclk0_i[4] = 1'b0;
  assign gty_qnorthrefclk1_i[4] = 1'b0;
  assign gty_qsouthrefclk0_i[4] = 1'b0;
  assign gty_qsouthrefclk1_i[4] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[4] = gty_refclk0_i[2];
  assign gty_qrefclk10_i[4] = gty_refclk1_i[2];
  assign gty_qrefclk01_i[4] = 1'b0;
  assign gty_qrefclk11_i[4] = 1'b0;  
  assign gty_qnorthrefclk00_i[4] = 1'b0;
  assign gty_qnorthrefclk10_i[4] = 1'b0;
  assign gty_qnorthrefclk01_i[4] = 1'b0;
  assign gty_qnorthrefclk11_i[4] = 1'b0;  
  assign gty_qsouthrefclk00_i[4] = 1'b0;
  assign gty_qsouthrefclk10_i[4] = 1'b0;  
  assign gty_qsouthrefclk01_i[4] = 1'b0;
  assign gty_qsouthrefclk11_i[4] = 1'b0; 
 

  assign gty_qrefclk0_i[5] = 1'b0;
  assign gty_qrefclk1_i[5] = 1'b0;
  assign gty_qnorthrefclk0_i[5] = 1'b0;
  assign gty_qnorthrefclk1_i[5] = 1'b0;
  assign gty_qsouthrefclk0_i[5] = gty_refclk0_i[3];
  assign gty_qsouthrefclk1_i[5] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[5] = 1'b0;
  assign gty_qrefclk10_i[5] = 1'b0;
  assign gty_qrefclk01_i[5] = 1'b0;
  assign gty_qrefclk11_i[5] = 1'b0;
  assign gty_qnorthrefclk00_i[5] = 1'b0;
  assign gty_qnorthrefclk10_i[5] = 1'b0;
  assign gty_qnorthrefclk01_i[5] = 1'b0;
  assign gty_qnorthrefclk11_i[5] = 1'b0;
  assign gty_qsouthrefclk00_i[5] = gty_refclk0_i[3];
  assign gty_qsouthrefclk10_i[5] = 1'b0;
  assign gty_qsouthrefclk01_i[5] = 1'b0;
  assign gty_qsouthrefclk11_i[5] = 1'b0;
 
  assign gty_qrefclk0_i[6] = gty_refclk0_i[3];
  assign gty_qrefclk1_i[6] = gty_refclk1_i[3];
  assign gty_qnorthrefclk0_i[6] = 1'b0;
  assign gty_qnorthrefclk1_i[6] = 1'b0;
  assign gty_qsouthrefclk0_i[6] = 1'b0;
  assign gty_qsouthrefclk1_i[6] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[6] = gty_refclk0_i[3];
  assign gty_qrefclk10_i[6] = gty_refclk1_i[3];
  assign gty_qrefclk01_i[6] = 1'b0;
  assign gty_qrefclk11_i[6] = 1'b0;  
  assign gty_qnorthrefclk00_i[6] = 1'b0;
  assign gty_qnorthrefclk10_i[6] = 1'b0;
  assign gty_qnorthrefclk01_i[6] = 1'b0;
  assign gty_qnorthrefclk11_i[6] = 1'b0;  
  assign gty_qsouthrefclk00_i[6] = 1'b0;
  assign gty_qsouthrefclk10_i[6] = 1'b0;  
  assign gty_qsouthrefclk01_i[6] = 1'b0;
  assign gty_qsouthrefclk11_i[6] = 1'b0; 
 

  assign gty_qrefclk0_i[7] = 1'b0;
  assign gty_qrefclk1_i[7] = 1'b0;
  assign gty_qnorthrefclk0_i[7] = 1'b0;
  assign gty_qnorthrefclk1_i[7] = 1'b0;
  assign gty_qsouthrefclk0_i[7] = gty_refclk0_i[4];
  assign gty_qsouthrefclk1_i[7] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[7] = 1'b0;
  assign gty_qrefclk10_i[7] = 1'b0;
  assign gty_qrefclk01_i[7] = 1'b0;
  assign gty_qrefclk11_i[7] = 1'b0;
  assign gty_qnorthrefclk00_i[7] = 1'b0;
  assign gty_qnorthrefclk10_i[7] = 1'b0;
  assign gty_qnorthrefclk01_i[7] = 1'b0;
  assign gty_qnorthrefclk11_i[7] = 1'b0;
  assign gty_qsouthrefclk00_i[7] = gty_refclk0_i[4];
  assign gty_qsouthrefclk10_i[7] = 1'b0;
  assign gty_qsouthrefclk01_i[7] = 1'b0;
  assign gty_qsouthrefclk11_i[7] = 1'b0;
 
  assign gty_qrefclk0_i[8] = gty_refclk0_i[4];
  assign gty_qrefclk1_i[8] = gty_refclk1_i[4];
  assign gty_qnorthrefclk0_i[8] = 1'b0;
  assign gty_qnorthrefclk1_i[8] = 1'b0;
  assign gty_qsouthrefclk0_i[8] = 1'b0;
  assign gty_qsouthrefclk1_i[8] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[8] = gty_refclk0_i[4];
  assign gty_qrefclk10_i[8] = gty_refclk1_i[4];
  assign gty_qrefclk01_i[8] = 1'b0;
  assign gty_qrefclk11_i[8] = 1'b0;  
  assign gty_qnorthrefclk00_i[8] = 1'b0;
  assign gty_qnorthrefclk10_i[8] = 1'b0;
  assign gty_qnorthrefclk01_i[8] = 1'b0;
  assign gty_qnorthrefclk11_i[8] = 1'b0;  
  assign gty_qsouthrefclk00_i[8] = 1'b0;
  assign gty_qsouthrefclk10_i[8] = 1'b0;  
  assign gty_qsouthrefclk01_i[8] = 1'b0;
  assign gty_qsouthrefclk11_i[8] = 1'b0; 
 

  assign gty_qrefclk0_i[9] = 1'b0;
  assign gty_qrefclk1_i[9] = 1'b0;
  assign gty_qnorthrefclk0_i[9] = gty_refclk0_i[4];
  assign gty_qnorthrefclk1_i[9] = 1'b0;
  assign gty_qsouthrefclk0_i[9] = 1'b0;
  assign gty_qsouthrefclk1_i[9] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[9] = 1'b0;
  assign gty_qrefclk10_i[9] = 1'b0;
  assign gty_qrefclk01_i[9] = 1'b0;
  assign gty_qrefclk11_i[9] = 1'b0;
  assign gty_qnorthrefclk00_i[9] = gty_refclk0_i[4];
  assign gty_qnorthrefclk10_i[9] = 1'b0;
  assign gty_qnorthrefclk01_i[9] = 1'b0;
  assign gty_qnorthrefclk11_i[9] = 1'b0;
  assign gty_qsouthrefclk00_i[9] = 1'b0;
  assign gty_qsouthrefclk10_i[9] = 1'b0;
  assign gty_qsouthrefclk01_i[9] = 1'b0;
  assign gty_qsouthrefclk11_i[9] = 1'b0;
 
  assign gty_qrefclk0_i[10] = 1'b0;
  assign gty_qrefclk1_i[10] = 1'b0;
  assign gty_qnorthrefclk0_i[10] = 1'b0;
  assign gty_qnorthrefclk1_i[10] = 1'b0;
  assign gty_qsouthrefclk0_i[10] = gty_refclk0_i[5];
  assign gty_qsouthrefclk1_i[10] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[10] = 1'b0;
  assign gty_qrefclk10_i[10] = 1'b0;
  assign gty_qrefclk01_i[10] = 1'b0;
  assign gty_qrefclk11_i[10] = 1'b0;
  assign gty_qnorthrefclk00_i[10] = 1'b0;
  assign gty_qnorthrefclk10_i[10] = 1'b0;
  assign gty_qnorthrefclk01_i[10] = 1'b0;
  assign gty_qnorthrefclk11_i[10] = 1'b0;
  assign gty_qsouthrefclk00_i[10] = gty_refclk0_i[5];
  assign gty_qsouthrefclk10_i[10] = 1'b0;
  assign gty_qsouthrefclk01_i[10] = 1'b0;
  assign gty_qsouthrefclk11_i[10] = 1'b0;
 
  assign gty_qrefclk0_i[11] = gty_refclk0_i[5];
  assign gty_qrefclk1_i[11] = gty_refclk1_i[5];
  assign gty_qnorthrefclk0_i[11] = 1'b0;
  assign gty_qnorthrefclk1_i[11] = 1'b0;
  assign gty_qsouthrefclk0_i[11] = 1'b0;
  assign gty_qsouthrefclk1_i[11] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[11] = gty_refclk0_i[5];
  assign gty_qrefclk10_i[11] = gty_refclk1_i[5];
  assign gty_qrefclk01_i[11] = 1'b0;
  assign gty_qrefclk11_i[11] = 1'b0;  
  assign gty_qnorthrefclk00_i[11] = 1'b0;
  assign gty_qnorthrefclk10_i[11] = 1'b0;
  assign gty_qnorthrefclk01_i[11] = 1'b0;
  assign gty_qnorthrefclk11_i[11] = 1'b0;  
  assign gty_qsouthrefclk00_i[11] = 1'b0;
  assign gty_qsouthrefclk10_i[11] = 1'b0;  
  assign gty_qsouthrefclk01_i[11] = 1'b0;
  assign gty_qsouthrefclk11_i[11] = 1'b0; 
 

  assign gty_qrefclk0_i[12] = 1'b0;
  assign gty_qrefclk1_i[12] = 1'b0;
  assign gty_qnorthrefclk0_i[12] = gty_refclk0_i[5];
  assign gty_qnorthrefclk1_i[12] = 1'b0;
  assign gty_qsouthrefclk0_i[12] = 1'b0;
  assign gty_qsouthrefclk1_i[12] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[12] = 1'b0;
  assign gty_qrefclk10_i[12] = 1'b0;
  assign gty_qrefclk01_i[12] = 1'b0;
  assign gty_qrefclk11_i[12] = 1'b0;
  assign gty_qnorthrefclk00_i[12] = gty_refclk0_i[5];
  assign gty_qnorthrefclk10_i[12] = 1'b0;
  assign gty_qnorthrefclk01_i[12] = 1'b0;
  assign gty_qnorthrefclk11_i[12] = 1'b0;
  assign gty_qsouthrefclk00_i[12] = 1'b0;
  assign gty_qsouthrefclk10_i[12] = 1'b0;
  assign gty_qsouthrefclk01_i[12] = 1'b0;
  assign gty_qsouthrefclk11_i[12] = 1'b0;
 
  assign gty_qrefclk0_i[13] = 1'b0;
  assign gty_qrefclk1_i[13] = 1'b0;
  assign gty_qnorthrefclk0_i[13] = 1'b0;
  assign gty_qnorthrefclk1_i[13] = 1'b0;
  assign gty_qsouthrefclk0_i[13] = gty_refclk0_i[6];
  assign gty_qsouthrefclk1_i[13] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[13] = 1'b0;
  assign gty_qrefclk10_i[13] = 1'b0;
  assign gty_qrefclk01_i[13] = 1'b0;
  assign gty_qrefclk11_i[13] = 1'b0;
  assign gty_qnorthrefclk00_i[13] = 1'b0;
  assign gty_qnorthrefclk10_i[13] = 1'b0;
  assign gty_qnorthrefclk01_i[13] = 1'b0;
  assign gty_qnorthrefclk11_i[13] = 1'b0;
  assign gty_qsouthrefclk00_i[13] = gty_refclk0_i[6];
  assign gty_qsouthrefclk10_i[13] = 1'b0;
  assign gty_qsouthrefclk01_i[13] = 1'b0;
  assign gty_qsouthrefclk11_i[13] = 1'b0;
 
  assign gty_qrefclk0_i[14] = gty_refclk0_i[6];
  assign gty_qrefclk1_i[14] = gty_refclk1_i[6];
  assign gty_qnorthrefclk0_i[14] = 1'b0;
  assign gty_qnorthrefclk1_i[14] = 1'b0;
  assign gty_qsouthrefclk0_i[14] = 1'b0;
  assign gty_qsouthrefclk1_i[14] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[14] = gty_refclk0_i[6];
  assign gty_qrefclk10_i[14] = gty_refclk1_i[6];
  assign gty_qrefclk01_i[14] = 1'b0;
  assign gty_qrefclk11_i[14] = 1'b0;  
  assign gty_qnorthrefclk00_i[14] = 1'b0;
  assign gty_qnorthrefclk10_i[14] = 1'b0;
  assign gty_qnorthrefclk01_i[14] = 1'b0;
  assign gty_qnorthrefclk11_i[14] = 1'b0;  
  assign gty_qsouthrefclk00_i[14] = 1'b0;
  assign gty_qsouthrefclk10_i[14] = 1'b0;  
  assign gty_qsouthrefclk01_i[14] = 1'b0;
  assign gty_qsouthrefclk11_i[14] = 1'b0; 
 

  assign gty_qrefclk0_i[15] = gty_refclk0_i[7];
  assign gty_qrefclk1_i[15] = gty_refclk1_i[7];
  assign gty_qnorthrefclk0_i[15] = 1'b0;
  assign gty_qnorthrefclk1_i[15] = 1'b0;
  assign gty_qsouthrefclk0_i[15] = 1'b0;
  assign gty_qsouthrefclk1_i[15] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[15] = gty_refclk0_i[7];
  assign gty_qrefclk10_i[15] = gty_refclk1_i[7];
  assign gty_qrefclk01_i[15] = 1'b0;
  assign gty_qrefclk11_i[15] = 1'b0;  
  assign gty_qnorthrefclk00_i[15] = 1'b0;
  assign gty_qnorthrefclk10_i[15] = 1'b0;
  assign gty_qnorthrefclk01_i[15] = 1'b0;
  assign gty_qnorthrefclk11_i[15] = 1'b0;  
  assign gty_qsouthrefclk00_i[15] = 1'b0;
  assign gty_qsouthrefclk10_i[15] = 1'b0;  
  assign gty_qsouthrefclk01_i[15] = 1'b0;
  assign gty_qsouthrefclk11_i[15] = 1'b0; 
 

  assign gty_qrefclk0_i[16] = 1'b0;
  assign gty_qrefclk1_i[16] = 1'b0;
  assign gty_qnorthrefclk0_i[16] = 1'b0;
  assign gty_qnorthrefclk1_i[16] = 1'b0;
  assign gty_qsouthrefclk0_i[16] = gty_refclk0_i[8];
  assign gty_qsouthrefclk1_i[16] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[16] = 1'b0;
  assign gty_qrefclk10_i[16] = 1'b0;
  assign gty_qrefclk01_i[16] = 1'b0;
  assign gty_qrefclk11_i[16] = 1'b0;
  assign gty_qnorthrefclk00_i[16] = 1'b0;
  assign gty_qnorthrefclk10_i[16] = 1'b0;
  assign gty_qnorthrefclk01_i[16] = 1'b0;
  assign gty_qnorthrefclk11_i[16] = 1'b0;
  assign gty_qsouthrefclk00_i[16] = gty_refclk0_i[8];
  assign gty_qsouthrefclk10_i[16] = 1'b0;
  assign gty_qsouthrefclk01_i[16] = 1'b0;
  assign gty_qsouthrefclk11_i[16] = 1'b0;
 
  assign gty_qrefclk0_i[17] = gty_refclk0_i[8];
  assign gty_qrefclk1_i[17] = gty_refclk1_i[8];
  assign gty_qnorthrefclk0_i[17] = 1'b0;
  assign gty_qnorthrefclk1_i[17] = 1'b0;
  assign gty_qsouthrefclk0_i[17] = 1'b0;
  assign gty_qsouthrefclk1_i[17] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[17] = gty_refclk0_i[8];
  assign gty_qrefclk10_i[17] = gty_refclk1_i[8];
  assign gty_qrefclk01_i[17] = 1'b0;
  assign gty_qrefclk11_i[17] = 1'b0;  
  assign gty_qnorthrefclk00_i[17] = 1'b0;
  assign gty_qnorthrefclk10_i[17] = 1'b0;
  assign gty_qnorthrefclk01_i[17] = 1'b0;
  assign gty_qnorthrefclk11_i[17] = 1'b0;  
  assign gty_qsouthrefclk00_i[17] = 1'b0;
  assign gty_qsouthrefclk10_i[17] = 1'b0;  
  assign gty_qsouthrefclk01_i[17] = 1'b0;
  assign gty_qsouthrefclk11_i[17] = 1'b0; 
 

  assign gty_qrefclk0_i[18] = 1'b0;
  assign gty_qrefclk1_i[18] = 1'b0;
  assign gty_qnorthrefclk0_i[18] = gty_refclk0_i[8];
  assign gty_qnorthrefclk1_i[18] = 1'b0;
  assign gty_qsouthrefclk0_i[18] = 1'b0;
  assign gty_qsouthrefclk1_i[18] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[18] = 1'b0;
  assign gty_qrefclk10_i[18] = 1'b0;
  assign gty_qrefclk01_i[18] = 1'b0;
  assign gty_qrefclk11_i[18] = 1'b0;
  assign gty_qnorthrefclk00_i[18] = gty_refclk0_i[8];
  assign gty_qnorthrefclk10_i[18] = 1'b0;
  assign gty_qnorthrefclk01_i[18] = 1'b0;
  assign gty_qnorthrefclk11_i[18] = 1'b0;
  assign gty_qsouthrefclk00_i[18] = 1'b0;
  assign gty_qsouthrefclk10_i[18] = 1'b0;
  assign gty_qsouthrefclk01_i[18] = 1'b0;
  assign gty_qsouthrefclk11_i[18] = 1'b0;
 
  assign gty_qrefclk0_i[19] = gty_refclk0_i[9];
  assign gty_qrefclk1_i[19] = gty_refclk1_i[9];
  assign gty_qnorthrefclk0_i[19] = 1'b0;
  assign gty_qnorthrefclk1_i[19] = 1'b0;
  assign gty_qsouthrefclk0_i[19] = 1'b0;
  assign gty_qsouthrefclk1_i[19] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[19] = gty_refclk0_i[9];
  assign gty_qrefclk10_i[19] = gty_refclk1_i[9];
  assign gty_qrefclk01_i[19] = 1'b0;
  assign gty_qrefclk11_i[19] = 1'b0;  
  assign gty_qnorthrefclk00_i[19] = 1'b0;
  assign gty_qnorthrefclk10_i[19] = 1'b0;
  assign gty_qnorthrefclk01_i[19] = 1'b0;
  assign gty_qnorthrefclk11_i[19] = 1'b0;  
  assign gty_qsouthrefclk00_i[19] = 1'b0;
  assign gty_qsouthrefclk10_i[19] = 1'b0;  
  assign gty_qsouthrefclk01_i[19] = 1'b0;
  assign gty_qsouthrefclk11_i[19] = 1'b0; 
 

  assign gty_qrefclk0_i[20] = 1'b0;
  assign gty_qrefclk1_i[20] = 1'b0;
  assign gty_qnorthrefclk0_i[20] = 1'b0;
  assign gty_qnorthrefclk1_i[20] = 1'b0;
  assign gty_qsouthrefclk0_i[20] = gty_refclk0_i[10];
  assign gty_qsouthrefclk1_i[20] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[20] = 1'b0;
  assign gty_qrefclk10_i[20] = 1'b0;
  assign gty_qrefclk01_i[20] = 1'b0;
  assign gty_qrefclk11_i[20] = 1'b0;
  assign gty_qnorthrefclk00_i[20] = 1'b0;
  assign gty_qnorthrefclk10_i[20] = 1'b0;
  assign gty_qnorthrefclk01_i[20] = 1'b0;
  assign gty_qnorthrefclk11_i[20] = 1'b0;
  assign gty_qsouthrefclk00_i[20] = gty_refclk0_i[10];
  assign gty_qsouthrefclk10_i[20] = 1'b0;
  assign gty_qsouthrefclk01_i[20] = 1'b0;
  assign gty_qsouthrefclk11_i[20] = 1'b0;
 
  assign gty_qrefclk0_i[21] = gty_refclk0_i[10];
  assign gty_qrefclk1_i[21] = gty_refclk1_i[10];
  assign gty_qnorthrefclk0_i[21] = 1'b0;
  assign gty_qnorthrefclk1_i[21] = 1'b0;
  assign gty_qsouthrefclk0_i[21] = 1'b0;
  assign gty_qsouthrefclk1_i[21] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[21] = gty_refclk0_i[10];
  assign gty_qrefclk10_i[21] = gty_refclk1_i[10];
  assign gty_qrefclk01_i[21] = 1'b0;
  assign gty_qrefclk11_i[21] = 1'b0;  
  assign gty_qnorthrefclk00_i[21] = 1'b0;
  assign gty_qnorthrefclk10_i[21] = 1'b0;
  assign gty_qnorthrefclk01_i[21] = 1'b0;
  assign gty_qnorthrefclk11_i[21] = 1'b0;  
  assign gty_qsouthrefclk00_i[21] = 1'b0;
  assign gty_qsouthrefclk10_i[21] = 1'b0;  
  assign gty_qsouthrefclk01_i[21] = 1'b0;
  assign gty_qsouthrefclk11_i[21] = 1'b0; 
 

  assign gty_qrefclk0_i[22] = 1'b0;
  assign gty_qrefclk1_i[22] = 1'b0;
  assign gty_qnorthrefclk0_i[22] = 1'b0;
  assign gty_qnorthrefclk1_i[22] = 1'b0;
  assign gty_qsouthrefclk0_i[22] = gty_refclk0_i[11];
  assign gty_qsouthrefclk1_i[22] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[22] = 1'b0;
  assign gty_qrefclk10_i[22] = 1'b0;
  assign gty_qrefclk01_i[22] = 1'b0;
  assign gty_qrefclk11_i[22] = 1'b0;
  assign gty_qnorthrefclk00_i[22] = 1'b0;
  assign gty_qnorthrefclk10_i[22] = 1'b0;
  assign gty_qnorthrefclk01_i[22] = 1'b0;
  assign gty_qnorthrefclk11_i[22] = 1'b0;
  assign gty_qsouthrefclk00_i[22] = gty_refclk0_i[11];
  assign gty_qsouthrefclk10_i[22] = 1'b0;
  assign gty_qsouthrefclk01_i[22] = 1'b0;
  assign gty_qsouthrefclk11_i[22] = 1'b0;
 
  assign gty_qrefclk0_i[23] = gty_refclk0_i[11];
  assign gty_qrefclk1_i[23] = gty_refclk1_i[11];
  assign gty_qnorthrefclk0_i[23] = 1'b0;
  assign gty_qnorthrefclk1_i[23] = 1'b0;
  assign gty_qsouthrefclk0_i[23] = 1'b0;
  assign gty_qsouthrefclk1_i[23] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[23] = gty_refclk0_i[11];
  assign gty_qrefclk10_i[23] = gty_refclk1_i[11];
  assign gty_qrefclk01_i[23] = 1'b0;
  assign gty_qrefclk11_i[23] = 1'b0;  
  assign gty_qnorthrefclk00_i[23] = 1'b0;
  assign gty_qnorthrefclk10_i[23] = 1'b0;
  assign gty_qnorthrefclk01_i[23] = 1'b0;
  assign gty_qnorthrefclk11_i[23] = 1'b0;  
  assign gty_qsouthrefclk00_i[23] = 1'b0;
  assign gty_qsouthrefclk10_i[23] = 1'b0;  
  assign gty_qsouthrefclk01_i[23] = 1'b0;
  assign gty_qsouthrefclk11_i[23] = 1'b0; 
 

  assign gty_qrefclk0_i[24] = 1'b0;
  assign gty_qrefclk1_i[24] = 1'b0;
  assign gty_qnorthrefclk0_i[24] = gty_refclk0_i[11];
  assign gty_qnorthrefclk1_i[24] = 1'b0;
  assign gty_qsouthrefclk0_i[24] = 1'b0;
  assign gty_qsouthrefclk1_i[24] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[24] = 1'b0;
  assign gty_qrefclk10_i[24] = 1'b0;
  assign gty_qrefclk01_i[24] = 1'b0;
  assign gty_qrefclk11_i[24] = 1'b0;
  assign gty_qnorthrefclk00_i[24] = gty_refclk0_i[11];
  assign gty_qnorthrefclk10_i[24] = 1'b0;
  assign gty_qnorthrefclk01_i[24] = 1'b0;
  assign gty_qnorthrefclk11_i[24] = 1'b0;
  assign gty_qsouthrefclk00_i[24] = 1'b0;
  assign gty_qsouthrefclk10_i[24] = 1'b0;
  assign gty_qsouthrefclk01_i[24] = 1'b0;
  assign gty_qsouthrefclk11_i[24] = 1'b0;
 
  assign gty_qrefclk0_i[25] = 1'b0;
  assign gty_qrefclk1_i[25] = 1'b0;
  assign gty_qnorthrefclk0_i[25] = 1'b0;
  assign gty_qnorthrefclk1_i[25] = 1'b0;
  assign gty_qsouthrefclk0_i[25] = gty_refclk0_i[12];
  assign gty_qsouthrefclk1_i[25] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[25] = 1'b0;
  assign gty_qrefclk10_i[25] = 1'b0;
  assign gty_qrefclk01_i[25] = 1'b0;
  assign gty_qrefclk11_i[25] = 1'b0;
  assign gty_qnorthrefclk00_i[25] = 1'b0;
  assign gty_qnorthrefclk10_i[25] = 1'b0;
  assign gty_qnorthrefclk01_i[25] = 1'b0;
  assign gty_qnorthrefclk11_i[25] = 1'b0;
  assign gty_qsouthrefclk00_i[25] = gty_refclk0_i[12];
  assign gty_qsouthrefclk10_i[25] = 1'b0;
  assign gty_qsouthrefclk01_i[25] = 1'b0;
  assign gty_qsouthrefclk11_i[25] = 1'b0;
 
  assign gty_qrefclk0_i[26] = gty_refclk0_i[12];
  assign gty_qrefclk1_i[26] = gty_refclk1_i[12];
  assign gty_qnorthrefclk0_i[26] = 1'b0;
  assign gty_qnorthrefclk1_i[26] = 1'b0;
  assign gty_qsouthrefclk0_i[26] = 1'b0;
  assign gty_qsouthrefclk1_i[26] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[26] = gty_refclk0_i[12];
  assign gty_qrefclk10_i[26] = gty_refclk1_i[12];
  assign gty_qrefclk01_i[26] = 1'b0;
  assign gty_qrefclk11_i[26] = 1'b0;  
  assign gty_qnorthrefclk00_i[26] = 1'b0;
  assign gty_qnorthrefclk10_i[26] = 1'b0;
  assign gty_qnorthrefclk01_i[26] = 1'b0;
  assign gty_qnorthrefclk11_i[26] = 1'b0;  
  assign gty_qsouthrefclk00_i[26] = 1'b0;
  assign gty_qsouthrefclk10_i[26] = 1'b0;  
  assign gty_qsouthrefclk01_i[26] = 1'b0;
  assign gty_qsouthrefclk11_i[26] = 1'b0; 
 

  assign gty_qrefclk0_i[27] = 1'b0;
  assign gty_qrefclk1_i[27] = 1'b0;
  assign gty_qnorthrefclk0_i[27] = gty_refclk0_i[12];
  assign gty_qnorthrefclk1_i[27] = 1'b0;
  assign gty_qsouthrefclk0_i[27] = 1'b0;
  assign gty_qsouthrefclk1_i[27] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[27] = 1'b0;
  assign gty_qrefclk10_i[27] = 1'b0;
  assign gty_qrefclk01_i[27] = 1'b0;
  assign gty_qrefclk11_i[27] = 1'b0;
  assign gty_qnorthrefclk00_i[27] = gty_refclk0_i[12];
  assign gty_qnorthrefclk10_i[27] = 1'b0;
  assign gty_qnorthrefclk01_i[27] = 1'b0;
  assign gty_qnorthrefclk11_i[27] = 1'b0;
  assign gty_qsouthrefclk00_i[27] = 1'b0;
  assign gty_qsouthrefclk10_i[27] = 1'b0;
  assign gty_qsouthrefclk01_i[27] = 1'b0;
  assign gty_qsouthrefclk11_i[27] = 1'b0;
 
  assign gty_qrefclk0_i[28] = 1'b0;
  assign gty_qrefclk1_i[28] = 1'b0;
  assign gty_qnorthrefclk0_i[28] = 1'b0;
  assign gty_qnorthrefclk1_i[28] = 1'b0;
  assign gty_qsouthrefclk0_i[28] = gty_refclk0_i[13];
  assign gty_qsouthrefclk1_i[28] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[28] = 1'b0;
  assign gty_qrefclk10_i[28] = 1'b0;
  assign gty_qrefclk01_i[28] = 1'b0;
  assign gty_qrefclk11_i[28] = 1'b0;
  assign gty_qnorthrefclk00_i[28] = 1'b0;
  assign gty_qnorthrefclk10_i[28] = 1'b0;
  assign gty_qnorthrefclk01_i[28] = 1'b0;
  assign gty_qnorthrefclk11_i[28] = 1'b0;
  assign gty_qsouthrefclk00_i[28] = gty_refclk0_i[13];
  assign gty_qsouthrefclk10_i[28] = 1'b0;
  assign gty_qsouthrefclk01_i[28] = 1'b0;
  assign gty_qsouthrefclk11_i[28] = 1'b0;
 
  assign gty_qrefclk0_i[29] = gty_refclk0_i[13];
  assign gty_qrefclk1_i[29] = gty_refclk1_i[13];
  assign gty_qnorthrefclk0_i[29] = 1'b0;
  assign gty_qnorthrefclk1_i[29] = 1'b0;
  assign gty_qsouthrefclk0_i[29] = 1'b0;
  assign gty_qsouthrefclk1_i[29] = 1'b0;
//GTYE4_COMMON clock connection
  assign gty_qrefclk00_i[29] = gty_refclk0_i[13];
  assign gty_qrefclk10_i[29] = gty_refclk1_i[13];
  assign gty_qrefclk01_i[29] = 1'b0;
  assign gty_qrefclk11_i[29] = 1'b0;  
  assign gty_qnorthrefclk00_i[29] = 1'b0;
  assign gty_qnorthrefclk10_i[29] = 1'b0;
  assign gty_qnorthrefclk01_i[29] = 1'b0;
  assign gty_qnorthrefclk11_i[29] = 1'b0;  
  assign gty_qsouthrefclk00_i[29] = 1'b0;
  assign gty_qsouthrefclk10_i[29] = 1'b0;  
  assign gty_qsouthrefclk01_i[29] = 1'b0;
  assign gty_qsouthrefclk11_i[29] = 1'b0; 
 

    BUFG_GT u_gty_sysclk_internal
      (
        .I        (gty_odiv2_0_i[1]),
        .O        (gty_sysclk_i),
        .CE       (1'b1),
        .CEMASK   (1'b0),
        .CLR      (1'b0),
        .CLRMASK  (1'b0),
        .DIV      (3'b000)
      );

  BUFG BUFG_inst (
      .O(lclk40), // 1-bit output: Clock output
      .I(lclk40_i)  // 1-bit input: Clock input
   );
  //
  // IBERT core instantiation
  //
  IBERT_MGT_16G_25G u_ibert_gty_core
    (
      .txn_o(gty_txn_o),
      .txp_o(gty_txp_o),
      .rxn_i(gty_rxn_i),
      .rxp_i(gty_rxp_i),
      .clk(gty_sysclk_i),
      .gtrefclk0_i(gty_qrefclk0_i),
      .gtrefclk1_i(gty_qrefclk1_i),
      .gtnorthrefclk0_i(gty_qnorthrefclk0_i),
      .gtnorthrefclk1_i(gty_qnorthrefclk1_i),
      .gtsouthrefclk0_i(gty_qsouthrefclk0_i),
      .gtsouthrefclk1_i(gty_qsouthrefclk1_i),
      .gtrefclk00_i(gty_qrefclk00_i),
      .gtrefclk10_i(gty_qrefclk10_i),
      .gtrefclk01_i(gty_qrefclk01_i),
      .gtrefclk11_i(gty_qrefclk11_i),
      .gtnorthrefclk00_i(gty_qnorthrefclk00_i),
      .gtnorthrefclk10_i(gty_qnorthrefclk10_i),
      .gtnorthrefclk01_i(gty_qnorthrefclk01_i),
      .gtnorthrefclk11_i(gty_qnorthrefclk11_i),
      .gtsouthrefclk00_i(gty_qsouthrefclk00_i),
      .gtsouthrefclk10_i(gty_qsouthrefclk10_i),
      .gtsouthrefclk01_i(gty_qsouthrefclk01_i),
      .gtsouthrefclk11_i(gty_qsouthrefclk11_i)
    );
        
  heater #
  (
    .C_SLV_DWIDTH  (C_SLV_DWIDTH),
    .C_NUM_LUTS	   (C_NUM_LUTS)
  )
  heater_inst
  (
    .clk                     (lclk40),
    .reset                   (heater_reset),
    .enable_heater           (heater_enable),
    .adjust_heaters          (heater_adjust),
    .read_which_heater       (heater_read_addr),
    .heater_output           (heater_output)
  );
  
  vio_0 vio_inst (
  .clk(lclk40),                // input wire clk
  .probe_in0(heater_output),    // input wire [31 : 0] probe_in0
  .probe_out0(heater_adjust),  // output wire [31 : 0] probe_out0
  .probe_out1(heater_read_addr),  // output wire [31 : 0] probe_out1
  .probe_out2(heater_reset),  // output wire [0 : 0] probe_out2
  .probe_out3(heater_enable)  // output wire [0 : 0] probe_out3
);

endmodule
