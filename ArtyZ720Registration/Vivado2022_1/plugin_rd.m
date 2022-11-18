function hRD = plugin_rd()
    % Reference design definition
    
    %   Copyright 2022 Yihua Liu
    
    % Construct reference design object
    hRD = hdlcoder.ReferenceDesign('SynthesisTool', 'Xilinx Vivado');
    
    hRD.ReferenceDesignName = 'Demo system';
    hRD.BoardName = 'Arty Z7-20';
    
    % Tool information
    hRD.SupportedToolVersion = {'2022.1'};
    
    % add custom Vivado design
    hRD.addCustomVivadoDesign( ...
        'CustomBlockDesignTcl', 'PmodIPs.tcl', ...
        'VivadoBoardPart',      'digilentinc.com:arty-z7-20:part0:1.1');
    
    %% Add interfaces
    % add clock interface
    hRD.addClockInterface( ...
        'ClockConnection',   'core_clkwiz/clk_out1', ...
        'ResetConnection',   'sys_core_rstgen/peripheral_aresetn');
    
    % add AXI4 and AXI4-Lite slave interfaces
    hRD.addAXI4SlaveInterface( ...
        'InterfaceConnection', 'axi_cpu_interconnect/M00_AXI', ...
        'BaseAddress',         '0x40010000', ...
        'MasterAddressSpace',  'sys_cpu/Data');
    
    hRD.DeviceTreeName = 'devicetree_axilite.dtb';
    
    % LocalWords:  Vivado ARTY Tcl tcl digilentinc arty wiz proc aresetn AXI axi
    % LocalWords:  devicetree axilite dtb
    