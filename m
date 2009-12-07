Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB7NBsif008736
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 18:11:54 -0500
Received: from e3.ny.us.ibm.com (e3.ny.us.ibm.com [32.97.182.143])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB7NBcjQ007861
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 18:11:39 -0500
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by e3.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id nB7N2aow030836
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 18:02:37 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	nB7NBc1D1597546
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 18:11:38 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	nB7NBct3010552
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 21:11:38 -0200
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	nB7NBb3p010511
	for <linux-lvm@redhat.com>; Mon, 7 Dec 2009 21:11:37 -0200
Date: Mon, 7 Dec 2009 15:11:37 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Re: Re: Problems with dissapearing PV when
	mounting (Stuart D. Gathman)
Message-ID: <20091207231136.GA31793@us.ibm.com>
References: <691e2b620912071047jaf3e752m3a49fadbf6a3ae5f@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <691e2b620912071047jaf3e752m3a49fadbf6a3ae5f@mail.gmail.com>
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
To: linux-lvm@redhat.com

Johan Gardell [gardin@gmail.com] wrote:
> Ok, added a filter to remove /dev/fd0. But i still get
> [22723.980390] device-mapper: table: 254:1: linear: dm-linear: Device
> lookup failed
> [22723.980395] device-mapper: ioctl: error adding target to table
> [22724.001153] device-mapper: table: 254:2: linear: dm-linear: Device
> lookup failed
> [22724.001158] device-mapper: ioctl: error adding target to table

There are lots of reasons why the above message shows up. Most likely
someone else using them...

> mount doesn't give any messages in dmesg
> 
> lvs shows:
>   LV          VG        Attr   LSize   Origin Snap%  Move Log Copy%  Convert
>   dreamhacklv Dreamhack -wi-ao   1,23t
>   root        gardin    -wi-d- 928,00g
>   swap_1      gardin    -wi-d-   2,59g
> 
> if i try to mount with:
>   mount -t reiserfs /dev/mapper/gardin-root /mnt/tmp
> 
> i get this in dmesg:
>   [23113.711247] REISERFS warning (device dm-1): sh-2006
> read_super_block: bread failed (dev dm-1, block 2, size 4096)
>   [23113.711257] REISERFS warning (device dm-1): sh-2006
> read_super_block: bread failed (dev dm-1, block 16, size 4096)
>   [23113.711261] REISERFS warning (device dm-1): sh-2021
> reiserfs_fill_super: can not find reiserfs on dm-1

Looks like you have some kind of LV here. What is the output of the
following two commands:

1. "dmsetup table"
1. "dmsetup ls"

Thanks, Malahal.
