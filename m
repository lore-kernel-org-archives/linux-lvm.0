Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q27GM8fO003891
	for <linux-lvm@redhat.com>; Wed, 7 Mar 2012 11:22:08 -0500
Received: from exprod7og119.obsmtp.com (exprod7og119.obsmtp.com [64.18.2.16])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q27GM6cS008973
	for <linux-lvm@redhat.com>; Wed, 7 Mar 2012 11:22:07 -0500
Received: by mail-lpp01m010-f46.google.com with SMTP id j13so7452604lah.19
	for <linux-lvm@redhat.com>; Wed, 07 Mar 2012 08:22:05 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 7 Mar 2012 16:22:05 +0000
Message-ID: <CAKxJzGeWwVGOOH8VX08Rk_icG3uBEAvbPjRMSw=41Vt9gY_L1g@mail.gmail.com>
From: Philip Boulain <philip.boulain@smoothwall.net>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Snapshot removal fails first time under RAID
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

We have a Debian Wheezy server using mirrored RAID running kernel
3.2.0-1-amd64 and LVM version�2.02.88-2. There seems to be an issue
where snapshot removal fails due to being "in use" the first time, but
repeating the operation will succeed:

# lvcreate --size 128M --name testvolume buildturbo64
� Logical volume "testvolume" created
# lvcreate --size 128M --snapshot --name testsnap buildturbo64/testvolume
� Logical volume "testsnap" created
# lvremove buildturbo64/testsnap
Do you really want to remove active logical volume testsnap? [y/n]: y
� LV buildturbo64/testsnap in use: not deactivating
� Unable to deactivate logical volume "testsnap"
# lvremove buildturbo64/testsnap
Do you really want to remove active logical volume testsnap? [y/n]: y
� Logical volume "testsnap" successfully removed
# lvremove buildturbo64/testvolume
Do you really want to remove active logical volume testvolume? [y/n]: y
� Logical volume "testvolume" successfully removed

Note that no filesystem is even created here, so it's not mounted or
anything. That volume group has plenty of free extents (vgdisplay
excerpt):

� Alloc PE / Size � � � 52353 / 204.50 GiB
� Free �PE / Size � � � 66794 / 260.91 GiB

This is repeatable every time and waiting arbitrary delays between the
operations makes no difference.�There is no difference if the logical
volume is specified by its device node (/dev/buildturbo64/testsnap).

Under a *non-RAID* Debian Wheezy VM with an otherwise identical
configuration, lvremove works first time, as I'd expect.

Is this a bug, or some form of user error?

Here is the verbose output of the remove steps, if that is helpful:

# lvremove --verbose buildturbo64/testsnap
� � Using logical volume(s) on command line
Do you really want to remove active logical volume testsnap? [y/n]: y
� � Archiving volume group "buildturbo64" metadata (seqno 117).
� � Removing snapshot testsnap
� � Found volume group "buildturbo64"
� � Found volume group "buildturbo64"
� � Loading buildturbo64-testvolume table (254:3)
� � Loading buildturbo64-testsnap table (254:5)
� � Suspending buildturbo64-testvolume (254:3) with device flush
� � Suspending buildturbo64-testsnap (254:5) with device flush
� � Suspending buildturbo64-testvolume-real (254:6) with device flush
� � Suspending buildturbo64-testsnap-cow (254:7) with device flush
� � Found volume group "buildturbo64"
� � Resuming buildturbo64-testsnap-cow (254:7)
� � Resuming buildturbo64-testvolume-real (254:6)
� � Resuming buildturbo64-testsnap (254:5)
� � Removing buildturbo64-testsnap-cow (254:7)
� � Found volume group "buildturbo64"
� � Resuming buildturbo64-testvolume (254:3)
� � Removing buildturbo64-testvolume-real (254:6)
� � Found volume group "buildturbo64"
� LV buildturbo64/testsnap in use: not deactivating
� Unable to deactivate logical volume "testsnap"
# lvremove --verbose buildturbo64/testsnap
� � Using logical volume(s) on command line
Do you really want to remove active logical volume testsnap? [y/n]: y
� � Archiving volume group "buildturbo64" metadata (seqno 118).
� � Found volume group "buildturbo64"
� � Removing buildturbo64-testsnap (254:5)
� � Releasing logical volume "testsnap"
� � Creating volume group backup "/etc/lvm/backup/buildturbo64" (seqno 119).
� Logical volume "testsnap" successfully removed

-- 
Philip Boulain
Developer

philip.boulain@smoothwall.net

Smoothwall Ltd
1 John Charles Way, Leeds, LS12 6QA United Kingdom
Telephone: �USA:�1 800 959 3760��Europe:�+44 (0) 8701 999500
www.smoothwall.net

Smoothwall Limited is registered in England, Company Number: 4298247.
This email and any attachments transmitted with it are confidential to
the intended recipient(s) and may not be communicated to any other
person or published by any means without the permission of Smoothwall
Limited. �Any opinions stated in this message are solely those of the
author.
