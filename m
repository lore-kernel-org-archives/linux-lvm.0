Return-Path: <defranco@cup.hp.com>
Message-ID: <3A247D53.E3B78F60@cup.hp.com>
Date: Tue, 28 Nov 2000 19:51:47 -0800
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Old problem cropping up again with 0.9 lvm tools?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I'm having a problem doing a pvcreate on a raid
device. It fails with:

[root@ham 0.9]# pvcreate -v /dev/md0
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/md0"
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- invalid partition type 0x83 for "/dev/md0" (must
be 0x8e)

I had this problem with the 0.8final but was pointed to
a suse lvm user tools rpm (lvm-0.8-70-i386.rpm) that worked
great. 

Now with the 0.9 tools the issue is here again. Is there
a fix for this (since I don't think I should use the
0.8 suse tools with 0.9 lvm)?

Thanks.
-- 
==========
Cheers
   -jdf
