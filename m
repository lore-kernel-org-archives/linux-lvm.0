Message-ID: <001501c31d2a$0ea25f20$6c7745cb@codevel>
From: "armani" <is.stan@msa.hinet.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Newbie to snapshot
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
Date: Sun May 18 05:41:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello List

I am a newbie to use LVM.

When I read the HowTo on
http://www.linux.org/docs/ldp/howto/LVM-HOWTO/snapshots_backup.html
I tried to practice it with my Linux Box.

Everything is fine but snapshot !

==============================================================
[root@met tmp]# lvscan
lvscan -- ACTIVE   Original "/dev/Vol1/LV1" [10 GB]
lvscan -- ACTIVE            "/dev/Vol1/LV2" [2 GB]
lvscan -- ACTIVE            "/dev/Vol1/LV3" [2 GB]
lvscan -- ACTIVE            "/dev/Vol1/LV4" [2 GB]
lvscan -- ACTIVE   Snapshot "/dev/Vol1/snapshot" [1.97 GB] of /dev/Vol1/LV1
lvscan -- 5 logical volumes with 17.97 GB total in 1 volume group
lvscan -- 5 active logical volumes
==============================================================

As the description, I make a Original LV device named /dev/Vol1/LV1,
and then I make a snapshot device named "/dev/Vol1/snapshot" for
/dev/Vol1/LV1 .
So I try to put something for /dev/Vol1/LV1

# mount /dev/Vol1/LV1 /mnt/LV1
# mount /dev/Vol1/snapshot /mnt/snapshot [ I'm using ext3 ]
# dd if=/dev/zero of=/mnt/LV1/test bs=1M count=10

and then
# tar cf /dev/hda8 /mnt/snapshot or # tar cf /tmp/test.tar /mnt/snapshot
but I can't see any file except the "/mnt/snapshot/lost+found" directory
with the following command !!
# tar xf /dev/hda8 or # tar xf /tmp/test.tar

I don't have any idea to use this snapshot, any suggested references ?
