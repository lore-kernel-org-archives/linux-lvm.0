Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i88Npa313151
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2004 19:51:36 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.207])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i88NpZS0016340
	for <linux-lvm@redhat.com>; Wed, 8 Sep 2004 19:51:36 -0400
Received: by mproxy.gmail.com with SMTP id 73so384087rnk
	for <linux-lvm@redhat.com>; Wed, 08 Sep 2004 16:51:24 -0700 (PDT)
Message-ID: <ce9f1f9e040908165111eff27f@mail.gmail.com>
Date: Wed, 8 Sep 2004 16:51:20 -0700
From: Stanley Yue <stanley.yue@gmail.com>
Subject: Re: [linux-lvm] Resend: API for retrieving linux lvm information
In-Reply-To: <20040908093518.GC1094@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <ce9f1f9e04090623046460fed8@mail.gmail.com>
	<20040907094413.GA6264@agk.surrey.redhat.com>
	<ce9f1f9e04090718394fa17cde@mail.gmail.com>
	<20040908093518.GC1094@agk.surrey.redhat.com>
Reply-To: Stanley Yue <stanley.yue@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Stanley Yue <stanley.yue@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Thanks, Alasdair.

I'll indeed look into using LVM2.

I'm using Redhat AS 3.0. 

Will the lvm2 rpm from Fedora Core work?
When will lvm2 be officially part of Redhat Enterprise Linux?
How can i upgrade from an LVM1 system to LVM2? Is it just a matter of
upgrading the rpm?

Thanks,

Stanley


On Wed, 8 Sep 2004 10:35:18 +0100, Alasdair G Kergon <agk@redhat.com> wrote:
> On Tue, Sep 07, 2004 at 06:39:24PM -0700, Stanley Yue wrote:
> > As far as the parsing goes, is it better (in terms of compatibility,
> > output stability) to parse against the command line output (i.e.
> > lvdisplay) or against the /proc/filesystems (i.e.
> > /proc/lvm/VGs/vg00/LVs)?
>  
> My answer was for LVM2.
> Looks like you're using LVM1.
> To simplify your future upgrade you should consider using LVM2 tools
> lvs/pvs/vgs read-only even on an LVM1 installation as their output is
> designed to be easy to parse.
> 
> Alasdair
> --
> agk@redhat.com
>
