Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4UABpFK008379
	for <linux-lvm@redhat.com>; Wed, 30 May 2012 06:11:51 -0400
Received: from kirsi2.inet.fi (mta-out.inet.fi [195.156.147.13])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4UABnak013459
	for <linux-lvm@redhat.com>; Wed, 30 May 2012 06:11:49 -0400
Message-ID: <4FC5F21E.1020501@gmail.com>
Date: Wed, 30 May 2012 13:10:38 +0300
From: Tero <termant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] /dev/vg1/dir-1: read failed after 0 of 4096 at ...
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: ubuntu-users@lists.ubuntu.com, linux-lvm@redhat.com

Hi,

I really messed up my LVM settings. I am using Ubuntu 10.04 server and
my updates were up-to-date. Here is the whole story:

1. I have got four (4) identical 320 GB hard disks: "/dev/sda",
"/dev/sdb", "/dev/sdc" and "/dev/sdd" and one (1) 1 TB "/dev/sde".
2. Each 320 GB disk is paritioned to 1 GB + 319 GB ("/dev/sdX1" and
"/dev/sdX2") and 1 TB disk has only one 1 TB parition.
3. There is RAID-1 (/dev/md0) on the "/dev/sdX1" paritions and RAID-5
(/dev/md1) on the "/dev/sdX2" partions.
4. LVM volume group "vg1" was set at first only on /dev/md1.
5. On vg1 there was only logical volumes: "root", "dir-1" and "dir-2".
6. Later I attached hard disk /dev/sde and attached it to volume group "vg1"
7. I created logical volume drbd with command something like "lvcreate
-L 800G -n drbd vg1 /dev/sde1"
8. I was setting DRBD device on logical volume "drbd". I made some
changes to "filter" parameter in "/etc/lvm/lvm.conf".
9. I noticed that there "PV unknown device" and I accidentally removed
it with command (I am not 100% sure of this) "vgreduce --removemissing
vg1". If I remember correctly used switch "-f" too. :-(
10. Then I found out that system was acting strangely. If I remember
correct it prompted something "Couldn't find device with uuid...". Then
I realized how stupid I had been!
11. Then I followed instructions on
"http://support.citrix.com/article/CTX116095":
    11.1. I booted with installation disk to installation environment
    11.2. I run: "vgdisplay --partial --verbose"
    11.3.Then I run "pvcreate --restorefile /etc/lvm/backup/vg1 --uuid
UUID /dev/sde1 -ff"
    11.4. Then again: "vgdisplay --partial --verbose"
    11.5. At last: "vgcfgrestore --file  /etc/lvm/backup/vg1 vg1"
12. I removed volume group "drbd".
Notice: device /dev/sde was attached all the time.
13. After this running commands:

# pvs
/dev/vg1/dir-1: read failed after 0 of 4096 at 299997528064:
Input/output error
/dev/vg1/dir-1: read failed after 0 of 4096 at 299997585408:
Input/output error
/dev/vg1/dir-1: read failed after 0 of 4096 at 0: Input/output error
/dev/vg1/dir-1: read failed after 0 of 4096 at 4096: Input/output error
/dev/vg1/dir-1: read failed after 0 of 4096 at 0: Input/output error

/dev/vg1/dir-2: read failed after 0 of 4096 at 504658591744:
Input/output error
/dev/vg1/dir-2: read failed after 0 of 4096 at 504658649088:
Input/output error
/dev/vg1/dir-2: read failed after 0 of 4096 at 0: Input/output error
/dev/vg1/dir-2: read failed after 0 of 4096 at 4096: Input/output error
/dev/vg1/dir-2: read failed after 0 of 4096 at 0: Input/output error

/dev/vg1/root: read failed after 0 of 4096 at 14331871232: Input/output
error
/dev/vg1/root: read failed after 0 of 4096 at 14331928576: Input/output
error
/dev/vg1/root: read failed after 0 of 4096 at 0: Input/output error
/dev/vg1/root: read failed after 0 of 4096 at 4096: Input/output error
/dev/vg1/root: read failed after 0 of 4096 at 0: Input/output error

PV    VG    Fmt    Attr    PSize    PFree
/dev/md1        lvm2    --    891.46g    891.46g
/dev/sde1    vg1    lvm2    a-    931.51g    931.51g

# lvs
LV    VG    Attr    LSize
dir-1    vg1    vwi-a-    279.39g
dir-2    vg1    vwi-a-    470.00g
root    vg1    vwi-a-    13.35g   

Is there any change to recover LVM from this point? I don't care if I
loose the newest data but I really want to salvage at least the older data.


Tero
