Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4HLF2X4023362
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 17:15:02 -0400
Received: from e9.ny.us.ibm.com (e9.ny.us.ibm.com [32.97.182.139])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4HLEqqe023766
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 17:14:53 -0400
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by e9.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id o4HL1PG4006693
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 17:01:25 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o4HLEqII114012
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 17:14:52 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	o4HLEqMO008648
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 18:14:52 -0300
Received: from malahal (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av02.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o4HLEpSp008623
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 18:14:51 -0300
Date: Mon, 17 May 2010 14:14:59 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20100517211459.GA7269@us.ibm.com>
References: <AANLkTina1csDn1EAcwXOYM41r7G3TOZBSAo1lVk0tU5N@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTina1csDn1EAcwXOYM41r7G3TOZBSAo1lVk0tU5N@mail.gmail.com>
Subject: Re: [linux-lvm] shrink VG and PV
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Dael Elcar [kanonmatswe@gmail.com] wrote:
>    pvresize /dev/sda2 --test --setphysicalvolumesize 49256M
>    Test mode: Metadata will NOT be updated.
>    /dev/sda2: too many metadata areas for pvresize
>    0 physical volume(s) resized / 1 physical volume(s) not resized

I have now looked at how to reduce the number of metadata copies. Here
is what Alasdair said:

	Q: /dev/md1: too many metadata areas for pvresize

	That's meant to be saying you chose to place a second copy of
	the metadata at the end of the device and if you want to
	increase the size of the data area you have to shift that
	metadata first and there is no code that does that.

	Workaround is to reduce to 1 metadata area first (backup VG,
	redo pvcreate with uuid & restorefile, restore VG), then extend,
	then put the 2nd metadata area back (same process) if you still
	want it.

Hope that helps!
--Malahal.
