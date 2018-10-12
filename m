Date: Fri, 12 Oct 2018 09:21:07 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181012142107.GA22320@redhat.com>
References: <CABZYMH5DD8LFKNeFoWuk+8ZOAwyqWG5pVYAGYFtv4hjZ-Dyu5A@mail.gmail.com>
	<20181010190857.GB10633@redhat.com>
	<CABZYMH7MCecO37Fav-6GH=vWzcR56XG3T0Gx4heRWR8k1QtcOQ@mail.gmail.com>
	<20181011155504.GA17418@redhat.com>
	<20181011185816.GB17418@redhat.com>
	<CABZYMH4+6HiCPGROZoBHhraB0wfX5UQYJNZRZ4RjROfLDkZMxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH4+6HiCPGROZoBHhraB0wfX5UQYJNZRZ4RjROfLDkZMxQ@mail.gmail.com>
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
To: Damon Wang <damon.devops@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Oct 12, 2018 at 04:58:45PM +0800, Damon Wang wrote:
> 1. Is this bug easy to repeat (seems need lease owner committed by a
> host is not the lease leader)?

It will happen occasionally, depending entirely on timing, when there are
commands running concurrently on different hosts that need the same lock.

> 2. I find the commit 6501351b742 introduced bug is released with
> 3.6.0, if I want to fix it, which is recommend, make a master build or
> downgrade to 3.5.0?

I suggest applying the patch onto 3.6.0.

Dave
