Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m1DCFUK7027791
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 07:15:30 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JPGWQ-0005MH-Nt
	for linux-lvm@redhat.com; Wed, 13 Feb 2008 12:15:30 +0000
Date: Wed, 13 Feb 2008 12:15:30 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 tools lvmcmdline.c major and minor number limits
Message-ID: <20080213121530.GQ29914@agk.fab.redhat.com>
References: <1202900520.4345.115.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1202900520.4345.115.camel@localhost.localdomain>
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

On Wed, Feb 13, 2008 at 11:02:00AM +0000, Darren Lavender wrote:
> I was wondering whether there was any particular reason why the
> limitations below are still present given that these were changed
> between 2.4 and 2.6 linux kernels?
 
Yes, it's probably time we changed that - nobody's noticed it before.
We just have to check the code copes OK if someone sets it to a large number
then reboots with a kernel that doesn't support it.

Setting the major number at device creation time is *still* not supported in
2.6.  (2.4 does support it.)

Alasdair
-- 
agk@redhat.com
