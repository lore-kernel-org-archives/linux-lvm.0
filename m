From: "Carey Jung" <carey@itfreedom.com>
Message-ID: <GNEAKGKKMNLLGBACDNBJMECACGAA.carey@itfreedom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove errors
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
Date: Wed Apr 23 19:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I'm getting errors from pvmove, similar to a problem reported in December (
http://lists.sistina.com/pipermail/linux-lvm/2002-December/012973.html),
though I'm not sure if it's exactly the same.  Here's the relevant pvmove
output:

# pvmove -v -n /dev/backups2/rje /dev/sdd1 /dev/sda6
...
pvmove -- starting to move linear logical volume "/dev/backups2/rje"
pvmove -- checking for enough free physical extents in "backups2"
pvmove -- /dev/sdd1 [PE 0 [rje [LE 0]] -> /dev/sda6 [PE 2542] [1/6400]
/dev/backups2/group::/dev/backups2/rje: 0831 65920, 0806 166658560
pvmove -- ERROR "Invalid argument" copying extent from "/dev/sdd1"

pvmove -- ERROR "Invalid argument" remapping
pvmove -- ERROR "pv_move(): LE of LV remap" moving physical extents

I believe this is telling me that pvmove is having a problem copying PE 0 on
/dev/sdd1 to PE 2542 on /dev/sda6....  Yet lvdisplay indicates that LE 0 is
already on /dev/sda6, PE 02542 -- if I understand it correctly:

# lvdisplay -v /dev/backups2/rje |head -25
--- Logical volume ---
LV Name                /dev/backups2/rje
VG Name                backups2
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                200 GB
Current LE             6400
Allocated LE           6400
Allocation             next free
Read ahead sectors     1024
Block device           58:2

   --- Distribution of logical volume on 1 physical volume  ---
   PV Name                  PE on PV     reads      writes
   /dev/sdd1                6400         1849755    26252516

   --- logical volume i/o statistic ---
   1849755 reads  26252516 writes

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/sda6                 02542  904        527167
   00001 /dev/sda6                 02543  217        36574

pvdisplay confirms that PE 0 on /dev/sdd1 is free, and LE 0 is already on
/dev/sda6, PE 2542:

# pvdisplay -v /dev/sdd1|head -25
--- Physical volume ---
PV Name               /dev/sdd1
VG Name               backups2
PV Size               279.47 GB [586099332 secs] / NOT usable 32.19 MB [LVM:
162 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       32768
Total PE              8942
Free PE               2568
Allocated PE          6374
PV UUID               joJY49-jRXo-3CYM-rL3Q-qy16-CA6g-0AX9tY

   --- Distribution of physical volume ---
   LV Name                   LE of LV  PE for LV
   /dev/backups2/rje         6400      6374

   --- Physical extents ---
   PE    LV                        LE      Disk sector
   00000 free
   .....
   00025 free
   00026 /dev/backups2/rje         00026   1769856
   00027 /dev/backups2/rje         00027   1835392

# pvdisplay -v /dev/sda6
...
   02542 /dev/backups2/rje         00000   166658560
   02543 /dev/backups2/rje         00001   166724096
   02544 /dev/backups2/rje         00002   166789632
   02545 /dev/backups2/rje         00003   166855168
   02546 /dev/backups2/rje         00004   166920704
...

Am I reading this correctly?  Any ideas what the problem is, or how to fix
it?  I've been moving several LVs from /dev/sdd1 to /dev/sda6; all completed
successfully.  This, the last one, is giving me an error.

Thanks in advance for any help....!

Carey Jung
