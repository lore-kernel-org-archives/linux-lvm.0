Return-Path: <bill@mbsmm.com>
Message-ID: <3AA65DD7.B1256051@mbsmm.com>
Date: Wed, 07 Mar 2001 11:12:07 -0500
From: Bill Clark <bill@mbsmm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] EXT2-fs panic (device lvm(58,0)):
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

Not sure if this is a LVM problem or a ext2fs problem. It is happening
with the 2.4.2 kernel and the 0.9 release of the LVM user tools.  

kernel: Kernel panic: EXT2-fs panic (device lvm(58,0)):
load_block_bitmap: block_group >= groups_count - block_group = 131071,
groups_count = 24

There is a 1gig+ file on the filesystem, and most operations on it seem
to bring about the error.  

Any ideas?

Thanx
Bill
