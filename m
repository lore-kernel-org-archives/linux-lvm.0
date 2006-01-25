Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0P4a0129153
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 23:36:00 -0500
Received: from rwcrmhc12.comcast.net (rwcrmhc13.comcast.net [216.148.227.153]
	(may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0P4Zx9H020748
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 23:35:59 -0500
Received: from goldfinger.local (goldfinger.local [10.0.0.20])
	by doctorno.local (8.13.3/8.13.3) with ESMTP id k0P4ZqZh016548
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 20:35:52 -0800 (PST)
	(envelope-from dgs@doctorno.local)
Received: from goldfinger.local (localhost [127.0.0.1])
	by goldfinger.local (8.12.11/8.12.11) with ESMTP id k0P4afFF016709
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 20:36:41 -0800 (PST)
Received: (from dgs@localhost)
	by goldfinger.local (8.12.11/8.12.11) id k0P4afSj020531
	for linux-lvm@redhat.com; Tue, 24 Jan 2006 20:36:41 -0800 (PST)
Date: Tue, 24 Jan 2006 20:36:40 -0800
From: DGS <dgs@gs.washington.edu>
Subject: Re: [linux-lvm] 8TB logical volumes with LVM2
Message-ID: <20060125043640.GA10792@goldfinger.local>
References: <9ab217670601241950m711f3e0dn@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ab217670601241950m711f3e0dn@mail.gmail.com>
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

On Tue, Jan 24, 2006 at 07:50:04PM -0800, Devon H. O'Dell wrote:
> Hello folks,
> 
> I'm trying to configure a system with 2 12 port 3ware 9550SX SATA RAID
> cards to join the two physical volumes exported by the cards into a
> single logical volume. There are 24x400GB drives, so the total is just
> above 8TB.

I did pretty much the same thing on a Caos Linux system with two
twelve-port 3ware 9000 SATA raid and twenty-four 250 GB disks,
creating one big 6.6T file system.  No problems to report from
here.  You did make GPT labels on the two SCSI devices, didn't
you?

David S.

> 
> After running the following commands:
> 
> pvcreate --metadatasize 1024 /dev/sdb1
> pvcreate --metadatasize 1024 /dev/sdc1
> vgcreate -s 128M vg0 /dev/sdb1 /dev/sdc1
> lvcreate -n lv0 -L8T vg0
> 
> The lvcreate command gobbles up CPU and memory as would be expected,
> however, I get the following error message:
> 
> device-mapper device too small for target: /dev/sdb1
> device mapper ioctl cmd 9 failed: Invalid argument.
> could not load device vg0-lv0
> failed to activate new LV
> 
> Am I doing something incorrectly? I've tried with both Fedora Core 3
> and Fedora Core 4. Any pointers on how I should continue with this
> would be greatly appreciated.
> 
> Kind regards,
> 
> Devon H. O'Dell
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
