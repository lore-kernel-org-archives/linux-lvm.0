Message-Id: <20020130202254.A7364@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <thornber@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] [ANNOUNCE] LVM reimplementation ready for beta testing
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
Date: Wed Jan 30 14:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-lvm@sistina.com, lvm-devel@sistina.com

All,

Sistina is pleased to announce that the LVM2 software is ready for
beta testing.

This is a complete reimplementation of the existing LVM system, both
driver and userland tools.

We encourage you to give it a try and feed back your test results,
bug-fixes, enhancement requests etc. through the normal lists
linux-lvm@sistina.com and lvm-devel@sistina.com.

The new kernel driver (known as "device-mapper") supports volume
management in general and is no longer Linux LVM specific.
As such it is a separate package from LVM2 which you will need
to download and install before building LVM2.

 ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-beta1.tgz


The userland tools are available from here:

 ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-beta1.tgz


This release does not support snapshots or pvmove.  These features
will go into a subsequent beta release, hopefully within the next
fortnight.

This is Beta software which is *not* meant to be running on your
production systems.  If necessary, keep backups of your data and LVM
metadata (/etc/lvmconf/*).


We look forward to your feedback.


The Sistina LVM team:

      Patrick Caulfield,
      Alasdair Kergon,
      Heinz Mauelshagen,
      Joe Thornber
