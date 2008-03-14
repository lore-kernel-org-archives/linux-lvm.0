Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2EHlRat007498
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2008 13:47:27 -0400
Received: from destar.net (88.183.dowl.anc.borealisbroadband.net
	[12.17.183.88])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m2EHkYrk004789
	for <linux-lvm@redhat.com>; Fri, 14 Mar 2008 13:46:34 -0400
Message-ID: <20080314094627.u7n1h6k4qskgcsw8@www.destar.net>
Date: Fri, 14 Mar 2008 09:46:27 -0800
From: jonr@destar.net
Subject: Re: [linux-lvm] Duplicate VG
References: <20080313170928.p624q5xqo844kc0w@www.destar.net>
	<20080314013838.GB1788@agk.fab.redhat.com>
In-Reply-To: <20080314013838.GB1788@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: linux-lvm@redhat.com

Quoting Alasdair G Kergon <agk@redhat.com>:

> As long as you're not using an old version of lvm2, use vgrename
> with the uuid before a normal vgremove.
>
> Alasdair
> --
> agk@redhat.com

Worked perfectly!

Thanks Alasdair!

Jon
