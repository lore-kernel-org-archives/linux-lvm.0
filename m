Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Date: Sat, 21 Apr 2001 10:00:22 -0400
MIME-Version: 1.0
Message-Id: <01042110002200.00707@oscar>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [BUG] lvm beta7 and ac11 problems
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
To: linux-kernel@vger.kernel.org
Cc: linux-openlvm@nl.linux.org, linux-lvm@sistina.com, Alan Cox <alan@lxorguk.ukuu.org.uk>

Hi,

building a kernel with 2.4.3-ac11 and lvm beta7 + vfs_locking_patch-2.4.2 yields:

oscar# depmod -ae 2.4.3-ac11 
depmod: *** Unresolved symbols in /lib/modules/2.4.3-ac11/kernel/drivers/md/lvm-mod.o
depmod:         get_hardblocksize

ideas?

Ed Tomlinson
