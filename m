Return-Path: <f.brockerhoff@arcologie.net>
Message-Id: <5.0.0.25.0.20010106030148.00aa4e20@mail.arcologie.net>
Date: Sat, 06 Jan 2001 03:14:12 +0100
From: Falk Brockerhoff <f.brockerhoff@arcologie.net>
Mime-Version: 1.0
Subject: [linux-lvm] Create a VG on a /dev/md??
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello!

I'm just installing my new Fileserver. It has to have the following goodies

- software raid - to make the data safe
- lvm (?) to change the size of the system in both ways: increase and decrease

I have three 45G disks.

My first considering was to create to create a software-Raid-5-System and put
a lvm-system on it. But I can only create a lvm on physical discs?!


but i think that's better to create it this way, because otherwise the data 
won't
be safe.

ok, let's dream:
when i want to increase the size of the storage system i add another 
raid-device
(raid1 or raid5) and add it to the lvm. when i want (in the future) to 
decrease the
size i just remove the second md-device. but - described above - that's not 
possible.

back to reality:
i have to put the raid above the lvm. hmmmm..... ok, i have three disks. 
each pv is an
vg is an lv:

hda1 -> vg_hda -> lv_hda
hdb1 -> vg_hdb -> lv_hdb
hdc1 -> vg_hdc -> lv_hdc

lv_hda, lv_hdb, lv_hdc -> md0

when i want to increase the size i have to put to all three vg's/lg's a pv 
of the same size.

where's the need for lvm?:
i think i can do it without lvm and use raidhotadd to add another pv (of 
the same size
of course -> 45g in this case)


it would be easier for me if i can do it on the other way:
/dev/md0 -> vg -> lv

increase
add /dev/md1



i hope you'll understand me! if i'm right, is there planned to realize this 
feature
or if i'm not: why can't i build a lvm above a raid-system?

Falk
