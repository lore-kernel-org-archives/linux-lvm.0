Mime-Version: 1.0
Message-Id: <a06020401bc1894cc95ec@[192.168.10.11]>
From: John Seifarth <lists@waw.be>
Subject: [linux-lvm] Cannot mount ext3 snapshot
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
Date: Wed Dec 31 18:46:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've serious problem with snapshots here.

I've used LVM on other machines, but had not yet tried the snapshot feature.

I just built a machine with a 3ware SATA RAID controller, and used 
LVM on the /dev/sda device it presents. When I try to mount a 
snapshot, I get a message:
Mount: wrong fs type, bad option, bad superblock on /dev/fast/snap,
        or too many mounted file systems

Is the problem dependent on the RAID controller? I created a VG and 
LV based on a normal ATA partition, and got the same error message on 
attempting to mount.

I tried on my previous machines, and they allow mounting snapshots 
with no problem.

WORKING CONFIGURATION
Slackware 8.1
linux kernel 2.4.22
mount version mount-2.11r
LVM version in kernel 1.0.5+(22/07/2002)
LVM tools version vgdisplay --version gives 1.0.7
Filesystem reiserfs


NON-SNAPSHOT MOUNTING CONFIGURATION
Slackware 9.1
linux kernel 2.4.23
mount version mount-2.12
LVM version in kernel 1.0.7(28/03/2003)
LVM tools version vgdisplay --version gives 1.0.7
Filesystem: ext3

ADDITIONAL TESTS
dmesg shows
for ext3 file systems
EXT3-fs: INFO: recovery required on readonly filesystem
EXT3-fs: write access unavailable, cannot proceed
and doesn't mount

for reiserfs
Can't write to read-only device 3a:03
repeated several times, but mounts finally

To get snapshots to work with ext3, I must first unmount the source 
volume and create the snapshot. Then I can get the snapshot to mount. 
Trying again later, making a snapshot with the volume mounted, the 
snapshot fails to mount.

Once I made a snapshot of the unmounted reiserfs volume, subsequent 
snapshots of the mounted reiserfs volume appear to mount as expected. 
This appears to hold true on the IDE disk partition and the 3ware 
raid card disk device.

Anyone else notice this type of behavior with snapshots?

Anyone else using snapshots for database backups?

Thanks,

John

-- 
__________________________________________________________________
John Seifarth                               http://www.waw.be/waw/
Words & Wires SPRL                                    lists@waw.be
Computer Consulting & Language Services   Voice: (+) 32-2-660-3943
1160 Brussels, Belgium                      Fax: (+) 32-2-675-3922
