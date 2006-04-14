Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3EE8sDn003952
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 10:08:54 -0400
Received: from mail.nmr.mgh.harvard.edu (mail.nmr.mgh.harvard.edu
	[132.183.202.9])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3EE8mwW018800
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 10:08:48 -0400
Received: from gate.nmr.mgh.harvard.edu (gate.nmr.mgh.harvard.edu
	[132.183.203.69]) (authenticated bits=0)
	by mail.nmr.mgh.harvard.edu (8.13.1/8.13.1) with ESMTP id
	k3EE8edG002476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 10:08:40 -0400
Date: Fri, 14 Apr 2006 10:08:40 -0400 (EDT)
From: Paul Raines <raines@nmr.mgh.harvard.edu>
Message-ID: <Pine.LNX.4.62.0604131143270.21727@gate.nmr.mgh.harvard.edu>
MIME-Version: 1.0
Subject: [linux-lvm] LVM2, NFS and random device (major:minor) numbers
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


I have a NFS server still running CentOS 4.0 (kernel 2.6.9-5.0.5.ELsmp, 
lvm2-2.00.31-1.0.RHEL4).  It has two 3ware 9500S-8 controllers translating 
to two RAIDs at /dev/sda and /dev/sdb. The OS is on a small regular IDE 
disk.  Both sda and sdb are 2TBs, have a GPT partition table and have one 
LVM flagged partition taking up the whole 2TBs -- /dev/sda1 and /dev/sdb1 
each made into PVs.  I created two volume groups, vg1 on sda1 and vg2 on 
sda2.  No other PVs involved.

I started making volumes on vg1 and no problems.  Recently I made a couple 
volumes on vg2 and started using them with no problems.  Then yesterday I 
rebooted the box for the first time since creating volumes on vg2. 
Suddenly I get reports from my users who have NFS mounted the volumes that 
data is missing or wrong.  Looking closely I see that volumes off this 
server are suddenly mounted in the wrong spots off by two (volume1 is 
mounted where volume3 is supposed to be, volume2 is mounted where volume 4 
is supposed to be, and son on).

NFS depends on what the server says the underlying device id is of the 
exported volume and if that changes, then NFS mounts are going to change 
out from under themselves.  And everytime I add a volume and reboot the 
device ids change.

I can see that vgscan always sees vg2 before vg1 but gives no way to change 
the order it sees things.  I suspect if I had filled up vg2 first and then 
made volumes on vg1, I never would have discovered this problem unless
I went back and deleted a volume on vg2.

After frantically search the net about what the hell is going on I first 
find a Changelog for lvm1 saying a bug just like this got fixed. But this 
is lvm2 and it seems to not be fixed.  I try upgrading to CentOS 4.2 but 
testing the issue again by creating more volumes on vg2 and the rebooting 
show the underlying device ids change once again.

I finally come upon this old post to this list:

http://www.redhat.com/archives/linux-lvm/2005-May/msg00029.html

QUESTION 1: My first question is why aren't major/minor assignments 
persistent in the first place by default?  I cannot see a reason why not 
and the current default behavior is just asking for trouble for anyone 
doing NFS export of their LVM volumes.  It also screwes up many incremental 
backup programs that depend on persistent device numbers so the exports 
fsid= thing is not a full solution.

It seems like something about this should be screamed as a loud warning in 
the LVM HOWTO if things really are supposed to work way, but I could find 
no reference to it at all.

On my server, I turned off the NFS server, umounted all the volumes and 
desperately tried to think of a way I could get my volumes back to their 
original device IDs without having to possibly reboot over 500 Linux 
clients to clear the issue.  My first attempt was to use

    lvchange -My --major ### --minor ###

on my volumes. On the first volume in vg1 I did

    lvchange -My --major 253 --minor 1

and on the second I did the same with minor of 2, and so on.  Then in
vg2 I decided the easiest thing was give it a different major, so
on its first volume I did:

    lvchange -My  --major 254 --minor 1

and so on on the other five volumes in vg2.  Then reboot.  And discovered 
that my first five volumes in vg1 refused to mount complaining another
volume was already using its major/minor numbers.

Doing a 'lvdisplay -v' on the first volume in vg2, I could see it was
still using major 253 despite having given it major 254 above.  In
fact the lvdisplay showed inconsistent data like this:

   Persistent major       254
   Persistent minor       1
   Block device           253:101

QUESTION 2: I then saw in the mail post above that kernel 2.6 ignores
the major number given.  But the lvchange command insisted that I give
it anyway giving me the illusion that it mattered.  So I think this
is a bug in lvchange that should be fixed.  But is the major number
something that could still be in flux and someday I find all my
volumes have changed device number again due to the device mapper giving
all LVM volumes sam random new major?

So I ending up going to scheme where on vg2 volumes I still use major 253 
and start the minor numbers at 100+<volnum> so the first volume on vg2 has 
minor 101.  This finally seemed to work okay after reboot (assuming
the major number is never going to change).

QUESTION 3: So it seems as standard practice on using lvcreate from now on 
I need to -My to prevent these problems.  Is this what everyone else is 
doing?

QUESTION 4: I have several other severs configured just like the one above. 
And on one I know have created new volumes on the 2nd volume group and have 
not rebooted it since.  I am now afraid to do so and I am trying to figure 
out what I can do.  Can I do 'lvdisplay' on each live, NFS exported volume 
to get its current major:minor and then run 'lvchange -My' on it also live 
to set it to persistant?  Or will it have to be offline?


-- 
---------------------------------------------------------------
Paul Raines                email: raines at nmr.mgh.harvard.edu
MGH/MIT/HMS Athinoula A. Martinos Center for Biomedical Imaging
149 (2301) 13th Street     Charlestown, MA 02129	    USA
