Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] Boot with LVM on RAID1 on entire disk
Date: Tue, 27 Feb 2001 18:52:21 +0100
References: <200102270207.f1R270O12079@webber.adilger.net>
In-Reply-To: <200102270207.f1R270O12079@webber.adilger.net>
MIME-Version: 1.0
Message-Id: <01022718522100.00763@lyta>
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
Cc: JohnInSD@san.rr.com

On Tuesday 27 February 2001 03:07, Andreas Dilger wrote:
> One thing that probably _doesn't_ work is /boot on LVM on MD, just beca=
use
> I haven't had a need to do so.  Unless you have unusual requirements,
> you can leave /boot as a partition if you like, or you can fix LILO
> based on the patch I sent.

I suggest the following:
/dev/hda1 - 20M /boot
/dev/hda2 - rest of the disk

Same partitioning for /dev/hdc .

Then make /dev/hda2 and /dev/hdc2 a software RAID mirror which has LVM on=
 top=20
(thus leaving the MBR nice and free).

Install the Debian MBR (I'm sure it's available under other names for oth=
er=20
distributions) on both /dev/hda and /dev/hdc.  It'll load a LILO boot blo=
ck=20
from an active partition on the same drive by default.
Make /dev/hda1 and /dev/hdc1 active using fdisk or the LILO "activate"=20
program.
Then after running "lilo" do "cat /dev/hda1 > /dev/hdc1".  At this stage =
if=20
/dev/hda fails then swapping /dev/hdc to /dev/hda should result in a boot=
able=20
system!

I have CC'd John Coffman (current Lilo developer) on this email as I thin=
k=20
it'll interest him.  Please remove his name from the CC list if you are g=
oing=20
to make a non-LILO posting.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
