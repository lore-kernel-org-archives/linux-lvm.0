Return-Path: <seawolf@attglobal.net>
Message-ID: <3AA41583.36E1CDE2@attglobal.net>
Date: Mon, 05 Mar 2001 17:38:59 -0500
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to install/update on an existing system with reiserfs/lvm
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
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

I am currently running Mandrake 7.2 with a 2.4.2 kernel and the
lvm-0.9.1-beta5 patch. 

The system has one vg and several lv each containing a reiserfs
filesystem.  The only part of the system not reiserfs/lvm is /boot which
is on a small primary partition using ext2fs.

The system is running quite well and I am very pleased with the current
configuration. The problem I have, or will have, is related to a desire
to migrate to Mandrake 8.0 when the final version is released.

I don't expect to be able to boot directly from the CD and have my
filesystems recognized.  I think I will need to build an install/boot
disk with a replaced kernel that has support for reiserfs/lvm.

The problem is, I don't know how to build a boot disk with a replaced
kernel.  Can anyone help me with this?  I would appreciate any pointers
to how-to, web page or ... that explains the required steps.
-- 

Good Journey, longevity and prosperity to all

Les Hazelton
