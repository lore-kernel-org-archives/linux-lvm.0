Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAK1f1r11572
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 20:41:01 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAK1etMn011978
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 20:41:01 -0500
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20041120003322.GE10969@nile.gs.washington.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
	<1100909625.4379.51.camel@tesuji.nac.uci.edu>
	<20041120003322.GE10969@nile.gs.washington.edu>
Date: Fri, 19 Nov 2004 17:40:51 -0800
Message-Id: <1100914852.4379.79.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2004-11-19 at 16:33 -0800, David S. wrote:
> > Does PVFS2 have posix semantics these days?
> 
> It has a kernel interface, so it supports the familiar open(2), lseek(2),
> read(2), write(2), ... calls.  It doesn't provide POSIX semantics.

What's different then?  Are stat and friends still there and non-
neutered?  Or are we talking more along the lines of just minor things
(to my current application) like sync/fsync differences?

> > 
> > My understanding is that IBM will only support GPFS on IBM hardware...
> > 
> 
> Our SAN is from IBM, and our servers and most of our clients are 
> IBM-branded commodity x86 hardware.  IBM will support GPFS on non-IBM 
> commodity hardware if you pay it enough.  But you'd have to really
> enjoy pain to pay for GPFS.

Why is GPFS painful?  Do you have an order-of-magnitude guesstimate of
how much you'd have to pay IBM to support GPFS on non-IBM hardware?

Thanks!
