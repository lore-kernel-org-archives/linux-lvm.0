Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p360goTO007554
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:42:50 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p360gkC2013345
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 20:42:46 -0400
Received: from anubis.ankh.org ([172.22.128.3])
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Q7GpZ-0006Zy-TR
	for linux-lvm@redhat.com; Wed, 06 Apr 2011 01:42:45 +0100
Message-ID: <4D9BB703.3030101@ankh.org>
Date: Wed, 06 Apr 2011 00:42:43 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c!	o.uk>	<4D9BA196.20006@ankh.org>	<4D9BA39A.8020008@abpni.co.uk>	<4D9BA845.10607@an!	kh.org>
	<4D9BAD26.5010405@abpni.co.uk> <4D9BB0D4.8050401@ankh.org>
	<4D9BB398.5070007@abpni.co.uk>
In-Reply-To: <4D9BB398.5070007@abpni.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 06/04/2011 00:28, Jonathan Tripathy wrote:
> Ok, i think I get it now. At the minute, my vg (vg0) only has on PV in 
> it (/dev/md3 which you can tell is a mdadm RAID device). I wasn't 
> aware you could add more PVs (that's pretty cool!). So, let's say I 
> had a spare partition (/dev/hdb7 as an example). To my vg0 volume 
> group, I would firstly:
>
> pvcreate /dev/hdb7
> vgextend /dev/hdb7

Right however danger warnings are going off in my mind now!

> Then, every time I create a new customer LV, I would do:
>
> lvcreate -nNewCustomerLV -L20G vg0 /dev/md3

yes that would work

>
> Then, every time I wanted to create a snapshot:
>
> lvcreate -L20G -s -n data_snap /dev/vg0/NewCustomerLV /dev/hdb7
>

Yes

> Is that correct? No Leakage? And no zeroing needed?
Indeed

>
> Side note: Since I didn't partition my servers with this in mind, my 
> new PV will probably have to be an iSCSI device located on a remote 
> target :( Either that or use a loopback device with an image, but I'd 
> be scared that the system would not boot properly. Can you give me any 
> tips on how to use an image file as a PV just for snapshots?

Ok, there has been alot of dangerous talk here, i assume you are using 
an md device so you can mirror things. If you added a single disk to 
that, and that disk failed you would have a major problem. Likewise if 
you rebooted with open snaps and iscsi you would need that iscsi device 
available during computer boot. I REALLY hope you do not have your local 
FS on the same vg as your data. As this would result in a non booting 
machine.

BTW new use pvmove on /var as it stores data there and will freeze the 
whole system.

All hope is not lost, if you can add disk temperately you can use :-
1) add a new pv to the exisiting disk (vgextend)
2) move the data lvs to the new pv (pvmove)
3) remove the old disk (vgreduce)
   a) check with pvscan that the old disk really is not in use
4) resize the partiton (fdisk)
5) create a new pv (pvcreate --force) you need that to overwrite... take 
care now.
6) add the old disk back in (vgextend)
7) move the data lvs back to the old disk (pvmove)
8) remove the temp disk (vgreduce)

Now that is worth cake!

James
