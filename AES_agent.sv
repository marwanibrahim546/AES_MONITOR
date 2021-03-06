class AES_agent extends uvm_agent;

`uvm_component_utils(AES_agent)

uvm_analysis_port#(AES_transaction) agent_ap_before;
uvm_analysis_port#(AES_transaction) agent_ap_after;

AES_sequencer		aes_seqr;
AES_driver		aes_drvr;
AES_monitor_before	aes_mon_before;
AES_monitor_after	aes_mon_after;

function new(string name, uvm_component parent);
	super.new(name, parent);
endfunction: new

function void build_phase(uvm_phase phase);
	super.build_phase(phase);

	agent_ap_before	= new(.name("agent_ap_before"), .parent(this));
	agent_ap_after	= new(.name("agent_ap_after"), .parent(this));

	aes_seqr		= AES_sequencer::type_id::create(.name("aes_seqr"), .parent(this));
	aes_drvr		= AES_driver::type_id::create(.name("aes_drvr"), .parent(this));
	aes_mon_before	= AES_monitor_before::type_id::create(.name("aes_mon_before"), .parent(this));
	aes_mon_after	= AES_monitor_after::type_id::create(.name("aes_mon_after"), .parent(this));
endfunction: build_phase

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
		
	aes_drvr.seq_item_port.connect(aes_seqr.seq_item_export);
	aes_mon_before.mon_ap_before.connect(agent_ap_before);
	aes_mon_after.mon_ap_after.connect(agent_ap_after);
endfunction: connect_phase

endclass: AES_agent