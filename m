Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] badblocks handling with LVM
Date: Wed, 25 Apr 2001 19:59:48 +0200
References: <200104231008.f3NA8Gkx001134@webber.adilger.int>
In-Reply-To: <200104231008.f3NA8Gkx001134@webber.adilger.int>
MIME-Version: 1.0
Message-Id: <01042519594802.31687@lyta>
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Andreas Dilger <adilger@turbolinux.com>

On Monday 23 April 2001 12:08, Andreas Dilger wrote:
> Laurent writes:
> > I have blocks marked bad on a ext2 filesystem.  The device has bad
> > blocks. I'm wondering how bad blocks are handled with lvm.  I would l=
ike
> > to create a phycal volume on this device and use reiserfs on it.
> > Could you give me some informations ?
>
> As long as the bad blocks are not in the first ~250kB of the partition/=
disk
> then LVM doesn't care about it.  However, reiserfs doesn't yet support =
bad
> blocks in the filesystem (this is currently under development AFAIK), s=
o
> this will not help you.

The problem is that when you move LV's around and make snapshots the bad=20
blocks on the underlieing media will move.  Therefore I think that manage=
ment=20
of bad blocks possibly should be done in the LVM.

Or should we just assume that LVM runs over RAID arrays of ATA/SCSI disks=
=20
that have sector-sparing so that bad blocks are not an issue?

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
