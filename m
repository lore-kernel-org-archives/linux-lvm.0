Date: Thu, 10 Nov 2005 15:52:47 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20051110155247.GH26394@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] New LVM2/device-mapper development tarballs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm-devel@redhat.com, linux-lvm@redhat.com

I have just created new tarballs from CVS for testing
purposes:

  ftp://sources.redhat.com/pub/dm/device-mapper.1.02.00.tgz
  ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.00.tgz

There are some significant extensions to libdevmapper and 
the code that activates logical volumes has been rewritten
to prepare for kernel patches to fix snapshot activation.
The new code will also make it possible to support more
complex device hierarchies in the future, such as snapshots 
of mirrors.

So far I've done some basic testing, but I expect there
are still plenty more bugs to be found: If you find any,
please report them to one of these lists!

(Note that you'll need to install the new device-mapper package
before the new LVM2 one.)

Alasdair
-- 
agk@redhat.com
