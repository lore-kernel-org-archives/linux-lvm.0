Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBUJHmr25881
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2004 14:17:48 -0500
Received: from mail.davidb.org (adsl-64-172-240-129.dsl.sndg02.pacbell.net
	[64.172.240.129])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBUJHYf6009259
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2004 14:17:42 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.42 #1 (Debian))
	id 1Ck5nd-0001NE-Cm
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2004 11:17:29 -0800
Date: Thu, 30 Dec 2004 11:17:29 -0800
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] Very long startup times of the lv*-tools
Message-ID: <20041230191729.GA5229@old.davidb.org>
References: <200412291742.04569.erik.wasser@iquer.net>
	<20041230191239.GW26670@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041230191239.GW26670@agk.surrey.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Dec 30, 2004 at 07:12:39PM +0000, Alasdair G Kergon wrote:
> On Wed, Dec 29, 2004 at 05:42:04PM +0100, Erik Wasser wrote:
> > I'm using lvm2 2.00.08 on a 'Linux fuzz 2.6.9-gentoo-r13 #1 Wed Dec 29 
> > 10:41:06 CET 2004 i686 AMD Athlon(tm) XP 2800+ AuthenticAMD GNU/Linux'
>  
> > Is there is something known about this issue? What else can I check?
>  
> Upgrade LVM2!
> 
> Anyone know why so many gentoo users find themselves using old 
> versions like that and don't upgrade?
> I don't see this with Debian or Fedora users.

Because the gentoo developers are very timid in marking new versions of
packages as stable.  This philosophy works well for packages that are
mostly stable.  It doesn't work all that well with things that are being
improved rapidly, such as lvm.

Putting the following lines in /etc/portage/package.keywords will cause
gentoo to use the newest versions of these packages:

  sys-libs/device-mapper ~x86
  sys-fs/lvm2 ~x86

Interestingly, the kernel mentioned is rather update on the kernel patches.

Dave
