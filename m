Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9SNMKVm031073
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 19:22:20 -0400
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9SNM03U021145
	for <linux-lvm@redhat.com>; Wed, 28 Oct 2009 19:22:01 -0400
Subject: Re: [linux-lvm] Removing a very old physical drive - revisited
From: Nicholas Robinson <npr@bottlehall.co.uk>
In-Reply-To: <20091028160747.GB11257@us.ibm.com>
References: <1256664432.6383.15.camel@elm.bottlehall.co.uk>
	<20091028012931.GA27808@us.ibm.com>
	<1256714228.2246.15.camel@elm.bottlehall.co.uk>
	<20091028160747.GB11257@us.ibm.com>
Date: Wed, 28 Oct 2009 23:21:59 +0000
Message-Id: <1256772119.8660.2.camel@elm.bottlehall.co.uk>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


i haven't had any replies from dm-devel mailing list so I tried pvmove
onto my external usb drive - i.e.

pvmove /dev/sdb2 /dev/sdc3

It is working so far! So, the device-mapper error must refer
to /dev/sda2 rather than the source disc as I'd assumed. I'm not sure
where this will leave me. My guess is that trying to pvmove from the usb
drive to the new disc will give the same error.

I don't really want the usb drive hanging off the front of my server,
but it will be nice to get rid of the old disc. Maybe I'll just have to
buy a new disc.

Nick

On Wed, 2009-10-28 at 09:07 -0700, malahal@us.ibm.com wrote:
> Nicholas Robinson [npr@bottlehall.co.uk] wrote:
> > Hi Malahal
> > 
> > Thanks for your reply. I don't really want to use the new/temporary disc
> > long-term, it seems that pvmove needs space to create a mirror-lv whilst
> > it is working and it seemed possible that the original problem was that
> > this extra space wasn't there.
> 
> As far as I know, you don't need extra space. The temporary mirror is
> created to copy the data. I believe, it creates a corelog mirror and
> should NOT need extra space. Let us hope someone responds from the
> dm-devel list!
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
