Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1Q4NBK23532
	for <linux-lvm@redhat.com>; Fri, 25 Feb 2005 23:23:11 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.194])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1Q4N5kU021574
	for <linux-lvm@redhat.com>; Fri, 25 Feb 2005 23:23:05 -0500
Received: by wproxy.gmail.com with SMTP id 36so456229wri
	for <linux-lvm@redhat.com>; Fri, 25 Feb 2005 20:23:00 -0800 (PST)
Message-ID: <45ae9037050225202249decf7a@mail.gmail.com>
Date: Fri, 25 Feb 2005 23:22:59 -0500
From: Jeff Macdonald <macfisherman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Adding a disk to a VG gone bad - need help
Reply-To: Jeff Macdonald <macfisherman@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hi,
I have one volume group and that is used as such:
[root@jeff ~]# /usr/sbin/lvscan
 ACTIVE            '/dev/VolGroup00/Root' [9.78 GB] inherit
 ACTIVE            '/dev/VolGroup00/Home' [231.31 GB] inherit
 ACTIVE            '/dev/VolGroup00/Swap' [320.00 MB] inherit

I added a whole disk to VolGroup00 like so:
[root@jeff ~]# dd if=/dev/zero of=/dev/hde bs=512 count=1
1+0 records in
1+0 records out

created the physical volume:
[root@jeff ~]# /usr/sbin/pvcreate /dev/hde

added it to the volume group:
[root@jeff ~]# /usr/sbin/vgextend VolGroup00 /dev/hde

added 100G from the 150G drive to Home:
[root@jeff ~]# /usr/sbin/lvextend -L+100G /dev/VolGroup00/Home
 Extending logical volume Home to 331.31 GB
 Logical volume Home successfully resized

At this point the docs suggest umounting the logical volume in order
to resize the file system. So I decided I was going to reboot the
computer and start it into single user mode. When doing that I'm
greated with:

lvm exited abnormally!
Couldn't find device with uuid <uuid>
Couldn't find all physical volumes for volume group VolGroup00

So it seems that it can't find the new physical volume that I just
added.  LVM is totally new to me, so any pointers would be great.
Booting from CD into rescue mode I wasn't unable to get very far. I
was able to run lvm and pvscan shows this interesting line:

PV /dev/hdf1 VG VolGroup00 lvm2 [ X GB / X GB free]
PV /dev/hdg2 VG VolGroup00 lvm2 [ Y GB / Y GB free]
PV unknown device VG VolGroup00 lvm2 [ Z GB / Z GB free]
Total: 3 [ X GB ] / in use 3

It seems to be that vgreduce is what I want in order to start over,
but running this in test mode with -t and --removemissing I see this
worrying line:
Removing LV Home from VG

and the line I want
Removing PV with UUID {correct UUID}

Am I on the right track?

TIA


-- 
Jeff Macdonald
Ayer, MA
