From: "William Blunn" <bill+linuxlvm@tao-group.com>
Message-Id: <003a01c1ad59$54e409d0$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM non-bug: md10 and higher broken
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
Date: Mon Feb  4 02:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Doesn't seem to be a bug in LVM, but it seems that the problem is
tickled when migrating from a multiple-MD-devices system to an LVM
system.

LVM 1.0.1 / kernel 2.2.20

I am using /dev/md0 through /dev/md10 for my existing (non-LVM) system.

I put in additional disks, set them up on /dev/md11, and created a PV on
/dev/md11.

When trying to create the VG, it wouldn't find the PV.

Suspiciously, /proc/partitions shows MD devices listed as

   ...
   /dev/md8
   /dev/md9
   /dev/md:
   /dev/md;

instead of what you would expect

   ...
   /dev/md8
   /dev/md9
   /dev/md10
   /dev/md11

i.e. (sloppily) implemented as translating the MD number into a single
character instead of generating a (potentially multiple character)
string of the decimal representation.

Swapping /dev/md0 with /dev/md11 makes it all work.

So I guess that LVM is accessing /proc/partitions and not seeing any MD
devices 10 or higher.

That would make it a bug in the kernel, but since people are likely to
come across it through LVM I thought it would be a good idea to mention
it here.

Does anyone know if anyone has made/submitted a (2.2) kernel fix for
this?

Another little snag is that the code for handling this is right next to
where the LVM patch gets applied, so making a patch would likely (I
guess) make the LVM patch not apply properly.

Bill
