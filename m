Return-Path: <lda@winux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14995.16871.694699.166774@nv.winux.com>
Date: Tue, 20 Feb 2001 23:19:51 -0500
From: lvm@winux.com
In-Reply-To: <20010220224907.D21281@srv.sistina.com>
References: <20010220224907.D21281@srv.sistina.com>
From: lvm@winux.com
Subject: [linux-lvm] snapshot of Reiserfs
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

Heinz J. Mauelshagen writes:
> ... Linux Logical Volume Manager 0.9.1 Beta 5 is available now ...
> ...
> Please help us to stabilize for 0.9.1 ASAP and test is as much as possible!

I am using LVM 0.9.1 beta 5 on Linux 2.4.1 with Reiserfs.
I have applied both of the following patches:

0.9.1_beta5/PATCHES/lvm-0.9.1_beta5-2.4.1.patch
0.9.1_beta5/PATCHES/linux-2.4.1-VFS-lock.patch

Snapshots created when the filesystem is active cannot be mounted.
If I `umount' the filesystem before creating the snapshot, all is well.

Larry
