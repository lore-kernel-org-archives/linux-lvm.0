Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9FCctuA022879
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 13:38:55 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CIRME-0007q3-R6
	for linux-lvm@redhat.com; Fri, 15 Oct 2004 13:38:54 +0100
Date: Fri, 15 Oct 2004 13:38:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] OS X
Message-ID: <20041015123854.GE24242@agk.surrey.redhat.com>
References: <33017.207.218.237.77.1097817474.squirrel@207.218.237.77>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33017.207.218.237.77.1097817474.squirrel@207.218.237.77>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Oct 15, 2004 at 12:17:54AM -0500, robert@westbaker.net wrote:
> Is there any plans, projects, ideas for porting LVM to Mac OSX.  If there
> are technical issues preventing LVM from working on OSX, could you give me
> some pointers as to why?
 
No plans that I'm aware of.

It's device-mapper that needs porting: LVM2 userspace code already works.

Alasdair
-- 
agk@redhat.com
