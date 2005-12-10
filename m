Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBAKF7101557
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:15:07 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBAKF0Ip011944
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 15:15:01 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 70EA724FAB
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2005 13:14:55 -0700 (MST)
Date: Sat, 10 Dec 2005 13:14:54 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] LVM onFly features
Message-ID: <A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
In-Reply-To: <20051210200646.GF3103@mjk.myfqdn.de>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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



--On December 10, 2005 9:06:46 PM +0100 Marc-Jano Knopp 
<pub_ml_lvm@marc-jano.de> wrote:

> On Sat, 10 Dec 2005 at 13:03 (-0700), Michael Loftis wrote:
>> --On December 10, 2005 8:48:27 PM +0100 Marc-Jano Knopp
>> <pub_ml_lvm@marc-jano.de> wrote:
>> > On Sat, 10 Dec 2005 at 14:38 (-0500), Mag Gam wrote:
>> >> any news about hot(no unmount, no fsck, no fs resize) ext2/ext3
>> >> filesystem increase?
>> >
>> > And when will online-*shrinking* of ext3 appear?
>>
>> These are not LVM features.  These are filesystem features.  Better to
>> ask  on lkml, or the maintainers directly.
>
> D'oh! Sorry for that, I was misguided by the previous post!

Not a problem, a lot of people don't see the delineation right off. 
Filesystems like VXVFS (Veritas) in their commercial implementations are 
really LVM+Filesystem in one.  Not sure what the linux port is looking like 
these days though.

ReiserFS has hot expansion capabilities, but no (yet?) hot shrinking 
capabilities.  One of the reasons it has these features and ext2/3 does not 
is because ext2/3 are very old filesystems designed on a different 
mentality of a static filesystem.  On-line expansion of ext2 based 
filesystems is an extremely complicated venture, it might honestly even be 
impossible.

ReiserFS has the advantage here because it doesn't necessarily pre-write 
out a lot of filesystem meta-information (superblocks, inodes, bitmaps, 
etc), instead these structures are entirely dynamic to begin with, so 
enlarging them at runtime is trivial, requires a very short lock and a 
change to a few numbers.  Ext2 resizing requires actually rewriting a lot 
of filesystem metadata.
