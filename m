Subject: [linux-lvm] Problems with vgimport after software raid
	initialisation failed.
From: SystemError <system.error@gmx.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1064951960.3742.51.camel@carthage>
Mime-Version: 1.0
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
Date: Tue Sep 30 15:00:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello out there,

after I migrating my precious volume group "datavg" from unmirrored
disks to linux software raid devices I ran into serios problems.
(Although I fear the biggest problem here was my own incompetence...)

First I moved the data from the old unmirrored disks away, using pvmove.
No Problems so far.

At a certain point I had emptied the 2 PVs "/dev/hdh" and "/dev/hdf".
So I did a vgreduce on them, then created a new raid1 
"/dev/md4" (containing both "hdf" and "hdh") and added it to my 
volume group "datavg" using pvcreate(->"/dev/md4") and vgextend.
No Problems so far.

Everything looked soooo perfect and so I decided to reboot the system...

At this point things started to go wrong, during the boot sequence
"/dev/md4" was not automatically activated and suddenly the PV
"/dev/hdf" showed up in "datavg", "/dev/md4" was gone.

Unfortunately I paniced and ran a vgexport on "datavg", fixed the broken
initialisation of "/dev/md4", and rebooted again. 
This was a probably a baaad idea. 
Shame upon me.

Now my pvscan looks like this:
"
[root@athens root]# pvscan 
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md2" of VG "sysvg" [16 GB / 10 GB free]
pvscan -- inactive PV "/dev/md3" is in EXPORTED VG "datavg" [132.25 GB /
0 free]
pvscan -- inactive PV "/dev/md4"  is associated to unknown VG "datavg"
(run vgscan)
pvscan -- WARNING: physical volume "/dev/hdh" belongs to a meta device
pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "datavg" [57.12 GB /
50.88 GB free]
pvscan -- total: 5 [262.97 GB] / in use: 5 [262.97 GB] / in no VG: 0 [0]
"

Or with the -u option:
"
[root@athens root]# pvscan -u
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md2" with UUID
"g6Au3J-2C4H-Ifjo-iESu-4yp8-aRQv-ozChyW" of VG "sysvg"        [16 GB /
10 GB free]
pvscan -- inactive PV "/dev/md3" with UUID
"R15mli-TFs2-214J-YTBh-Hatl-erbL-G7WS4b"  is in EXPORTED VG "datavg"
[132.25 GB / 0 free]
pvscan -- inactive PV "/dev/md4" with UUID
"szAa6A-rNM7-FmeU-6DHl-rKmZ-SePL-IURwtg"  is in EXPORTED VG "datavg"
[57.12 GB / 50.88 GB free]
pvscan -- WARNING: physical volume "/dev/hdh" belongs to a meta device
pvscan -- inactive PV "/dev/hdf" with UUID
"szAa6A-rNM7-FmeU-6DHl-rKmZ-SePL-IURwtg"  is in EXPORTED VG "datavg"
[57.12 GB / 50.88 GB free]
pvscan -- total: 5 [262.97 GB] / in use: 5 [262.97 GB] / in no VG: 0 [0]

"

A vgimport using "md3"(no probs with this raid1) and "md4" fails: 
"
[root@athens root]# vgimport datavg /dev/md3 /dev/md4
vgimport -- ERROR "pv_read(): multiple device" reading physical volume
"/dev/md4"
"

Using "md3" and "hdh" also fails:
"
[root@athens root]# vgimport datavg /dev/md3 /dev/hdh
vgimport -- ERROR "pv_read(): multiple device" reading physical volume
"/dev/hdh"
"

It also fails when I try to use "hdf", only the error message is
different:
"
[root@athens root]# vgimport datavg /dev/md3 /dev/hdf
vgimport -- ERROR: wrong number of physical volumes to import volume
group "datavg"
"

So here I am, with a huge VG an tons of data in it but no way to access
the VG. Has anybody out there an idea how I can still access
the data of datavg ?

By the way: 
I am using RedHatLinux 9.0 with the lvm-1.0.3-12 binary rpm package
as provided by RedHat.

Bye
In desperation
Lutz Reinegger

PS:
Any comments and suggestions are highly appreciated, even if those
suggestions include the use of hex editors or sacrificing 
caffeine to dark and ancient deities.
;-)
