Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Date: Mon, 11 Jun 2001 13:39:00 +0200
References: <20010605210727.C1870@pc.ilinx> <20010611120459.A26558@mail.wave.co.nz> <3B240ED6.F8951EE8@tls.msk.ru>
In-Reply-To: <3B240ED6.F8951EE8@tls.msk.ru>
MIME-Version: 1.0
Message-Id: <01061113390005.14094@lyta>
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
To: linux-lvm@sistina.com, Michael Tokarev <mjt@tls.msk.ru>

On Monday 11 June 2001 02:20, Michael Tokarev wrote:
> About tmpfs and a "real" filesystems.  No, ufs isn't so slow on
> solaris, it is comparable with ext2, and faster sometimes (and slow
> other times), it is hard to say which is better (I prefer ufs on

Last time I attempted to do a fair comparison I compared an Ultra=20
Enterprise 2 with two UltraSPARC CPUs of ~200MHz speed, 256M of RAM, and=20
a 9G SCSI hard drive with a Thinkpad 380XD with a 233MHz PentiumMMX, 96M=20
of RAM and a 3.2G Toshiba IDE drive.

Ext2 on the Thinkpad beat UFS on the Sun in most tests.  ReiserFS on the=20
Thinkpad beat tmpfs on the Sun for creating large numbers of files (tmpfs=
=20
does not index directories).

This is off-topic.  Maybe we should migrate to the ReiserFS list where=20
comparing FS performance is a topical matter?

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
