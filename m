Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m1DErdrM021222
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 09:53:39 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JPIzT-0005Rn-5S
	for linux-lvm@redhat.com; Wed, 13 Feb 2008 14:53:39 +0000
Date: Wed, 13 Feb 2008 14:53:39 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 tools lvmcmdline.c major and minor number limits
Message-ID: <20080213145338.GS29914@agk.fab.redhat.com>
References: <1202900520.4345.115.camel@localhost.localdomain>
	<20080213121530.GQ29914@agk.fab.redhat.com>
	<1202909763.4345.129.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1202909763.4345.129.camel@localhost.localdomain>
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

On Wed, Feb 13, 2008 at 01:36:03PM +0000, Darren Lavender wrote:
> I think the interest is _only_ in the minor number but I noticed that I
> had to specify --major at the command line or I received an error:
 
The validation probably broke at some stage.  One day someone might port the
multiple major number support from 2.4 to 2.6, but there doesn't seem to be any
demand for it.

Alasdair
-- 
agk@redhat.com
