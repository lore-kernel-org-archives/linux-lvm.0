Message-ID: <090201c20c83$c51fcd40$0a00000a@gr>
From: "Gunnar Rysstad" <gunnar@rysstad.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing disks from existing volume with data.
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
Date: Wed Jun  5 06:27:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

some months ago I setup a redhat box running kernel 2.4.18 and LVM 1.0.3.
There were four disks and they we're all included in the LVM-volume I
created, which gave me a LVM-volume with a total size of ~230gig.

Since this box didn't have more than two IDE-ports, and I already had 4
disks in it, I wasn't planning to expand the volume any further. Therefor I
didn't do anything with 256GB limit in spite of a friends recommendations -
and now, I just got a IDE controller-card which can take four more devices,
and I've already got two disks I would like to include in the LVM-volume.

This is my "old" volume (storage):

--- Volume group ---
VG Name               storage
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                5
Act PV                5
VG Size               231.49 GB
PE Size               4 MB
Total PE              59261
Alloc PE / Size       59261 / 231.49 GB
Free  PE / Size       0 / 0
VG UUID               I99L5r-trcv-x6Hb-1bKC-O5qf-1Mdy-8Q3G8P


My devices:

pvscan -- ACTIVE   PV "/dev/hde"  of VG "s0"      [74.47 GB / 0 free] (new
80gig - currently setup in a new volume)

The 256G limited volume:

pvscan -- ACTIVE   PV "/dev/hdc1" of VG "storage" [41.92 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdd1" of VG "storage" [42.94 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hda5" of VG "storage" [34.86 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb1" of VG "storage" [53.86 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb2" of VG "storage" [57.91 GB / 0 free]

pvscan -- total: 6 [306.05 GB] / in use: 6 [306.05 GB] / in no VG: 0 [0]
(new 80gig included)


Well, I've heard you cannot change the MAX LV Size on existing volumes,
therefor I created a new volumegroup with the new 80gig disk, called 's0',
and a volume called 'vol0'. This time with a 2TB limit:

--- Volume group ---
VG Name               s0
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               74.47 GB
PE Size               32 MB
Total PE              2383
Alloc PE / Size       2383 / 74.47 GB
Free  PE / Size       0 / 0
VG UUID               gNo0V0-OOKU-teKS-QenZ-I84O-WkHE-Z7ia5t


What I need to do now is to take out one disk at the time from the old
volume, and move it to the new one.

(root@avalon root)# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda2             2.9G  2.3G  639M  79% /
/dev/hda1              30M  4.1M   26M  14% /boot
none                  125M     0  125M   0% /dev/shm
/dev/storage/vol0     228G  164G   64G  72% /storage
/dev/s0/vol0           73G   62G  9.7G  87% /voltmp
(root@avalon root)#

I've moved 62gig from the old volume and over to the new one, so the old
volume should have enough space to remove one drive/partition. I've searched
the mailinglist archive and checked a couple of howto's, but all I can find
information about is how to replace a drive with a new one, not removing one
completely. "pvmove" seems to be the answer, but I can't really figure how
to do this, and there's no chance I can take backup of 230Gig.

How can I move all the content on one of the drives in the volume over to
the others and make sure the one I want to remove is empty? Do I need to
shrink the volume first, and then use pvmove?

I would appreciate if anyone could tell me how to do this, or at least give
me some hints.


Regards,


Gunnar Rysstad
