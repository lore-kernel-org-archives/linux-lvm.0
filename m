Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0V3ctO06539
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 22:38:55 -0500
Received: from mail.clunker.utsl.gen.nz (210-54-92-184.ipnets.xtra.co.nz
	[210.54.92.184])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0V3cs5F029028
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 22:38:54 -0500
Message-ID: <41FDA84A.7090405@vilain.net>
Date: Mon, 31 Jan 2005 16:38:50 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Reducing/Resizing LVM where "/" filesystem is	included
	in the LVM
References: <1106517355.26963.213384700@webmail.messagingengine.com>
	<20050124002632.GA23702@pob>
	<1106605480.13480.213476562@webmail.messagingengine.com>
	<41F6A729.9050709@vilain.net>
	<1107131925.6822.213924115@webmail.messagingengine.com>
In-Reply-To: <1107131925.6822.213924115@webmail.messagingengine.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: fromkth+lvm@fastmail.fm
Cc: LVM general discussion and development <linux-lvm@redhat.com>

fromkth+lvm@fastmail.fm wrote:
> But now the problem is how to claim those 42 PEs from this Volume Group
> as i want to use that free space of this Volume Group to make
> hda7(fat32)
> which i can use(read/write)both in linux as well as in windows.

You can't just shrink a PV like that AFAIK.

What you are asking is pretty much voodoo.  Remember the solution that
works every time is to back everything up to a tape or another
harddrive, then setup the disk the way you want it and copy everything
back.  Trying to attempt voodoo as a self-admitted newbie is a sure-fire
way to end up with complete loss of data on a system.

The LVM was designed to avoid these problems; however it is not designed
to play well with other operating systems on the same box.  So, you are
stuck with native partitioning and all the problems that go along with
it.

It is possible to do a lot of things by making more physical volumes,
and using "pvmove" to move the logical volumes between disks.  Once
`pvdisplay -v' on a volume shows no data there you can safely
repartition the space (and probably reboot each time), but from
the sounds of it, you should not experiment with this approach.  It
is very easy to make a mistake and lose everything.
-- 
Sam Vilain, sam /\T vilain |><>T net, PGP key ID: 0x05B52F13
(include my PGP key ID in personal replies to avoid spam filtering)
