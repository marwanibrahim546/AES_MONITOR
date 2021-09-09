class AES_monitor_before extends uvm_monitor;   // the result monitor 

	`uvm_component_utils(AES_monitor_before) 
 
virtual AES_if vif; 
uvm_analysis_port#(AES_transaction) mon_ap_before ;     


function new(string name,uvm_component parent);
	super.new(name, parent);
endfunction: new

// build the interface and the analysis port 
function void build_phase(uvm_phase phase);
	super.build_phase(phase);

	if(!uvm_config_db#(virtual AES_if)::get(this,"","AES_if",vif))
		`uvm_fatal("MON","could not get vif") 

	mon_ap_before = new(.name("mon_ap_before"), .parent(this));

endfunction: build_phase


task run_phase(uvm_phase phase);



 



endtask: run_phase

endclass : AES_monitor_before 

//////////////////////////////////////////////////////////////////// 

class AES_monitor_after extends uvm_monitor; // the command monitor  

	`uvm_component_utils(AES_monitor_after) 

virtual AES_if vif;
uvm_analysis_port#(simpleadder_transaction) mon_ap_after;



function new(string name, uvm_component parent);
	super.new(name, parent);
	simpleadder_cg = new;            ///////??????????//////<<<<<<<<<<<<<<<<<<
endfunction: new




function void build_phase(uvm_phase phase);

	super.build_phase(phase);

	if(!uvm_config_db#(virtual AES_if)::get(this,"","AES_if",vif))
		`uvm_fatal("MON","could not get vif") 

	mon_ap_before = new(.name("mon_ap_before"), .parent(this));

endfunction: build_phase








endclass : AES_monitor_after
























