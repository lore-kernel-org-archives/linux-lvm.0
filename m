Return-Path: <fertile@nildram.co.uk>
From: "fertile" <fertile@nildram.co.uk>
Date: Sun, 17 Dec 2000 12:49:32 -0000
Message-ID: <LPBBJKAONKCJOLEHOLPDCELECAAA.fertile@nildram.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] segfault using vgmerge ?? not a clue why - (newbie)
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

/usr/sbin/vgmerge -v vg1 vg2
vgmerge -- locking logical volume manager
vgmerge -- checking volume group name "vg1"
vgmerge -- checking volume group name "vg2"
vgmerge -- checking for volume group "vg2" activity
vgmerge -- reading data of volume group "vg1" from "/etc/lvmtab"
vgmerge -- reading data of volume group "vg2"
vgmerge -- merging VGDA of volume group "vg2" into that of "vg1"
vgmerge -- extending volume group "vg1" by physical volume "/dev/hdb1" in
kernel
Segmentation fault

ok i have vg1 setup and running fine (one 40 gig drive)
vg2 seems to be fine ? .. ( a 40 and a 30 gig drive running as 70 gig vg2 )

vgextend gives me a segfault..so does vgmerge

-rw-------   1 3009     users       25337 Nov 21 10:11
linux-2.2.17-rawio.patch
-rw-------   1 3009     users      149954 Nov 21 10:09
lvm-0.9-2.2.17-stock.patch
-rw-r--r--   1 root     root      1876737 Nov 29 23:09 lvm-0_9-1.i386.rpm

above kernel.. and above version of LVM im using ..(trying to )

i know this is a vague question, but i am not at all skilled in linux and
its taken a lot of work to get this far :)

if you can think of any possible things i can look for / check , then id
appreciate it a lot ..

thanks,

kev
