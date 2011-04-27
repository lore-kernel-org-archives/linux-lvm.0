Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3R3D2pn004679
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 23:13:02 -0400
Received: from mail-yx0-f174.google.com (mail-yx0-f174.google.com
	[209.85.213.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3R3CwO3025034
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 23:12:58 -0400
Received: by yxs7 with SMTP id 7so431088yxs.33
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 20:12:58 -0700 (PDT)
MIME-Version: 1.0
Sender: cjstreeter@gmail.com
From: Chris Streeter <chris@chrisstreeter.com>
Date: Tue, 26 Apr 2011 20:12:28 -0700
Message-ID: <BANLkTinf5PWmfm2YOMshbOUvh3+ht89jhA@mail.gmail.com>
Subject: [linux-lvm] Recovering Accidentally Destroyed LVM2 Information
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Ok, so I'm stupid and made a serious and grave mistake. On my linux
box running Ubuntu 10.10, I have a 1.5TB RAID array that I had
originally setup using the instructions located here:
http://www.gagme.com/greg/linux/raid-lvm.php The RAID array is a 4 x
500GB RAID 5 array with an ext3 formatted filesystem and is not my
boot device. The RAID array was just used for storage. The LVM setup
is a single physical volume (the RAID device) and a single logical
volume that makes up the entire physical volume.

So here is the list of steps that I ended up doing, based on the
contents of the files in /etc/lvm/archive (one file was created before
each step, and the file lists what the command was):

    lvremove /dev/raid_vg/lv0
    lvcreate -l 357702 raid_vg -n lv0
    lvremove raid_vg
    lvcreate -l 357702 raid_vg -n lv0
    lvremove raid_vg
    vgexport raid_vg
    vgimport raid_vg
    vgscan
    lvremove raid_vg
    vgcreate raid_vg /dev/md1

So, I accidentally called lvremove instead of lvchange -a n Then I
realized my mistake and tried to restore the logical volume. But that
made the disk seem empty.

Now, I'm not sure, but I don't think the data was wiped (at least not
all of it). I've cloned the device with ddrescue just so I don't loose
anything and can experiment on the image.

Now, my question is then, is it possible to restore the LVM
information to the disk and get my filesystem back? I've got the
configuration files in /etc/lvm/archive which give me the start
extents, sizes and extent counts.

Any help that anyone might be able to provide would be extremely
appreciated. I was an idiot and screwed myself. I just hope that it
was temporary and I can get my data back.

- Chris
