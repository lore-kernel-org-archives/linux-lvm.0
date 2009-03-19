Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2J9LY36016841
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 05:21:34 -0400
Received: from s1.echoreply.us (s1.echoreply.us [216.146.143.192])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2J9LHBl019751
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 05:21:17 -0400
Subject: Re: [linux-lvm] fsync() and LVM
From: Tim Post <echo@echoreply.us>
In-Reply-To: <1237304003.8159.3.camel@jd-laptop.pragmaticzealot.org>
References: <49BA9BF9.3070507@esiway.net>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net>
	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
	<49BE9F73.8050109@gmail.com>
	<87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>
	<49BEB683.7020209@gmail.com>
	<87f94c370903161354v2e43f13ci914f45175ca6af6f@mail.gmail.com>
	<49BEC1CC.5050900@gmail.com>
	<87f94c370903161436y40eddb3pe162bfa64a90e371@mail.gmail.com>
	<49BECA5A.3040407@gmail.com>
	<1237243887.29552.43.camel@jd-laptop.pragmaticzealot.org>
	<1237304003.8159.3.camel@jd-laptop.pragmaticzealot.org>
Date: Thu, 19 Mar 2009 17:20:58 +0800
Message-Id: <1237454458.19345.157.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: echo@echoreply.us,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: jd@commandprompt.com, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2009-03-17 at 08:33 -0700, Joshua D. Drake wrote:
> On Mon, 2009-03-16 at 15:51 -0700, Joshua D. Drake wrote:
> > On Mon, 2009-03-16 at 16:53 -0500, Les Mikesell wrote:
> > 
> > > The point of fsync() is for an application to know that a write has been 
> > > safely committed, as for example sendmail would do before acknowledging 
> > > to the sender that a message has been accepted.  The question isn't 
> > > whether an application can call fsync() but rather whether it's return 
> > > status is lying, making the underlying storage unsuitable for anything 
> > > that needs reliability.
> > 
> > Right and for databases this is critical. So enlightenment here would be
> > good.
> 
> Anyone?
> 
> Joshua D. Drake

If a logical volume spans physical devices where write caching is
enabled, the results of fsync() can not be trusted. This is an issue
with device mapper, lvm is one of a few possible customers of DM.

Now it gets interesting:

Enter virtualization. When you have something like this:

fsync -> guest block device -> block tap driver -> CLVM -> iscsi ->
storage -> physical disk.

Even if device mapper passed along the write barrier, would it be
reliable? Is every part of that chain going to pass the same along, and
how many opportunities for re-ordering are presented in the above?

So, even if its fixed in DM, can fsync() still be trusted? I think, at
the least, more testing should be done with various configurations even
after a suitable patch to DM is merged. What about PGSQL users using
some kind of elastic hosting?

Given the craze in 'cloud' technology, its an important question to ask
(and research). 


Cheers,
--Tim
