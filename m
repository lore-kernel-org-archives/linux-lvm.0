Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i822B9305192
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 22:11:09 -0400
Received: from mail5.speakeasy.net (mail5.speakeasy.net [216.254.0.205])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i822Awf8020480
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 22:11:03 -0400
Received: from dsl081-147-030.chi1.dsl.speakeasy.net (HELO
	mozart.theboulets.net) (spboulet@[64.81.147.30])
	(envelope-sender <stephen@theboulets.net>)
	by mail5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 2 Sep 2004 02:10:57 -0000
From: Stephen Boulet <stephen@theboulets.net>
Date: Wed, 1 Sep 2004 21:10:57 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200409012110.57955.stephen@theboulets.net>
Subject: [linux-lvm] Unable to format certain volumes with lvm2 & reiserfs
Reply-To: stephen@theboulets.net,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I created some striped LVM2 volumes and I'm unable to format all but the first 
one.

I did:
<<
pvcreate /dev/sda5
pvcreate /dev/sdb5
vgcreate lvm2 /dev/sda5 /dev/sdb5
lvcreate -i2 -I4 -L100G -nhome lvm2
lvcreate -i2 -I4 -L20G -nusr lvm2
lvcreate -i2 -I4 -L10G -nopt lvm2
lvcreate -i2 -I4 -L10G -nvar lvm2
lvcreate -i2 -I4 -L5G -ntmp lvm2
>>

Now I can do:

mkreiserfs /dev/lvm2/home

but trying the same thing on any of the other groups gives me:

<<
# mkreiserfs -f /dev/lvm2/var
mkreiserfs 3.6.18 (2003 www.namesys.com)

[snip]

Guessing about desired format.. Kernel 2.6.9-rc1 is running.
reiserfs_create_journal: cannot create a journal of 8193 blocks with 18 offset 
on 4096 blocks
>>

However, ext3 works:

<<
# mke2fs -j /dev/lvm2/opt
mke2fs 1.35 (28-Feb-2004)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
4096 inodes, 16384 blocks
819 blocks (5.00%) reserved for the super user
First data block=1
2 block groups
8192 blocks per group, 8192 fragments per group
2048 inodes per group
Superblock backups stored on blocks:
        8193

Writing inode tables: done
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 27 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
>>

Did I do something wrong with the initial setup?

-- 

Stephen      

If your desktop gets out of control easily,
you probably have too much stuff on it that
doesn't need to be there.
         Donna Smallin, "Unclutter Your Home"
