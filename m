Received: from localhost (unknown [10.33.36.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C14402026DEF
	for <linux-lvm@redhat.com>; Fri, 25 May 2018 07:03:43 +0000 (UTC)
Date: Fri, 25 May 2018 08:03:43 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20180525070342.g247jatvm6dskehy@reti>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [RELEASE] 2.02.178
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.178-rc1.tgz


Version 2.02.178
================

There are going to be some large changes to the lvm2 codebase
over the next year or so.  Starting with this release.  These
changes should be internal rather than having a big effect on
the command line.  Inevitably these changes will increase the
chance of bugs, so please be on the alert.


Remove support for obsolete metadata formats
--------------------------------------------

Support for the GFS pool format, and format used by the
original 1990's version of LVM1 have been removed.

Use asynchronous IO
-------------------

Almost all IO uses libaio now.

Rewrite label scanning
----------------------

Dave Teigland has reworked the label scanning and metadata reading
logic to minimise the amount of IOs issued.  Combined with the aio changes 
this can greatly improve scanning speed for some systems.

./configure options
-------------------

We're going to try and remove as many options from ./configure as we
can.  Each option multiplies the number of possible configurations
that we should test (this testing is currently not occurring).

The first batch to be removed are:

  --enable-testing
  --with-snapshots
  --with-mirrors
  --with-raid
  --with-thin
  --with-cache

Stable targets that are in the upstream kernel will just be supported.

In future optional target flags will be given in two situations:

1) The target is experimental, or not upstream at all (eg, vdo).
2) The target is deprecated and support will be removed at some future date.

This decision could well be contentious, so could distro maintainers feel
free to comment.
