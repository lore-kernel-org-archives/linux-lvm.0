Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2MJcEj03348
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 14:38:20 -0500
Received: from bucket.localnet (i125-043.nv.iinet.net.au [203.59.125.43])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2MJc1WA011207
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 14:38:08 -0500
Subject: Re: [linux-lvm] lvm or lvm2?
From: Craig Ringer <craig@postnewspapers.com.au>
In-Reply-To: <20040322192910.GA10671@oddprocess.org>
References: <20040322192910.GA10671@oddprocess.org>
Message-Id: <1079984217.4449.6.camel@albert.localnet>
Mime-Version: 1.0
Date: Tue, 23 Mar 2004 03:36:57 +0800
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
To: matt@oddprocess.org, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2004-03-23 at 03:29, Matthew Daubenspeck wrote:

> Do you think using LVM is a reliable method of sharing home directories?
> I have been reading the lists, and I notice that in a lot of cases, if
> one drive dies, you usually lose a lot of information.

That's why you should really only use it on top of redundant storage
like RAID 1 or RAID 5, or in situations where you can afford the risk of
data loss (scratch volumes, hot archives, etc). 

I guess that by its self, LVM could be seen as having many of the same
issues as RAID-0 in terms of data safety - but you're more likely to be
able to do partial recovery with LVM.

I run LVM on a RAID 1 array and a large RAID 5 array, and while I've had
disk failures, I've never suffered any data loss because the layer below
LVM is properly redundant.

Craig Ringer
