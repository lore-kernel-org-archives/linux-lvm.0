Message-Id: <20020424153354.GA627@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] LVM2 beta2
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
Date: Wed Apr 24 10:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, lvm-devel@sistina.com

There are tarballs available for the second beta test of LVM2.

  ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-beta2.0.tgz
  ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-beta2.0.tgz

The main new addition to the release is that we have begun merging in
the asynchronous snapshot code.  This code tries to minimise the time
taken to perform the copy on write operation.  In addition it has
identical performance at all snapshot chunk sizes, unlike LVM1 and
EVMS whose performance degrades exponentially as the chunk size
decreases.

The default snapshot chunk size for LVM2 has now dropped to 16k, it
may be reduced further depending on test results.

Please not that although snapshots are available in this release they
are currently non-persistent, ie. the snapshot will be lost if you
deactivate it, or reboot the machine.  Persistent snapshots will
follow shortly.

- Joe
