Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i428bvv18084
	for <linux-lvm@redhat.com>; Sun, 2 May 2004 04:37:57 -0400
Received: from vega.voltaire.com ([212.143.27.73])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i428bt99032669
	for <linux-lvm@redhat.com>; Sun, 2 May 2004 04:37:56 -0400
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C71977D@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
Subject: RE: [linux-lvm] qla2x00 and MPIO options
Date: Sun, 2 May 2004 11:22:28 +0300 
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>
Cc: 'QLogic Info Center' <qlogicinfoctr@qlogic.com>

Don, this is very interesting and I think you did a great job investigating
qlogic.

I'm sorry I cannot help, I'm looking at this from a different angle - I'd
like to use the driver's IOCTLs to be able to manage the failover staff. 
I plan to enable all of the qlogic driver traces and debug messages, then
use their java tool (SANSurfer) to create a MPIO for a device, and then
reverse engineer from the traces wha's going on.

I wish Qlogic would listen. We actually OEM their staff and get absolutely
no support.

Dan

> -----Original Message-----
> From: Don Buchholz [mailto:buchholz@easystreet.com]
> Sent: Friday, April 30, 2004 8:39 PM
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] qla2x00 and MPIO options
> 
> 
> 
> While browsing this months archive (prior to posting my question
> on SCSI device renumbering), I noticed a question regarding QLogics
> HBAs and MPIO configuration. 
> 
> My experience has been with QLA2200 adapters from IBM (IBM FAStT
> HBA).  The java tool they ship to aid in configuring these adapters
> is known as FAStT MSJ (Managment Suite Java).  One of my biggest
> gripes in this project is the dearth of good documentation.  (I
> am really beginning to think SAN vendors are being obtuse just so
> they can sell consulting/implementation services.)
> 
> However, I did find a bit of a gem which may give us some clues
> on how to manually configure the qla2x00 drivers.  There is an
> Appendix in an IBM RedBoot entitled "Linux with xSeries and FAStT:
> Essentials" SG24-7026-00.  Appendix B, Figure 5-23.  Also, adding
> to the knowledge base are a few notes from the IBM FAStT HBA
> Linux device driver (v6.06.60) README file.  All these tidbits
> pertain to options passed to the qla2x00 drivers.
> 
> Here are the ones I've discovered:
> 
>   ConfigRequired   -- unclear, all stuff I've seen seem to pass
>                       "ConfigRequired=1" to the driver.
> 
>   ql2xmaxqdepth    -- max. queue depth to report for target devices
> 
>   ql2xretrycount   -- Max. number of mid-layer retries allowed for
>                       a command.  The default value for failover
>                       mode is 30, for non-failover mode is 20.
>                       (When using IBM FAStT Storage Servers this
>                       must be set to 60.)
> 
>       "failover mode" ==> MPIO support is enabled in the driver.
> 
>   ql2xsuspendcount -- Number of 6-sec. suspend iterations to perform
>                       while a target returns "NOT READY" status.  The
>                       default is 10 (which is equal to 60s.).  (This
>                       value must be set to 40 for IBM FAStT Storage
>                       Servers.)
> 
>   displayConfig    -- If set to "1", then the loaded configuration
>                       will be displayed. (Look in syslog, e.g.
>                       /var/log/messages.)
> 
>   max_srbs         -- Max. number of simultaneous commands allowed
>                       for an HBA.  The default is set to 4096 in
>                       the driver source code.
> 
>   ql2xopts         -- When doing MPIO stuff, this will contain an
>                       obnoxiously long string with info about port
>                       and node WWN's, preferred paths, etc.  See
>                       below for more on this.
> 
> A simple set of configuration options that I've currently placed in
> my /etc/modules.conf is:
> 
>    options qla2200 displayConfig=1 ql2xretrycount=60 
> ql2xsuspendcount=40
> 
> A more complex example might be (from the afore-mentioned RedBook).
> 
>    options qla2200 displayConfig=1 ConfigRequired=1
>       qla2xopts=scsi-qla0-adapter-port=210000e08b059fa1\;scsi-qla0-
>       tgt-0-di-0-node=200200a0b80cbf7e\;scsi-qla0-tgt-0-di-0-port=2
>       00200a0b80cbf7f\;scsi-qla0-tgt-0-di-0-pid=0000ef\;scsi-qla0-t
>       gt-0-di-0-preferred=fffffffffffffffffffffffffffffffffffffffff
>       ffffffffffffffffffffff5\;scsi-qla0-tgt-0-di-0-control=00\;scs
>       i-qla1-adapter-port=210000e08b057ea2\;scsi-qla1-tgt-0-di-1-no
>       de=200200a0b80cbf7e\;scsi-qla1-tgt-0-di-1-port=200300a0b80cbf
>       7f\;scsi-qla1-tgt-0-di-1-pid=0000e4\;scsi-qla1-tgt-0-di-1-pre
>       ferred=000000000000000000000000000000000000000000000000000000
>       000000000a\;scsi-qla1-tgt-0-di-1-control=80\;
> 
> 
> TTBOMK:
>   * this must all be on one line
>   * there are no whitespace characters after the "=" sign in 
> qla2xopts=...
>   * all semi-colons are escaped with a backslash
>   * those long strings of hex digits are exactly 64 hex digits, and
>     describe a 256-bit mask
>   * all of the above is for a single "disk" with two available paths
>     (more evidence for this assumption in Fig 5-37 in the Redbook)
>  
> 
> Now, trying to infer what it all means.  I would really appreciate
> any feedback that you all might have.
> 
> 1) There are two HBA adapters:  "qla0" and "qla1".
> 
> 
> 2) The adapter port ID's can be overridden
> 
>     HBA #1: scsi-qla0-adapter-port = 210000e08b059fa1
>     HBA #2: scsi-qla1-adapter-port = 210000e08b057ea2
> 
>    From the device driver readme file (para-phrased):
> 
>    | scsi-qla<#>-adapter-port=<adapter_port_name_value>
>    |
>    |  -- specifies the FC port name to be used for the adapter.
>    |  Where <adapter_port_name_value> is the FC port name value in
>    |  hex.  The default value is port name found in the adapter's
>    |  NVRAM.
> 
> 
> 3) Each SCSI ID can be associated with a specific WWN.  Hence,
>    if we assume HBA #1 is the 2nd SCSI controller (scsi1) in
>    the server, and HBA #2 is the 3rd (scsi2), then I think the
>    following phrases are interpreted as:
>   
>     scsi-qla0-tgt-0-di-0-node=200200a0b80cbf7e
>     scsi-qla1-tgt-0-di-1-node=200200a0b80cbf7e
> 
>    The two paths scsi(1,0,0,0) and scsi(2,0,0,1) are both associated
>    with the same SAN "disk", identified by WWN 200200a0b80cbf7e.
> 
>    From the dev. driver README (para-phrased):
> 
>    | scsi-qla<Q>-tgt-<N>-di-<I>-node=<device_FC_name>
>    |
>    |  -- associates specified FC device with SCSI target ID "<N>" and
>    |  device id "<I>" on qla2x00 instance number "<Q>"
> 
>    (Note - I'm assuming that "I" is a SCSI LUN here.)
> 
> 
> 4) ... and the SCSI ID can be associated with a port (i.e. path)
>    for getting to the specific device (node) specfied in the last
>    paragraph.
> 
>     scsi-qla0-tgt-0-di-0-port=200200a0b80cbf7f
>     scsi-qla1-tgt-0-di-1-port=200300a0b80cbf7f
>   
>    From the dev. driver README (para-phrased):
> 
>    | scsi-qla<Q>-tgt-<N>-di-<I>-port=<port_FC_name>
>    |
>    |  -- associates specified FC port with SCSI target ID "<N>" and
>    |  device id "<I>" on qla2x00 instance number "<Q>"
> 
> 
> 5)  ... any guesses?
> 
>     scsi-qla0-tgt-0-di-0-pid=0000ef
>     scsi-qla1-tgt-0-di-1-pid=0000e4
> 
> 
> 6) This looks like where the preferred path is specified:
> 
>      scsi-qla0-tgt-0-di-0-preferred=ffff....fff5
>      scsi-qla1-tgt-0-di-1-preferred=0000....000a
> 
>    I'm not sure how to interpret the bits.  I can that the
>    numbers are complementary.  I haven't found any more clues
>    though (I guess the next level would be the driver source).
> 
> 
> 7)  ... any guesses?
> 
>      scsi-qla0-tgt-0-di-0-control=00
>      scsi-qla1-tgt-0-di-1-control=80
> 
> 
> 8)  And, finally, one last documented parameter from the driver
>     source README file:
> 
>    | scsi-qla<Q>-tgt-<N>-di-<I>-diabled=<256_bit_mask>
>    |
>    |  -- associates specified mask with SCSI target ID "<N>" and
>    |  device id "<I>" on qla2x00 instance number "<Q>".
>    |
>    | The 256-bit mask must be exactly 64 hex digits.
>    |
>    | Using the mask [MSB] 00000000....0000000f [LSB] will cause
>    | the first four LUNs [3, 2, 1, and 0] of a given target to be
>    | disabled on that target/path.
>    |
> 
>    I have found no examples which used the last one.
> 
> 
> Anyway, that's a digest of things I've dug up this last week. 
>  If anyone 
> else
> can help shed light on this, I'd surely appreciate it.
> 
> - Don
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

QLogic Technical Support has received your request. You should receive a
response within 1 business day.

Regards
QLogic Technical Support

Detailed Description : How do I tell the qlogic driver to re-scan the FC and
update the list of devices it finds?
   
   Also, is there any documentation regarding the setup and use of failover
- without the use of the SANsurfer toolkit? i.e. how can I set failover
programatically?
   
   Thanks,
   Dan
536870951            : ER0000000036213
> 
