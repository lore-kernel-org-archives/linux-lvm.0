Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C593C308BDA4
	for <linux-lvm@redhat.com>; Fri, 25 May 2018 07:46:00 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9ADF30C9421
	for <linux-lvm@redhat.com>; Fri, 25 May 2018 07:45:58 +0000 (UTC)
Message-Id: <5B07BF2B020000F90001E5BB@prv1-mh.provo.novell.com>
Date: Fri, 25 May 2018 01:45:47 -0600
From: "Gang He" <ghe@suse.com>
References: <20180525070342.g247jatvm6dskehy@reti>
In-Reply-To: <20180525070342.g247jatvm6dskehy@reti>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [RELEASE] 2.02.178
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
To: linux-lvm@redhat.com

Hello Joe,

When will the formal LVM 2.02.178 be released?
In LVM2.02.178, online pvmove can work well under the cluster environment?

Thanks
Gang 

>>> Joe Thornber <thornber@redhat.com> 2018/5/25 15:03 >>>
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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com 
https://www.redhat.com/mailman/listinfo/linux-lvm 
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
