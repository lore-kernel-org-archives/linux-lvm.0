Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6AFAhB1021632
	for <linux-lvm@redhat.com>; Thu, 10 Jul 2008 11:10:43 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m6AFAhj2012248
	for <linux-lvm@redhat.com>; Thu, 10 Jul 2008 11:10:43 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1KGxn9-0000bM-4k
	for linux-lvm@redhat.com; Thu, 10 Jul 2008 16:10:43 +0100
Date: Thu, 10 Jul 2008 16:10:43 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgscan problem: Snapshot and origin LVs must differ.
Message-ID: <20080710151043.GZ22522@agk.fab.redhat.com>
References: <002301c8e29e$cca45110$ae00a8c0@ferroamd64>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002301c8e29e$cca45110$ae00a8c0@ferroamd64>
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

On Thu, Jul 10, 2008 at 05:08:24PM +0200, Alessandro Ferrari wrote:
> I tell you my LVM story....
> I have add LVM1 capability to my linux box kernel 2.4.36.5.
 
> Now I can't mount /dev/VOLHOME/HOMELV and "vgscan -v" write this messages:
>     /dev/sdb1: size is 3906204687 sectors

That's output from lvm2 - but you say your kernel only has lvm1 in it.
You can't mix and match them like that: work out what you meant to
run - lvm1 or lvm2.

Alasdair
-- 
agk@redhat.com
