Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j14FhaO03438
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2005 10:43:36 -0500
Received: from liszt-02.ednet.co.uk (postfix@liszt-02.ednet.co.uk
	[212.20.226.19])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j14FhZRp031322
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2005 10:43:36 -0500
Received: from liszt-02.ednet.co.uk (mail.ednet.co.uk [212.20.226.52])
	by liszt-02.ednet.co.uk (Postfix) with ESMTP id E72B195A38
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2005 15:43:34 +0000 (GMT)
Received: from sullivan.ednet.co.uk (sullivan.lumison.net [212.20.231.233])
	by liszt-02.ednet.co.uk (postfixfilterd/14247) id CCVSDBAAIH
	for <linux-lvm@redhat.com>; Fri, 04 Feb 2005 15:43:34 +0000 (GMT)
Received: from [217.30.126.90] (nbg-dhcp-90.lumison.net [217.30.126.90])
	by sullivan.ednet.co.uk (Postfix) with ESMTP id 3E11F164F00
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2005 15:43:34 +0000 (GMT)
Message-ID: <42039825.2040408@lumison.net>
Date: Fri, 04 Feb 2005 15:43:33 +0000
From: David Grierson <david.grierson@lumison.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM partition growth after Dell MegaRAID RAID array
	growth
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I'm in the process of installing (so fortunately can reformat, rinse, 
repeat as necessary) a new Dell PowerVault attached to a PowerEdge 
running RHEL3.

I'm looking to have the facility to be able to grow the RAID arrays at a 
later date. The Dell PERC 4/DC card installed supports growing the RAID 
array, however since I created the physical volume to utilise the whole 
disk it hasn't seen the growth in the PV:

> [root@nbg01-filer-01 root]# pvdisplay /dev/sdb
> --- Physical volume ---
> PV Name               /dev/sdb
> VG Name               splitbus0
> PV Size               546.48 GB [1146060800 secs] / NOT usable 32.25 MB [LVM: 196 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       32768
> Total PE              17486
> Free PE               0
> Allocated PE          17486
> PV UUID               duXmrI-c1d0-pPew-VNL4-ce6N-5h14-6swMqK

However lvmdiskscan recognises that the disk has grown in capacity:

> [root@nbg01-filer-01 root]# lvmdiskscan
> lvmdiskscan -- reading all disks / partitions (this may take a while...)
> ...
> lvmdiskscan -- /dev/sdb   [     683.11 GB] USED LVM whole disk
 > ...

Looking at the lists I realise that extending the physical volumes isn't 
supported yet.

So, to ask my question (about time too I hear you say), what advice 
would you give me in order to achieve expandability of the RAID array at 
a later date when we have filled existing capacity?

Should I partition /dev/sdb before I create the physical volume and then 
partition any new space which is added and then add those partitions to 
the volume group? Or is there some more clever way to do it?

Cheers,

Dg.
-- 
David Grierson
Lumison
t: 0845 1199 900
d: +44 131 514 4053
-- 

This email and any files transmitted with it are confidential and intended 
solely for the use of the individual or entity to whom they are addressed.  
If you have received this email in error please notify the sender. Any 
offers or quotation of service are subject to formal specification.  
Errors and omissions excepted.  Please note that any views or opinions 
presented in this email are solely those of the author and do not 
necessarily represent those of Lumison, nplusone or lightershade ltd.  
Finally, the recipient should check this email and any attachments for the 
presence of viruses.  Lumison, nplusone and lightershade ltd accepts no 
liability for any damage caused by any virus transmitted by this email.

-- 
-- 
Virus scanned by Lumison.
