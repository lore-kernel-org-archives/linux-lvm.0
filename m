Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 692252166B2B
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2020 21:09:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B20938007AC
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2020 21:09:31 +0000 (UTC)
Date: Fri, 27 Mar 2020 16:52:25 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20200327205225.GK7435@bdmcc-us.com>
References: <20200326233144.GM17504@agk-dp.fab.redhat.com>
	<20200327195006.GE6382@bdmcc-us.com>
	<20200327205329.GA29554@agk-dp.fab.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200327205329.GA29554@agk-dp.fab.redhat.com>
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] storage-logger: Recording changes to the udev
 database
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
To: dm-devel@redhat.com, linux-lvm@redhat.com

On Fri, Mar 27, 2020 at 08:53:29PM +0000, Alasdair G Kergon wrote:
> On Fri, Mar 27, 2020 at 03:50:06PM -0400, Brian McCullough wrote:
> > In your instructions, you say to put the "working" script in /usr/sbin,
> > while in the udev rule, it is in /sbin/
> 
> In Fedora they are the same.

Ah.  So they are aliases.



> > I tried adding and removing a USB-connected drive, but did not see any
> > response in the journal.  Should I have seen something, or are those not
> > seen?
> 
> You should test the script in isolation in case there are any other 
> differences on Debian.  Change the top line to '...bash -x' so you
> can watch it, set some environment variables (like ACTION=add) and 
> run it directly.


Thank you.  I will do so over the weekend, and report.


> Alasdair


Brian
