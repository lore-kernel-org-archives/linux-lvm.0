Date: Tue, 30 Jun 2009 14:17:51 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] S.I. and consistent units
Message-ID: <20090630131751.GC20848@agk-dp.fab.redhat.com>
References: <4A46366C.2000607@impulze.org> <4A47F129.7040701@impulze.org>
	<20090629055011.GA14031@maude.comedia.it>
	<4A48880E.3060703@impulze.org>
	<20090630111832.GB20848@agk-dp.fab.redhat.com>
	<4A49FF86.50902@impulze.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A49FF86.50902@impulze.org>
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
To: Daniel Mierswa <impulze@impulze.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jun 30, 2009 at 02:05:26PM +0200, Daniel Mierswa wrote:
> Agreed. I was just initially wondering if there is any kind of interest
> in that separation at all. What exactly do you want me to identify now?
> Do you want me to document the source where functional changes happen,
> write a summary and attach it to the source or mail? I'm not aware of my
> task for this. :P
 
Identify functional changes and mention in email is simplest - the concern is
that existing scripts people have could behave differently, so we have to know
precisely what changes we are making, assess the impact, and if we decide to
proceed nevertheless, we have to document what people need to look for and
change in their scripts.

Alasdair
