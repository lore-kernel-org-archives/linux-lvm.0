Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l26CNW3C030494
	for <linux-lvm@redhat.com>; Tue, 6 Mar 2007 07:23:33 -0500
Received: from homer.panici.net (homer.panici.net [207.234.145.200])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l26CNUHL032031
	for <linux-lvm@redhat.com>; Tue, 6 Mar 2007 07:23:30 -0500
Received: from homer.panici.net (localhost.localdomain [127.0.0.1])
	by homer.panici.net (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l26CNS3I023727
	for <linux-lvm@redhat.com>; Tue, 6 Mar 2007 12:23:29 GMT
Received: (from paddy@localhost)
	by homer.panici.net (8.13.4/8.13.4/Submit) id l26CNSBb023726
	for linux-lvm@redhat.com; Tue, 6 Mar 2007 12:23:28 GMT
Date: Tue, 6 Mar 2007 12:23:28 +0000
From: paddy@panici.net
Subject: Re: [linux-lvm] partition table needed for lvm ?
Message-ID: <20070306122328.GC19733@homer.panici.net>
References: <20070301171425.30ktkd2oroo4cco0@www.mail.yale.edu>
	<20070301231907.GG3319@agk.surrey.redhat.com>
	<20070302140153.GB12744@percy.comedia.it>
	<20070302165837.GB28190@homer.panici.net>
	<20070303114507.GD12744@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070303114507.GD12744@percy.comedia.it>
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
To: linux-lvm@redhat.com

On Sat, Mar 03, 2007 at 12:45:08PM +0100, Luca Berra wrote:
> On Fri, Mar 02, 2007 at 04:58:37PM +0000, paddy@panici.net wrote:
> >On Fri, Mar 02, 2007 at 03:01:53PM +0100, Luca Berra wrote:
> >>On Thu, Mar 01, 2007 at 11:19:07PM +0000, Alasdair G Kergon wrote:
> >>>On Thu, Mar 01, 2007 at 05:14:25PM -0500, Chris Hunter wrote:
> >>>>Do I reallly need to make partition tables on all my disks to use lvm2 ?
> >>>
> >>>Other packages such as the installer like to have them.
> >>
> >>what about the fact that on many storage creating an ms-dos compatible
> >>partition usually results in screwing io alignment?
> >
> >interesting.  
> >
> >Although it comes as no surprise that the CHS boundaries are not aligned
> >with the hardware anymore (like they were back in the days of say MFM),
> >I thought that systems that attempted to use this level of information 
> >about a disk were fairly rare these days ?
> The problem comes from smart storage system which like to do IO with
> big block sizes (usually 32K to 64K) from the beginning of the LUN that
> is presented to the OS.

ah! ok :-)

as you say, this has tended to be less of an issue with boot disks.

> My preference would still be for not having msdos partitions on any drive 
> at all

The question in my mind these days, is "what kinds of failure modes
can/will it exhibit?".

The secret to "optimising failure" seems to be to keep things as simple as
possible.  I think it will depend on what you're doing and exactly how
you are doing it whether one is simpler than the other, but I'd be
especially wary of an approach to the problem that neglects this
question.  If nothing else, you get some different options for ways to
shoot yourself in the foot ;-)

Having said that, as you can tell from my previous mail, I have a real
soft spot for the idea of ditching dos partitions and using LVM instead.

> and, since lvm2 does not touch the first 512 bytes of a PV, fitting a
> grub boot block in there is not going to be that difficult.

I didn't realise that had gotten done in the end. 
Can't tell you how happy it makes me :-)

Think I'll go and reformat a disk to celebrate! :-)

Don't suppose anyone put in support to stop things getting moved
about by accident that shouldn't ?

Regards,
Paddy
