Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4HKuWSw023962
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 16:56:33 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4HKuNUa018571
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 16:56:23 -0400
Received: from d03relay01.boulder.ibm.com (d03relay01.boulder.ibm.com
	[9.17.195.226])
	by e36.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id o4HKr8Yp007287
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 14:53:08 -0600
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o4HKu42G048574
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 14:56:05 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id o4HKu1mS018139
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 14:56:01 -0600
Received: from malahal (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av04.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o4HKu0Dq018108
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 14:56:00 -0600
Date: Mon, 17 May 2010 13:56:07 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20100517205607.GA4589@us.ibm.com>
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
>    My system is archlinux i386. lvm version 2.02.62(1) (2010-03-09)
>    I'd like to shrink a partition with lvm on it. Can this be done? In order
>    to shrink it I need to reduce the size of the PV, right? I have
>    successfully removed an LV (from the end on the VG) and there is no
>    mention of it with lvdisplay or in the file i get with vgcfgbackup. I
>    think the next step is to reduce the size of the VG and remove the now
>    unallocated 3884 PEs from it. I can't find a command for that. I have
>    tried pvresize. How do I solve the problem with "metadata areas"?
>    vgdisplay says VG Status is "resizable".

You will need to resize the PV and that would automatically reduce the
VG size. That is why you don't find a command to resize VG.

>    pvresize /dev/sda2 --test --setphysicalvolumesize 49256M
>    Test mode: Metadata will NOT be updated.
>    /dev/sda2: too many metadata areas for pvresize
>    0 physical volume(s) resized / 1 physical volume(s) not resized
> 
>    vgdisplay
>    --- Volume group ---
>    VG Name nonxpvg
>    System ID
>    Format lvm2
>    Metadata Areas 2

Looks like you have 2 copies of metadata (one at the front and another
one at the end of the PV). Resize on this PV is not supported. Here is
what I see from 'man pvresize':

	"pvresize  won't  currently  work  correctly on LVM1 volumes or
	PVs with extra metadata areas."

Unfortunately, there is no easy way to reduce the metadata copies,
resize and add another copy as you have now.

Thanks, Malahal.
