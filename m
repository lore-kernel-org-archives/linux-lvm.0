Return-Path: <mkp@mkp.net>
Subject: Re: [linux-lvm] LVM-0.9.1beta6, XFS and 2.4.2 ...
References: <008b01c0b293$2873fac0$0e01a8c0@myplace.net>
	<yq1lmpyrgcb.fsf@jaguar.mkp.net> <20010327090706.B556@tykepenguin.com>
From: "Martin K. Petersen" <mkp@linuxcare.com>
Date: 27 Mar 2001 09:51:44 -0500
In-Reply-To: <20010327090706.B556@tykepenguin.com>
Message-ID: <yq1d7b3mfi7.fsf@jaguar.mkp.net>
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Patrick Caulfield <caulfield@sistina.com>
Cc: linux-lvm@sistina.com

>>>>> "Patrick" == Patrick Caulfield <caulfield@sistina.com> writes:

Bas> Mar 21 20:22:40 wisdom kernel: lvm -- lvm_blk_ioctl: unknown
Bas> command 0x126e

Patrick> Yes XFS does that - it has some private ioctls it likes to do
Patrick> on the block device that aren't implemented in LVM. Ignore
Patrick> it.

Oh, they are indeed in LVM.  Bas' problem was a kernel/userland
mismatch.  I recently had to move our ioctl numbers to avoid conflicts
with IA64.

-- 
Martin K. Petersen, Principal Linux Consultant, Linuxcare, Inc.
mkp@linuxcare.com, http://www.linuxcare.com/
SGI XFS for Linux Developer, http://oss.sgi.com/projects/xfs/
