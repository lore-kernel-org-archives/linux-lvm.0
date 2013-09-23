Date: Mon, 23 Sep 2013 21:38:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130923203841.GC24022@agk-dp.fab.redhat.com>
References: <51E981EF.3020007@gmail.com> <51E99A85.8060901@redhat.com>
	<51E9BD58.4030301@gmail.com>
	<20130719232052.GB23574@agk-dp.fab.redhat.com>
	<51EDEE5E.4010009@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51EDEE5E.4010009@gmail.com>
Subject: Re: [linux-lvm] pvmove
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
To: Martin Papik <mp6058@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 23, 2013 at 05:45:50AM +0300, Martin Papik wrote:
> Thank you. Is that patch going to be added to the main source code base?

Committed for 2.02.103.

> I think I found an error (segfault), see below.

>   LVM version:     2.02.66(2) (2010-05-20)

I've no interest in bugs reported against such an old version of the code, I'm
afraid.  If you reproduce with upstream code, then we'll look into it.

Alasdair
