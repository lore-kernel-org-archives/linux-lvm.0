From: "Brint E. Kriebel" <bek5084@osfmail.isc.rit.edu>
Message-id: <1049071311.3e878ecf031e5@webmail.rit.edu>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] ERROR "pv_read(): LVM structure version"
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
Date: Sun Mar 30 18:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello all, I'm new to this list (since this is the first major problem i've had
with LVM) so please bare with me and let me know what i need to submit for help.
Here's the situation:
I wanted to upgrade from Slackware 8.1 to Slackware 9.0. On the system I had a
volume group (vg00) of 4 disks (hde1 through hdh1). The LVM was running fine. I
first attempted to do the upgrade to slack 9 without a full reinstall (using
swaret) but didn't like some of the results with other parts of the system. LVM
is still fine at the point. So, I prepare to do a full upgrade. I figured the
best way to do this would be to export the LVM on the running system, do the
upgrade to slack 9 with a fresh clean install, then import the LVM back in.
These were the commands I planned to use:
On old system:
vgchange -an vg00
vgexport vg00

On new system:
vgimport vg00 /dev/hde1
vgchange -ay vg00

So, as a test, I figured I would run this set of commands on the system without
the upgrade. Here's where things went wrong. I did the vgchange and the
vgexport... No problem, go to do the vgimport and I get 
vgimport -- ERROR "vg_read_with_pv_and_lv(): current PV" reading data of volume
group "vg00"

eek... okay, so i try a vgscan with these results:
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume
group "vg00PV_EXP" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

and a pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1"  is in EXPORTED VG "vg00" [38.16 GB / 0 free]
pvscan -- inactive PV "/dev/hdh1"  is in EXPORTED VG "vg00" [57.26 GB / 0 free]
pvscan -- inactive PV "/dev/hde1"  is in EXPORTED VG "vg00" [28.61 GB / 0 free]
pvscan -- total: 3 [124.05 GB] / in use: 3 [124.05 GB] / in no VG: 0 [0]

So i see that /dev/hdf1 is missing... :(
so pvdisplay /dev/hdf1
pvdisplay -- ERROR "pv_read(): LVM structure version" no VALID physical volume
"/dev/hdf1"

so i try a vgcfgrestore (yes, i saved a copy) -n vg00 /dev/hdf1
vgcfgrestore -- this is a backup of volume group "vg00"
vgcfgrestore -- ERROR "pv_read(): LVM structure version" reading physical volume
"/dev/hdf1"

So I think to myself "maybe it was the half upgrade to 9"... So I did a complete
reinstall of 8.1 - same results, so I did a clean install of 9 - same results...
It seems like no matter what I do, I get the LVM structure version error. So my
real question is, is there any way to fix this? I tried playing around with a
script pvversion that was supposed to change the structure version, but it
didn't seem to do anything. If I can't fix this drive, i'm willing to bite the
loss of the data on that drive, but I can't seem to find a way to bring back the
volume group without that drive intact. If I throw another drive in it's place
and run a vgcfgrestore on it, it works - but then I have that one drive there,
and 3 exported drives. Can i somehow import those 3 with the 1 replacement? Or,
am I completely out of luck and have lost the whole group?

Any help is greatly appreciated... I can supply any other command results that
anyone thinks would be helpful. If it comes to it i could possibly give someone
ssh access to the box (nothing else on it at the moment anyway). Feel free to
email me directly, otherwise I will be monitoring the thread. Thanks in advance.

Brint E. Kriebel
3rd Year Information Technology Major
Rochester Institute of Technology
Rochester, NY
bek5084@rit.edu
