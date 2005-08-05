Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j75AxoV11381
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 06:59:50 -0400
Received: from itspmx1.state.ms.us (e3000a.state.ms.us [205.144.224.140])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j75AxoTR008983
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 06:59:50 -0400
Received: from tcmail.mstc.state.ms.us (tcmail.mstc.state.ms.us [10.3.60.220])
	by itspmx1.state.ms.us (8.12.11/8.12.11) with ESMTP id j75Axk3T017894
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 05:59:46 -0500 (CDT)
	(envelope-from rray@mstc.state.ms.us)
Received: from rray.drdc.mstc.ms.gov (localhost.localdomain [127.0.0.1])
	by rray.drdc.mstc.ms.gov (8.13.1/8.13.1) with ESMTP id j75AvFrF013258
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 05:57:15 -0500
Received: from localhost (rray@localhost)
	by rray.drdc.mstc.ms.gov (8.13.1/8.13.1/Submit) with ESMTP id
	j75AvFrn013255
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 05:57:15 -0500
Date: Fri, 5 Aug 2005 05:57:15 -0500 (CDT)
From: Richard Ray <rray@mstc.state.ms.us>
Subject: Re: [linux-lvm] LVM breaks due to partion types when moving versions.
In-Reply-To: <42F2C76E.6000309@ruckusnetwork.com>
Message-ID: <Pine.LNX.4.62.0508050553090.13186@rray.drdc.mstc.ms.gov>
References: <42F2C76E.6000309@ruckusnetwork.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I had a similar problem going from Fedora 2 to Fedora 4 there's a problem 
with lvm2-2.01.
I never recieved a solution from the list but I found a way around it.
I downgraded to lvm2-2.00.25-1.01.i386.rpm and setup the volume groups 
just fine.
Then I upgraded back to lvm2-2.01.07-3.i586.rpm.


Richard

On Thu, 4 Aug 2005, Lance Reed wrote:

> Hey all,
>
> I am in the process of moving a large NAS head running LVM volumes from a 
> SUSE  PRO
> 9.1 to 9.3  setup.  This is normally easy as I just disconnect the storage 
> arrays from one host
> (Suse 9.1) to new host (9.3), and LVM sees the volumes on boot and does the 
> right stuff.
> Going from LVM lvm2-2.00.09-12 to lvm2-2.01.07-3.i586.rpm
>
> Unfortunately, in this case, previous makers of pv's made them with non 
> standard partition types.
> So, there were functional partitions before with standard linux ID's working 
> as LVM.
>  Device Boot      Start         End      Blocks   Id  System
> /dev/sdh1               1      136102  1093239283+  83  Linux
>
> But they are not working with the new version of lvm.... 
> lvm2-2.01.07-3.i586.rpm
> (notice a lack of sdh1 in pvscan below)
>
>
> so vgroup linking is broken
>
> /tmp/lvm/backup # pvscan
> Couldn't find device with uuid 'bbrTkY-2HDP-2z2D-ehDB-8tnP-jI4b-xl6vHi'.
> Couldn't find device with uuid 'mrR810-I9mY-8hTP-tXak-RN6j-DUlY-zO5B3o'.
> Couldn't find device with uuid 'yaSDig-ATsH-oVtI-1lON-JM26-e7dG-plgUYM'.
> Couldn't find device with uuid 'NyRAN0-X1Wu-pCEI-LPnK-Bs3T-oWHR-tEjyCA'.
> Couldn't find device with uuid 'YLkutw-fjRA-03VU-vAx9-i8Et-HnuB-8iMbFK'.
> Couldn't find device with uuid 'bbrTkY-2HDP-2z2D-ehDB-8tnP-jI4b-xl6vHi'.
> Couldn't find device with uuid 'mrR810-I9mY-8hTP-tXak-RN6j-DUlY-zO5B3o'.
> Couldn't find device with uuid 'yaSDig-ATsH-oVtI-1lON-JM26-e7dG-plgUYM'.
> Couldn't find device with uuid 'NyRAN0-X1Wu-pCEI-LPnK-Bs3T-oWHR-tEjyCA'.
> Couldn't find device with uuid 'YLkutw-fjRA-03VU-vAx9-i8Et-HnuB-8iMbFK'.
> PV /dev/sdf         VG livestore2_copy_vg   lvm2 [1.02 TB / 155.00 GB free]
> PV /dev/sde         VG livestore2_copy_vg   lvm2 [1.02 TB / 5.00 GB free]
> PV /dev/sdd         VG livestore2_copy_vg   lvm2 [1.02 TB / 110.79 GB free]
> PV unknown device   VG devstore2_vg         lvm2 [1.02 TB / 0    free]
> PV unknown device   VG devstore2_vg         lvm2 [1.02 TB / 0    free]
> PV unknown device   VG devstore2_vg         lvm2 [1.02 TB / 0    free]
> PV unknown device   VG devstore2_vg         lvm2 [1.02 TB / 0    free]
> PV unknown device   VG devstore2_vg         lvm2 [1.02 TB / 0    free]
> PV /dev/sdb         VG devstore2_vg         lvm2 [1.02 TB / 0    free]
> PV /dev/sdc         VG devstore2_vg         lvm2 [1.02 TB / 715.17 GB free]
> Total: 10 [10.18 TB] / in use: 10 [10.18 TB] / in no VG: 0 [0   ]
>
> # vgscan
> Reading all physical volumes.  This may take a while...
> Found volume group "livestore2_copy_vg" using metadata type lvm2
> Couldn't find device with uuid 'bbrTkY-2HDP-2z2D-ehDB-8tnP-jI4b-xl6vHi'.
> Couldn't find all physical volumes for volume group devstore2_vg.
> Couldn't find device with uuid 'bbrTkY-2HDP-2z2D-ehDB-8tnP-jI4b-xl6vHi'.
> Couldn't find all physical volumes for volume group devstore2_vg.
> Volume group "devstore2_vg" not found
>
> But I do have backup copies of /etc/lvm.
>
> So I was wondering if I could just use fdisk to set the partitions type to 
> 8e, and LVM2 might work with it?
>
> However, I thought LVM2 does not need 8e anymore, or did they change that?
>
> I figure I can test by using sfdisk to backup the partition table, change it 
> and see what happens.
> Might have to use vgcfgrestore to put the pv metadata back in.
>
> Anybody do this recently or have any ideas.
>
> Thanks in advance!
>
> Lance
>
>
>
> -- 
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
