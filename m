Message-Id: <4.3.1.2.20020308143153.01b708d8@mail.elektro-kapsel.se>
From: "kalle@idlar.nu" <kalle@idlar.nu>
MIME-Version: 1.0
Subject: [linux-lvm] Removing PV with disk errors from VG
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
Date: Fri Mar  8 09:42:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello

I have built a VG from a couple of disks and have now discovered that one 
disk is not working right. Im getting a lot of theese kinds of errors:

end_request: I/O error, dev 03:03 (hdd), sector 2321462
hdd: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
hdd: read_intr: error=0x40 { UncorrectableError }, LBAsect=12571028, 
sector=2321558

So I would like to move the data that still can be accessed from the bad 
disk and remove the disk from the VG.
When I run pvmove /dev/hdd1 I get theese errors:
pvmove -- ERROR "Input/output error" reading sector 130688 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 130689 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 130690 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 130691 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 130692 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 130693 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 130694 from "/dev/hdd1"
pvmove -- ERROR "Input/output error" reading sector 130695 from "/dev/hdd1"
pvmove -- ERROR reading input physical volume "/dev/hdd1" (still 393216 
bytes to read)
pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

I have tried to upgrade to the 1.0.3 tools and doing "pvmove -i /dev/hdd1" 
but I still get the same errors.
Im using lvm-mod version 1.0.1-rc4 with kernel 2.4.17.

Im willing to accept data loss, so is it possible to force the removal of 
the  PV, even if its not empty?

Can I somehow display the files that occupies a PV? so that I know which 
files will be lost.

What if I just remove the /dev/hdd1 partition with fdisk? will that mess up 
the whole VG?

any help appreciateed!


/Regards kalle...
