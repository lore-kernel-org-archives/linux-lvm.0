Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] mirroring boot and root
Date: Sun, 3 Jun 2001 14:31:22 +0200
References: <E156DD7-00078c-00@kirk.banal.collective>
In-Reply-To: <E156DD7-00078c-00@kirk.banal.collective>
MIME-Version: 1.0
Message-Id: <01060314312209.06022@lyta>
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
To: linux-lvm@sistina.com, evan.day@home.com

On Saturday 02 June 2001 17:21, evan.day@home.com wrote:
> LILO 21.7 contains support for placing a boot sector on RAID devices.  =
I
> used install-mbr to put a boot MBR on sda and sdb, then lilo to put a
> LILO boot sector on /dev/md0, which is sda1 and sdb1.  The rest of my
> system is built on PV /dev/md1, which is sda4 and sdb4.

I tried the booting from RAID-1 thing on one of my IDE systems.  It seems=
=20
impossible with the current LILO because it writes different boot data to=
=20
each drive, so if the first drive is removed the other drive becomes BIOS=
=20
device 0x80 and won't boot because LILO expects 0x81.

The next version of LILO may address this...

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
