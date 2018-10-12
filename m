MIME-Version: 1.0
References: <CABZYMH5DD8LFKNeFoWuk+8ZOAwyqWG5pVYAGYFtv4hjZ-Dyu5A@mail.gmail.com>
	<20181010190857.GB10633@redhat.com>
	<CABZYMH7MCecO37Fav-6GH=vWzcR56XG3T0Gx4heRWR8k1QtcOQ@mail.gmail.com>
	<20181011155504.GA17418@redhat.com> <20181011185816.GB17418@redhat.com>
In-Reply-To: <20181011185816.GB17418@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Fri, 12 Oct 2018 16:58:45 +0800
Message-ID: <CABZYMH4+6HiCPGROZoBHhraB0wfX5UQYJNZRZ4RjROfLDkZMxQ@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] lvm command hung with sanlock log
 "ballot 3 abort1 larger lver in bk..."
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
Content-Transfer-Encoding: 7bit
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Thanks for your mail, I read the patch and have some questions:

1. Is this bug easy to repeat (seems need lease owner committed by a
host is not the lease leader)?

2. I find the commit 6501351b742 introduced bug is released with
3.6.0, if I want to fix it, which is recommend, make a master build or
downgrade to 3.5.0?

Thanks again,
Damon
On Fri, Oct 12, 2018 at 2:58 AM David Teigland <teigland@redhat.com> wrote:
>
> > >  2018-10-09 20:49:16 4854717 [29802]: r2320 write_host_block host_id
> > >  19 flags 1 gen 1 dblock 29802:510:140245418403952:140245440585933:140245418403840:4:RELEASED.
> >
> > Perfect, that shows exactly where the bug is.  There's a case where it has
> > missed saving the latest dblock values, so random values are being copied
> > back to the dblock instead.  I'll push out a patch once I've had a chance
> > to test it.
>
> Here's the fix:
> https://www.pagure.io/sanlock/c/1471e241a33abc1f0774ce7ec418a134b655f9ac?branch=master
>
> Thanks for the help finding that.
> Dave
