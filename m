Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iAJEQfiX019007
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 14:26:41 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CV9ij-0006y6-O3
	for linux-lvm@redhat.com; Fri, 19 Nov 2004 14:26:41 +0000
Date: Fri, 19 Nov 2004 14:26:41 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove can not hanlde snapshot related?
Message-ID: <20041119142641.GS24229@agk.surrey.redhat.com>
References: <1100834366.2996.136.camel@localhost.localdomain>
	<200411191028.52266.aben@webcom.sk>
	<1100872882.2984.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1100872882.2984.1.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 19, 2004 at 09:01:23AM -0500, Ming Zhang wrote:
> On Fri, 2004-11-19 at 04:28, Aben Siatris wrote:
> > Dňa Friday 19 November 2004 04:19 Ming Zhang napísal:
> > > is the pvmove not be able to handle the snapshot related lv? any
> > > technical reason for this? thanks.
> > warning! see http://bugs.gentoo.org/show_bug.cgi?id=67802
> ~~~~~~~confused. what is the purpose that you show me this bug? 

That "bug" is unrelated: they simply need to upgrade.


pvmove does not mix with snapshots yet because of the additional
complexity it would involve - code to handle it simply hasn't 
been written yet.


Alasdair
-- 
agk@redhat.com
