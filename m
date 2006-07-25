Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6PBYF7S016197
	for <linux-lvm@redhat.com>; Tue, 25 Jul 2006 07:34:15 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.184])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6PBY3AM022651
	for <linux-lvm@redhat.com>; Tue, 25 Jul 2006 07:34:09 -0400
Received: by nf-out-0910.google.com with SMTP id l36so219875nfa
	for <linux-lvm@redhat.com>; Tue, 25 Jul 2006 04:34:02 -0700 (PDT)
Message-ID: <8e3c40600607250434p6ab2936er3986b6e9a4da4e29@mail.gmail.com>
Date: Tue, 25 Jul 2006 13:34:02 +0200
From: "Dennis Ortsen" <dortsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] fc4 lvm2 snapshot problem
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi All,

After struggling for a while, I thought I'd try it on the list.

I have filed a bugreport in Red Hat's Bugzilla (bug ID: 188013). There
you can find the whole story. The shorter version (and latest added
comment) is as follows:

When creating a snapshot volume you get a message saying the newly created
snapshot volume is in use and will not be removed/not able to deactivate new
snapshot:
localhost.localdomain:~# lvcreate -s -n snap -L 512M /dev/vg/home
   LV vg/snap in use: not removing
   Couldn't deactivate new snapshot.
When examining the attributes of the various volumes, the snapshot volume
doesn't have the expected attributes or origin volume set:
localhost.localdomain:~# lvs
   LV         VG     Attr     LSize    Origin    Snap%   Move    Copy%
   home       vg     -wi-ao   500.00M
   snap       vg     -wi-a-   512M
   log        vg     -wi-oa   500.00M

I was told that I needed to update to kernel 2.6.16+ and update the
userspace tools too. For FC5 these were released, but not for FC4.
Until july 2. I have installed the updates
(kernel-smp-2.6.17-1.2142_FC4, lvm2-2.02.06-1.0.fc4
and device-mapper-1.02.07-2.0 from FC4 updates by AGK@redhat.com). I tested the
updates a few times (about 50) with some reboots in between and it all seemed to
be working like a charm again. Until I updated a (semi) production server...
Luckily it isn't in production yet, but the problem remains on that server...

However when I shoot down udevd (udev-071-0.FC4.3) I can create as many snapshot
devices as I like. Until the udevd daemon has been respawned. Then it all stops
working (the creation of snapshot volumes). When I disable udev in
/etc/rc.sysinit (place comments before start_udev and udevsend) and reboot, I
can create snapshot volumes a dozen of times without problems. Until I manually
start udevd. Then the fun is over. When I kill udevd again, I can continue
creating snapshot volumes. Both servers (the one that works and the one that
doesn't) have the exact same versions of the kernel, lvm2,
device-mapper and udev.

My best guess is udev that is messing about. I don't know whether I can safely
disable udev on a production server. But more importantly: what can I
do to get this properly fixed? Am I missing an important update? Are
there any known conflicts with other packages or third party software
(such as roxen)? Is there anyone who has similar problems?

Thanks in advance,

Dennis
