Return-Path: <alan@lxorguk.ukuu.org.uk>
Date: Sat, 21 Apr 2001 16:33:41 +0100 (BST)
In-Reply-To: <01042110002200.00707@oscar> from "Ed Tomlinson" at Apr 21, 2001 10:00:22 AM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E14qzOK-0003qE-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [linux-lvm] Re: [BUG] lvm beta7 and ac11 problems
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
To: Ed Tomlinson <tomlins@cam.org>
Cc: linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org, linux-lvm@sistina.com, Alan Cox <alan@lxorguk.ukuu.org.uk>

> building a kernel with 2.4.3-ac11 and lvm beta7 + vfs_locking_patch-2.4.2 yields:
> 
> oscar# depmod -ae 2.4.3-ac11 
> depmod: *** Unresolved symbols in /lib/modules/2.4.3-ac11/kernel/drivers/md/lvm-mod.o
> depmod:         get_hardblocksize
> 
> ideas?

get_hardblock_size has been removed. Take a look at the fs parts of the
ac10->11 diff and you'll see the trivial fixup you need to add
