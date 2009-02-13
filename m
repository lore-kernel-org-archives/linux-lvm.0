Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1DJgD5q022364
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 14:42:13 -0500
Received: from mail-bw0-f208.google.com (mail-bw0-f208.google.com
	[209.85.218.208])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1DJfvuB018409
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 14:41:58 -0500
Received: by bwz4 with SMTP id 4so2022309bwz.3
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 11:41:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <jwv3aej76uf.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
	<b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
	<68c491a60902120038g6cede40ckaa5ae58600f5ff21@mail.gmail.com>
	<jwv3aej76uf.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Date: Fri, 13 Feb 2009 19:41:57 +0000
Message-ID: <b072968d0902131141q4eadfd72u9faf717517487e44@mail.gmail.com>
Subject: Re: [linux-lvm] Re: About fstab and fsck
From: David Robinson <zxvdr.au@gmail.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Feb 12, 2009 at 8:13 PM, Stefan Monnier
<monnier@iro.umontreal.ca> wrote:
>>> filesystem... so considering its size, I'd turn it off. Hopefully the
>>> "fsck takes _forever_" problem will die when btrfs becomes the
>>> standard filesystem.
>
>> Just a reminder: Linux has xfs since 2002. A full-blown fsck on xfs is
>> a rare thing.
>
> Similarly, I don't know of any case where fsck on an ext3 partition
> turned out to be useful.  As a matter of fact, my home router's ext3
> partition is never fsck'd (it would take way too much time to this poor
> 266MHz thingy to fsck my 1TB filesystem).

I've seen plenty of cases that fsck has made a filesystem consistent
again, but like Bryn says, there's only so much it can do.

from e2fsck(8):

e2fsck is used to check a Linux second extended file system (ext2fs).
E2fsck also supports ext2 filesystems containing a  journal, which are
also sometimes known as ext3 filesystems, by first applying the
journal to the filesystem before continuing with normal e2fsck
processing.  After the journal has been applied, a filesystem will
normally be marked as clean. Hence, for ext3 filesystems,
e2fsck will normally run the journal and exit, unless its superblock
indicates that further checking is required.

So the fsck that is done at boot time only replays the journal if a
filesystem wasn't unmounted cleanly. Its only when after replaying the
journal that if further checking is required a full fsck (the one that
takes forever) is needed. If a full fsck is needed you'll be dropped
to emergency mode (or something) where you need to enter your root
password and run the full fsck (at least that's how it works in RHEL
and Fedora).

--Dave
