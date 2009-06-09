Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n59APT5K016173
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 06:25:29 -0400
Received: from csmtp3.one.com (csmtp3.one.com [195.47.247.213])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n59APEjO019776
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 06:25:14 -0400
Received: from [10.61.95.174] (64-103-25-233.cisco.com [64.103.25.233])
	by csmtp3.one.com (Postfix) with ESMTP id 934E6240EA08
	for <linux-lvm@redhat.com>; Tue,  9 Jun 2009 10:25:13 +0000 (UTC)
Message-ID: <4A2E3886.2000604@nektulos.de>
Date: Tue, 09 Jun 2009 12:25:10 +0200
From: Stefan Radovanovici <stefan@nektulos.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvremove won't work
References: <4A2E0396.4030006@nektulos.de>	
	<20090609065405.GB10101@maude.comedia.it>
	<4A2E096F.1010203@nektulos.de>
	<1244540783.18101.184.camel@breeves.fab.redhat.com>
In-Reply-To: <1244540783.18101.184.camel@breeves.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: stefan@nektulos.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On 6/9/2009 11:46 AM, Bryn M. Reeves wrote:

> Use dmsetup:
> 
> $ dmsetup info --maj 252 --min 1
> 
> (the output above shows dm is using 252 as its major number for this
> device on your system).
> 
> At a guess it looks like you somehow removed the PV from the VG while a
> logical volume was mapped on it.

First of all, thanks for the info. I am not a LVM expert and this is useful information. dmsetup shows this:

root@neriak:/sys/block/sda/sda4/holders/dm-1# dmsetup info --maj 252 --min 1
Name:              storage-pvmove0
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        0
Event number:      1
Major, minor:      252, 1
Number of targets: 1
UUID: LVM-SS2wO5K12BwSo1iceXVSiTaYPQzdgEuUoOPgGYKKRLO109x4837eAHZeiSmzzEqW

I think I somehow messed up while trying to get rid of /dev/sda4. I used a GUI for this not the CLI, first I tried to move the extents to other PVs (which I think is that pvmove does) and then to actually remove it from the group (which is probably what vgreduce does). If I am not mistaken, the first operation gave an error even though it appeared to have worked somehow at the time.

Any way I can fix this ?

Thanks,
Stefan
