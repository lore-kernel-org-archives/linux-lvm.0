Subject: Re: [linux-lvm] How to associate two paths for each EMC device?
Message-ID: <OFF04F4868.CD1C4968-ON85256E5C.006702F1@db.com>
From: "Shan Jing" <shan.jing@db.com>
Date: Fri, 19 Mar 2004 13:50:55 -0500
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm-bounces@redhat.com


I remove the driver,reloaded manaully like this:

insmod qla2300 ql2xfailover=1 ql2xmaxqdepth=64

I still have 44 luns (each disk presents twice on the system).

this is my qla driver
-------------------------------------
QLogic PCI to Fibre Channel Host Adapter for QLA2340:
        Firmware version:  3.02.13, Driver version 6.06.00-fo
Entry address = a000000000793770
HBA: QLA2312 , Serial# L08747
Request Queue = 0x1af3c000, Response Queue = 0x1ac50000
Request Queue count= 128, Response Queue count= 512
Total number of active commands = 0
Total number of interrupts = 257
Total number of IOCBs (used/max) = (0/600)
Total number of queued commands = 0
    Device queue depth = 0x40
Number of free request entries = 121
Number of mailbox timeouts = 0
Number of ISP aborts = 0
Number of loop resyncs = 0
Number of retries for empty slots = 0
Number of reqs in pending_q= 0, retry_q= 0, done_q= 0, scsi_retry_q= 0
Number of reqs in failover_q= 0
Host adapter:loop state= <READY>, flags= 0xc008e0833
Dpc flags = 0x40
MBX flags = 0x0
SRB Free Count = 4096
Link down Timeout = 000
Port down retry = 045
Login retry count = 045
Commands retried with dropped frame(s) = 0


SCSI Device Information:
scsi-qla0-adapter-node=200000e08b100beb;
scsi-qla0-adapter-port=210000e08b100beb;
scsi-qla0-port-0=50060482c4648c2c:50060482c4648c2c;

SCSI LUN Information:
(Id:Lun)  * - indicates lun is not registered with the OS.
( 0: 0): Total reqs 13, Pending reqs 0, flags 0x0, 0:0:81,
( 0: 1): Total reqs 12, Pending reqs 0, flags 0x0, 0:0:81,
( 0: 2): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0: 3): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0: 4): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0: 5): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0: 6): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0: 7): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0: 8): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0: 9): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:10): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:11): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:12): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:13): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:14): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:15): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:16): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:17): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:18): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:19): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:20): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:21): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,
( 0:22): Total reqs 11, Pending reqs 0, flags 0x0, 0:0:81,


Regards,
Shan Jing

Unix Group - Americas
Deutsche Bank
2 Gatehall Drive, 3rd Floor
Parsippany, New Jersey, USA
shan.jing@db.com
973.682.3463




                                                                                                                                       
                      Theo Van Dinter                                                                                                  
                      <felicity@kluge.n        To:       LVM general discussion and development <linux-lvm@redhat.com>                 
                      et>                      cc:                                                                                     
                      Sent by:                 Subject:  Re: [linux-lvm] How to associate two paths for each EMC device?               
                      linux-lvm-bounces                                                                                                
                      @redhat.com                                                                                                      
                                                                                                                                       
                                                                                                                                       
                      03/19/2004 12:44                                                                                                 
                      PM                                                                                                               
                      Please respond to                                                                                                
                      LVM general                                                                                                      
                      discussion and                                                                                                   
                      development                                                                                                      
                                                                                                                                       
                                                                                                                                       




On Fri, Mar 19, 2004 at 12:21:51PM -0500, Shan Jing wrote:
> I have 22  EMC symmetrix disks on two HBA links.  At this moment, there is no working copy of EMC powerpath or HP Securepath available for my kernel (2.4.21-112-itanium2-smp); therefore, I have to use the luns directly with lvm without any DMP software in the middle.
>
> Without DMP software, there are two set of 22 luns, each representing one HBA path.  See blow.

Can you set your HBA driver to do failover?   ie: something like this
in modules.conf:

options qla2300 ql2xfailover=1 ql2xmaxqdepth=64


This works well for my servers connected to a CX-series array. :)   The
driver handles failing between HBAs (active-passive), and only has the
LUN presented once to the system.

--
Randomly Generated Tagline:
"I didn't know Allman was a stand-up comedian ..."
         - Theo about laughter from sendmail tutorial

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

The following file(s) have been deleted by: Shan Jing on 3/19/2004 1:45:07 PM

C.DTF
atthx9wo.dat





--

This e-mail may contain confidential and/or privileged information. If you are not the intended recipient (or have received this e-mail in error) please notify the sender immediately and destroy this e-mail. Any unauthorized copying, disclosure or distribution of the material in this e-mail is strictly forbidden.
