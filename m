Message-ID: <000501c3a9bb$96dab540$c996249e@venus>
From: "Even" <even@circlestorm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] A PV disappeard (No, it didn't crash...)
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
Date: Thu Nov 13 08:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!

This is not the usual "Diskcrash, I need help to rescue the rest of my data
on the other disks" question, I've seen enough of them, going through the
archive as far back as January, trying to find a solution to my problem.

I installed SuSE 9.0 on my system, on a 4 gig extended partition with ext3.
On this system i also have a 760GB LVM (with ext2). Fool as I am, I decided
to check out the LVM-tool in YaST/System/LVM. Now, I marked my /dev/hdc1
partition, choose "Edit", did nothing but look at the options, quit the
LVM-tool. I booted into my my WinXP partition because I had to use some
windows tools, and upon my return I see that the VG is having trouble
reading off the PV's. The boot-process goes into an eternal loop, so I
reinstall SuSE. After some time fooling around, I run lvmdiskscan.

linux:/etc # lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/hdg1   [      74.52 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hde1   [     111.78 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdf1   [     111.78 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdc1   [     186.29 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hdd1   [     111.78 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- /dev/hda1   [       3.91 GB] Primary   [0x07]
lvmdiskscan -- /dev/hda2   [     102.97 GB] Primary   [0x07]
lvmdiskscan -- /dev/hda3   [       4.90 GB] Primary  Windows98 extended
partition [0x0F]
lvmdiskscan -- /dev/hda5   [     494.16 MB] Extended LINUX swap partition
[0x82]
lvmdiskscan -- /dev/hda6   [       4.42 GB] Extended LINUX native partition
[0x83]
lvmdiskscan -- /dev/hdb1   [     111.78 GB] Primary  LVM partition [0x8E]
lvmdiskscan -- 7 disks
lvmdiskscan -- 0 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 11 partitions
lvmdiskscan -- 6 LVM physical volume partitions

Everything looks good, I run pvscan.

linux:/etc # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "planet_core"
(run vgscan)
pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG "planet_core"
(run vgscan)
pvscan -- inactive PV "/dev/hdf1"  is associated to unknown VG "planet_core"
(run vgscan)
pvscan -- inactive PV "/dev/hdd"  is in no VG  [8.01 GB]
pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "planet_core"
(run vgscan)
pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "planet_core"
(run vgscan)
pvscan -- total: 6 [529.65 GB] / in use: 5 [521.64 GB] / in no VG: 1 [8.01
GB]

linux:/etc # pvdata /dev/hdc1
--- Physical Volume ---
PV Name              /dev/hdc1
VG Name              <lots of garbish>

PV Size               1.34 TB [2871331970 secs] / NOT usable 1005.06 MB
[LVM: 3.01 GB]
PV#                     3489574780
PV Status            available
Allocatable          NO
Cur LV                1368747627
PE Size (KByte)   193992784

<goes on with a lot of data totaly off>
<snip>

--- List of logical volumes ---

pvdata -- can't seek to logical struct #0 on physical volume "/dev/hdc1"
pvdata -- can't seek to logical struct #1 on physical volume "/dev/hdc1"
pvdata -- can't seek to logical struct #2 on physical volume "/dev/hdc1"
<ad nauseum, snip>

hmm, I remember making a PV directly on /dev/hdd once, just to see if it was
possible, but it was deleted before I created /dev/hdd1 and put a PV on it,
why is it still there? But more importantly, where is /dev/hdc1?

Is there a way to "activate" /dev/hdc1 as a PV again without ruining the
data on it? I suppose all the data is still there, but something has
happened too the PVdata (always the optimist :).

Sincerly
Even Kristoffersen
