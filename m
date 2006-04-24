In-Reply-To: <20060422074910.GA15564@percy.comedia.it>
Subject: Re: [linux-lvm] Re: RHAS 3U4 and LVM , alternate path
Message-ID: <OFC5005815.70648774-ONC125715A.0039E2C1-C125715A.003BEE20@schering.de>
From: Christian.Rohrmeier@SCHERING.DE
Date: Mon, 24 Apr 2006 12:54:33 +0200
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Giridharan, Prabhu" <prabhu.g@hp.com>, linux-lvm-bounces@redhat.com


HI,

what those guides don't tell you is what you need to do to your XP in order
for DMP to work. If you use the device mapper driver (although it seems if
using Veritas you'll need this as well) then you'll need to keep a few
things in mind:
- You can't use an XP512, 1024 only.
- System modes 140 and 293 need to be enabled on the XP.

"The E-COPY Response to the Inquiry command is changed, and the volume can
be used from VeritasNetBackUP in heterogeneous OS configuration, such as
Solaris and HP-UX.

Addendum
This mode works in conjuction with System Mode 140. Inquiry page83 for the
XP1024/XP128 has been updated as follows:

If System Mode 140 is ON and System Mode 293 is ON, a descriptor of
Identifier Type = 3 will be added
If System Mode 140 is ON and System Mode 293 is OFF, a descriptor of
Identifier Type = 3,1,2 will be added
If System Mode 140 is OFF and System Mode 293 is ON, there is no change
If System Mode 140 is OFF and System Mode 293 is OFF, there is no change"

ergo the response to a SCSI inquiry on page0x83 will be changed.

- Device mapper atleast only works with RHEL 4 Update 3.
- And keep in mind: mode changes take effect on ALL ports!

As an example:

Device File                 ALPA Tgt Lun Port  CU:LDev Type
Serial#
================================================================================


/dev/sda                     cc  00  01  CL2A  05:ab  OPEN-L*4
0004012x
/dev/sdb                     cd  01  01  CL2A  01:99  OPEN-L*4
0006305x
/dev/sdc                     e8  00  01  CL1A  05:ab  OPEN-L*4
0004012x
/dev/sdd                     ef  01  01  CL1A  01:99  OPEN-L*4
0006305x

I've got 2 Open-Ls on two XP 1024s, and I've got two paths going to each
(sda = sdc, sdb = sdd).

The device mapper sees the following:

[root@bes013 dev]# scsi_id -g -u -s /block/sda
0HP______OPEN-L*4________50060e80039cbe1000010000000000000000cc00
[root@bes013 dev]# scsi_id -g -u -s /block/sdb
0HP______OPEN-L*4________50060e8003f6531000010000000000000000cd00
[root@bes013 dev]# scsi_id -g -u -s /block/sdc
0HP______OPEN-L*4________50060e80039cbe0000010000000000000000e800
[root@bes013 dev]# scsi_id -g -u -s /block/sdd
0HP______OPEN-L*4________50060e8003f6530000010000000000000000ef00

And that is the problem. It can't tell that those four LUNs are actually
only two LUNs. Thats what modes 140 and 293 do: changes the way the SCSI ID
descriptors of the LUNs is given by the XP.

I'd be interested in hearing from anyone else thats working on this.

Cheers,

Christian

_________________
Christian Rohrmeier
Schering AG
Corporate IT - Infrastructure and Services
Computer Systems and Operations
System Administration - Research and Development



                                                                           
             Luca Berra                                                    
             <luca.berra@comed                                             
             ia.it>                                                     To 
             Sent by:                  "Giridharan, Prabhu"                
             linux-lvm-bounces         <prabhu.g@hp.com>                   
             @redhat.com                                                cc 
                                       linux-lvm@redhat.com                
                                                                   Subject 
             22.04.2006 09:49          Re: [linux-lvm] Re: RHAS 3U4 and    
                                       LVM , alternate path                
                                                                           
             Please respond to                                             
                LVM general                                                
              discussion and                                               
                development                                                
             <linux-lvm@redhat                                             
                   .com>                                                   
                                                                           
                                                                           




On Wed, Apr 19, 2006 at 04:14:38PM +0800, Giridharan, Prabhu wrote:
>Hello Team,
>
>I have an HP-Itanium server model rx4640 with RHAS 3 update 4 IA64 with
>two Qlogic FC (A6862A- HP part number)and Qlogic 7.07 driver version
>connected to an XP array , We had tried to use the failover capability
>of Qlogic FC card however it seems not to be working even after enabling
>the failover, So we are thinking of opting to the alternate path concept
>in LVM, So kindly let me know whether alternate path are supported in
>above mentioned RH linux version if so please provide the steps for the
>same.

http://h20000.www2.hp.com/bizsupport/TechSupport/DocumentIndex.jsp?contentType=SupportManual&locale=en_US&docIndexId=179911&taskId=120&prodTypeId=12169&prodSeriesId=421487


L.
--
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
