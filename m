From: Christoph Resch <mailing-oit@tttech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200312111402.11063.mailing-oit@tttech.com>
Subject: [linux-lvm] funny PV action
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
Date: Thu Dec 11 07:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

may someone kindly assist me in thei quite funny behavior of LVM

i work on a runnging LVM system .. everything works as it should BUT:

when running pvscan i get 

root@prime:~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md1" of VG "system"   [19.97 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/md2" of VG "dataraid" [13.88 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/md3" of VG "dataraid" [68.36 GB / 0 free]
pvscan -- total: 3 [102.24 GB] / in use: 3 [102.24 GB] / in no VG: 0 [0]

# well /dev/md1 is my system ( / , /usr, /var ,... ) it works quite fine :-o

root@prime:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "system"
vgscan -- found active volume group "dataraid"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
groups

# well thats great ;-) 


root@tttprime:~# lvscan
lvscan -- ACTIVE            "/dev/dataraid/ttchip" [9 GB]
lvscan -- ACTIVE            "/dev/dataraid/private" [20 GB]
lvscan -- ACTIVE            "/dev/dataraid/tttech" [20 GB]
lvscan -- ACTIVE            "/dev/dataraid/projects" [17 GB]
lvscan -- ACTIVE            "/dev/dataraid/sandbox" [9 GB]
lvscan -- ACTIVE            "/dev/dataraid/marketing+pr" [7.23 GB]
Segmentation fault

# oops i miss al my systemLVs .. still running on it ;-( 

root@tttprime:~# cat /proc/mounts
rootfs / rootfs rw 0 0
/dev/root.old /initrd ext2 rw 0 0
/dev/root / ext3 rw 0 0
proc /proc proc rw 0 0
devpts /dev/pts devpts rw 0 0
/dev/md0 /boot ext2 rw 0 0
/dev/system/tmp /tmp ext3 rw 0 0
/dev/system/var /var ext3 rw 0 0
/dev/system/usr /usr ext3 rw 0 0
/dev/system/usr_local /usr/local xfs rw 0 0
/dev/dataraid/private /ttt/private xfs rw 0 0
/dev/dataraid/ttchip /ttt/ttchip xfs rw 0 0
/dev/dataraid/tttech /ttt/tttech xfs rw 0 0
/dev/dataraid/marketing+pr /ttt/tttech/company/marketing+pr xfs rw 0 0
/dev/dataraid/projects /ttt/tttech/projects xfs rw 0 0
/dev/dataraid/sandbox /ttt/tttech/projects/sandbox xfs rw 0 0

still everything runs .. but i want it to be clean .. any advice would help 

thanks and best regards

-c-
