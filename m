Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Date: Sat, 28 Apr 2001 10:38:53 -0400
MIME-Version: 1.0
Message-Id: <01042810385300.12469@oscar>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] VFS locking patch fails on 2.4.4
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
Cc: Chris Mason <mason@suse.com>

Hi,

The VFS locking patch fails on 2.4.4

oscar% cat ../LVM/linux-2.4.2-VFS-lock.patch | patch -p1
patching file drivers/md/lvm.c
Hunk #1 succeeded at 207 with fuzz 1 (offset 48 lines).
patching file fs/buffer.c
Hunk #1 succeeded at 331 (offset 17 lines).
patching file fs/super.c
patching file include/linux/fs.h
Hunk #1 FAILED at 1093.
1 out of 1 hunk FAILED -- saving rejects to file include/linux/fs.h.rej
patching file kernel/ksyms.c
Hunk #1 succeeded at 177 (offset 2 lines).

This worked with 2.4.4-pre8.  This is not too important (yet) since 
reiserfs snapshots also have problems.  They do not work with pre8.
I get the same messages as previously reported (using debian sid).

I know the lvm is going thru a major paradyne shift but hope to be
able to snapshot my reiserfs partn again soon.

TIA
Ed Tomlinson <tomlins@cam.org>
