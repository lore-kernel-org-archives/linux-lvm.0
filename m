From: Erik Zweers <zweers@execulink.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1012932686.4859.2.camel@cider.execulink.net>
MIME-Version: 1.0
Subject: [linux-lvm] File Corruption on LVM LV's in same VG
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
Date: Tue Feb  5 12:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I've been using LVM on a test system for a couple of months now, and
sofar have had no problems.  We have two VG's, one made up of multiple
SCSI drives and one consisting of a single large IDE drive.  The IDE VG
is used for more storage, while the SCSI VG is used for more active
applications (cyrus imap, home directores etc).

A few weeks ago the IDE VG was destroyed by attempting to install LILO
on the drive (there was confusion over how the system was setup).  The
system was also configured with the IDE as slave with no master.

The system was repaired and believed to be running properly, until
yesterday where we discovered that some of our ISO's were wrong,
consistently wrong in inconsistent locations.  I've pasted in a record
of the symptoms.  If anyone has any advice on what else to diagnose (if
your intrested in what is wrong) or how to repair It would be greatly
appreciated.

I have not rebooted the machine yet, wanting to be sure that any
diagnoses that can be done is done.

-----------------------------------------------------------------

in /var/export/iso
LV /dev/ide/iso
VG ide

[root@ike iso]# md5sum enigma-i386-disc1.iso enigma-i386-disc1.iso
enigma-i386-disc1.iso
83edcc827cdc3db2b4b0237bab59b1dd  enigma-i386-disc1.iso
13b425cda141e3263be34a37f237b410  enigma-i386-disc1.iso
5b4ade7fcc64bf587c266935ff9e4a2d  enigma-i386-disc1.iso
[root@ike iso]# md5sum seawolf-i386-disc1.iso seawolf-i386-disc1.iso
10bd7359091e3ce93b6b8da8eaed7afe  seawolf-i386-disc1.iso
e5ef0aa5922e45d39efffe04e904e739  seawolf-i386-disc1.iso

in /var/export/mp3/zweers
LV /dev/ide/mp3
VG ide

[root@ike zweers]# md5sum enigma-i386-disc1.iso enigma-i386-disc1.iso
18fd4da5a7b33e1598e88ff717aabbe6  enigma-i386-disc1.iso
b0a11d0a5efa523e136a0b5e2157334d  enigma-i386-disc1.iso

[root@ike iso]# cmp -l enigma-i386-disc1.iso ~carl/enigma-i386-disc1.iso
2549832  77  67
13431928 177 167
14489440 376 366
27451404 177 173
33149724 376 336
86298228 177 167
116907524 372 332
119130964  77  67
121124171 376 356


[root@ike iso]# cmp -l enigma-i386-disc1.iso ~carl/enigma-i386-disc1.iso
2549832  77  67
11455071 177 167
13431928 177 167
18043044 277 273
24780964 277 273
86298228 177 167
94133044 370 330
106966431 177 167


[root@ike iso]# cmp -l enigma-i386-disc1.iso ~carl/enigma-i386-disc1.iso
| wc -l     62
[root@ike iso]# ls -l enigma-i386-disc1.iso
-rw-r--r--    1 root     root     677961728 Feb  4 20:31
enigma-i386-disc1.iso

[root@ike iso]# fsck -n /dev/ide/iso
Parallelizing fsck version 1.23 (15-Aug-2001)
e2fsck 1.23, 15-Aug-2001 for EXT2 FS 0.5b, 95/08/09
Warning!  /dev/ide/iso is mounted.
/dev/ide/iso: clean, 24/1281696 files, 1351397/2560000 blocks
