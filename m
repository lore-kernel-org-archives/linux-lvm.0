Message-Id: <200111300514.fAU5EvE17808@demai05.mw.mediaone.net>
From: Brian <hiryuu@envisiongames.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Linux 2.4.16+SMP+Ext3+LVM snapshots
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
Date: Thu Nov 29 23:13:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

So I'm building a file server with a 3ware raid card (6800, maybe replaced 
with a 7800).

This is a dual-1.2 Athlon running 2.4.16 with LVM sitting below our ~700GB 
ext3 data partition.  At first, we used the lvm support included in the 
kernel.

After some copying, I tested
	lvcreate -s -l 200 -n test1 /dev/vol0/cobra
The snapshot was corrupt.  Known problem.  Fair enough.

So I grabbed lvm 1.0.1 (released a couple days ago).  I patched the kernel 
with the new lvm and the VFS-lock patch for 2.4.11.  There were quite a 
few offsets, but it otherwise applied cleanly.

I started a big cp off an NFS mount and ran
	lvcreate -s -l 200 -n test1 /dev/vol0/cobra
The cp and lvcreate deadlocked.  Both are frozen in D state and they're 
not coming out.

Snapshots were the big reason for us to use LVM, so this is not good.

Help!
	-- Brian
