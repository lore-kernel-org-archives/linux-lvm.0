From: Goetz Bock <bock@blacknet.de>
Message-ID: <20020901022635.E6906@zealot.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] adding a bootsector to a PV destroys it ?!?
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
Date: Sat Aug 31 19:30:31 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi list,

while I have tried to search the archive, I was obviousely to dump to
find what I was looking for.

I just did (on 2.4.19 with LVM 1.0.5)

pvcreate /dev/hda4
vgcreate vg00 /dev/hda4
lvcreated ...
copy ... install ...
.
.
.
vgcfgbackup
dd if=/dev/hda of=/dev/hda4 bs=512 count=1 (*)

[ reboot ]

argl /dev/hda4 is no longer a valid PV.

doing

pvcreate /dev/hda4
vgcfgrestore -f /etc/lvmconf/vg00.conf /dev/hda4

recovered all my LVs, so I'm back in the game.

Still, just to make sure:
overwriting the first 512byte of a PV destroy it?

Thanks, and keep up the good work :-)


(*) to backup LILOs boot sector, I wanted to install (shiver) W2k
    and moving lilo from MBR would allow me to recover easily. 
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
