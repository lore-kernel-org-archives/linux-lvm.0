Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8NFnrot001201
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 11:49:53 -0400
Received: from iohazard.net (iohazard.net [193.64.31.48])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8NFnqsS002852
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 11:49:52 -0400
Message-ID: <45155776.7090608@iki.fi>
Date: Sat, 23 Sep 2006 18:49:10 +0300
From: Aleksandr Koltsoff <czr@iki.fi>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM partition and lvm commands in initrd
References: <dac45060609230102k2d3e6c7fq512f27d265e24b8@mail.gmail.com>	<4514F001.1050300@iki.fi>
	<dac45060609230535m1cdb53efw2e29da84b8e46ca7@mail.gmail.com>
In-Reply-To: <dac45060609230535m1cdb53efw2e29da84b8e46ca7@mail.gmail.com>
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

Mark Ryden wrote:
> Hello ,
>> ...that the mkinitrd/mkinitramfs-script will sniff around your system...
>> to boot a system that
>> doesn't have LVM
> Luca said in an answer to this message: "LVM is much more than a
> partition type,"

Which is of course true. LVM per se doesn't even care about the
partition type as Luca noted. When vgscan runs it will look for LVM on
disk metadata structures on the block devices that are present on the
system (subject to some restrictions). It won't care what the partition
types are as it reads any block devices. So as long as the kernel
identifies the partition (partition table is valid and recognizable) it
will be ok.

> It is clear to me that the mkinitrd is dependant upon what I install.
> But it is not clear to me what in the installation of Fedora Core
> characterizes the
> system as having LVM (or not having LVM).

Reading the relevant mkinitrd/mkinitramfs would probably solve your
question definitively since this is often distribution specific. And
main point here is to understand that initrd/initramfs:es might be
system specific. No one stops you from implementing a generic initrd
that contains everything imaginable, although that would slow system
boot time.

> What is a system that does have an LVM and a system that does NOT
> have LVM ?
> Suppose somebody goes to  an unknown fedora machine and want to know if
> there
> is LVM on that machine. How can he know it? is the existence of LVM
> partition is
> a precondition ? meaning, if he runs "fdisk -l |grep LVM" and doesn't
> get anything than it is not LVM , and if there is an LVM partition
> than it is LVM machine? or is it not enough to to this check and there
> should be some another check ?

There are many ways to detect LVM. Note that using fdisk might not
actually show whether LVM is used or not since LVM might be on sw-raid
and in that case normal distributions set the partition types to sw-raid
autodetect.

Some other ways to see that LVM is used:

dmsetup ls / info (LVM is implemented on "top of" device mapper).
ls -la /dev/mapper/ but this might be misleading as someone might be
using device mapper for non-LVM things as well.

one way is to check /etc/lvm/backup/ directory as it should include the
backups of LVM metadata and other device mapper tools don't use /etc/lvm.

there might be others. I personally use df -T on unknown systems and
then vg/lvdisplay if the filesystem block devices are behind /dev/mapper.

> The thing is that I made 2 installations of Fedora Core 5; in the
> first I chose to format a partition as LVM and in the second I did
> not. Is this is what causes the initrd to have the lvm commands in the
> first case and not to have them in the second place ?
> because I don't remeber that elsewhere in the installation process
> that I did select
> anything
> connected with LVM (there is ofcouse the manual layout in which I
> chode /dev/VolumeGroup... in the first case).

This is a fedora question so maybe someone intimate with that
distribution can answer. I noted that on ubuntu(lts) inclusion of LVM
tools is triggered by existance of /sbin/vgchange and existance of
/lib/lvm-200 so in this case I'd assume that the tools are always
included even if the system isn't using LVM). YMMV.

ak.
