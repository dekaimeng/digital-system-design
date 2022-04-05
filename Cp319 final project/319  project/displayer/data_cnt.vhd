
LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;

ENTITY data_cnt IS
   PORT (
      clk     : IN STD_LOGIC;
      reset     : IN STD_LOGIC;
      dollars : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      cents   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END data_cnt;

ARCHITECTURE behave OF data_cnt IS  
   SIGNAL data1_H : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
   SIGNAL data1_L : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
   SIGNAL data2_H   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
   SIGNAL data2_L   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
BEGIN
   

   PROCESS (clk, reset)
   BEGIN
      IF (reset = '1') THEN
         data1_H <= "0000";
         data1_L <= "0000";
      ELSIF (clk'EVENT AND clk = '1') THEN
         IF (data1_H = "1001" AND data1_L = "1001" AND data2_H = "1001" AND data2_L = "1001") THEN
            data1_H <= "0000";
            data1_L <= "0000";
         ELSIF (data1_L = "1001" AND data2_H = "1001" AND data2_L = "1001") THEN
            data1_H <= data1_H + "0001";
            data1_L <= "0000";
         ELSIF (data2_H = "1001" AND data2_L = "1001") THEN
            data1_H <= data1_H;
            data1_L <= data1_L + "0001";
         ELSE
            data1_H <= data1_H;
            data1_L <= data1_L;
         END IF;
      END IF;
   END PROCESS;

   PROCESS (clk, reset)
   BEGIN
      IF (reset = '1') THEN
         data2_H <= "0000";
         data2_L <= "0000";
      ELSIF (clk'EVENT AND clk = '1') THEN
         IF (data2_H = "1001" AND data2_L = "1001") THEN
            data2_H <= "0000";
            data2_L <= "0000";
         ELSIF (data2_L = "1001") THEN
            data2_H <= data2_H + "0001";
            data2_L <= "0000";
         ELSE
            data2_H <= data2_H;
            data2_L <= data2_L + "0001";
         END IF;
      END IF;
   END PROCESS;
    
   dollars <= data1_H & data1_L;
   cents <= data2_H & data2_L;
   
END behave;



