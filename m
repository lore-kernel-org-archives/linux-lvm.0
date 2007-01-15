Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0F9ipn8025345
	for <linux-lvm@redhat.com>; Mon, 15 Jan 2007 04:44:51 -0500
Received: from postfix2-g20.free.fr (postfix2-g20.free.fr [212.27.60.43])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0F9iocW031911
	for <linux-lvm@redhat.com>; Mon, 15 Jan 2007 04:44:50 -0500
Received: from smtp3-g19.free.fr (smtp3-g19.free.fr [212.27.42.29])
	by postfix2-g20.free.fr (Postfix) with ESMTP id C8B0A8F069E
	for <linux-lvm@redhat.com>; Mon, 15 Jan 2007 09:42:36 +0100 (CET)
Received: from imp6-g19.free.fr (imp6-g19.free.fr [212.27.42.6])
	by smtp3-g19.free.fr (Postfix) with ESMTP id DC9804A168
	for <linux-lvm@redhat.com>; Mon, 15 Jan 2007 10:42:26 +0100 (CET)
Message-ID: <1168854146.45ab4c8281ce4@imp6-g19.free.fr>
Date: Mon, 15 Jan 2007 10:42:26 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Mirroring my install. Lots of problems !
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi !
Disclaimer : I've tried this only on a Fedora Core 6 install with the latest
(fedora) kernel 2.6.18-xxx so take my post accordingly.
Here is what I plan to do and have trouble with :
I set up my Fedora system on a 160G IDE disk using LVM this way
hda1 is a 100 Mb plain EXT3 for /boot.
hda2 is a 55 GB LVM PV. (for my vg0 holding 4 LV for /, swap, /usr and /var)
hda3 is another pv for vg-ext (holding 2 lv, /home and /extra for extra stuff)
So far, fine.
I added another 160Gb IDE disk (quite identical, the original one is a
"Maxtor-Seagate" and the new one is a "plain" Seagate with same specs)
So I planned to switch to mirroring to survive a disk failure.
As I'm a unix system engineer working for more than 20 years on HP, Sun, IBM and
Bull AIX boxes, and practising Linux since Kernel 0.8 I was confident to
succeed. I was wrong.
Here is what I planned to do :
1) partition the second disk exactly as the first one.
2) pvcreate hdb2 and hdb3
3) vgextend /lvconvert vg0 and vg-ext to have one mirror copy
4) Enjoy, have a beer.
The conversion was a failure, because the tools asked for a THIRD disk in order
to mirror the VG. Funny. I thought GNU/Linux was clever, I was wrong. How come
HP-UX or Aix can do LVM mirror on 2 disks and not Linux ? (the corelog option
is also an issue, as reconstruction will take place at every reboot which occur
often as this is a home box, not a server)
So I decided to try a more complex approach : Create a mirror using the mdtools
(mdadm) and turn this into a VG. My plan was as follow :
1) create a critical mirror using mdadm with only one copy active on hdb2 repeat
with hdb3.
2) pvcreate md0 and md1
3) add md0 to vg0 and md1 to vg-ext
4) pvmove all vg0 lv to md0 and all vg-ext lv to md1.
5) vgreduce vg0 to remove hda2 and vg-ext to remove hda3
6) add hda2 to md0 and hda3 to md1 and force re-sync
7) have a beer, and enjoy.
Again, a disaster. I CAN'T add an md to a vg and have the vg work. I've tried to
do it using plain md0 to pvcreate, partitionning md0 to create md0p1 and
pvcreate this (it's impossible, as there is no /dev/md0p1 device...)
I've even tried to use system-config-lvm which is the Fedora graphical tool in
order to overcome my lack of knowledge, but this tools does not see the md as
unused devices, so I'm not the only one left without knowledge...
So, thanks for having read up to this point! My question is :
How do you folks do to have LVM and Mirror working at the same time on a Fedora
Core box ? And using ONLY two disks ? (I thing 160 GB is quite large for the
job, isn't it ? )
Thanks for your help and patience ;-)
--
