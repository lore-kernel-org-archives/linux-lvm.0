Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2OMTVBU027580
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 18:29:31 -0400
Received: from fmailhost04.isp.att.net (fmailhost04.isp.att.net
	[204.127.217.104])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2OMTBmZ004128
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 18:29:12 -0400
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id DD7301804A8
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 18:32:29 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 07121-05 for <linux-lvm@redhat.com>;
	Tue, 24 Mar 2009 18:32:27 -0400 (EDT)
Date: Tue, 24 Mar 2009 18:32:27 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] Shrinking a LVM physical volume
Message-ID: <20090324223226.GC6532@bdmcc-us.com>
References: <c268e4660903240759t35826b60n641296dba8fdd764@mail.gmail.com>
	<20090324215410.GB20225@lupe-christoph.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20090324215410.GB20225@lupe-christoph.de>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Mar 24, 2009 at 10:54:10PM +0100, Lupe Christoph wrote:
> On Tuesday, 2009-03-24 at 07:59:09 -0700, Drew wrote:
> 
> > I have a system that I dual boot Windows and Debian from. Due to a
> > minor mistake on my part when carving out the space on my drive for my
> > linux partition, I now find myself with insufficient space on my
> > windows partition.
> 
> > How do you shrink a physical volume on lvm?
> 
> Since nobody with real experience doing that has answered, I'll supply
> my fewer than 2 Eurocents...


Good answer, Lupe.

One other thing to be aware of;  you should know the amount of space 
that has been allocated within the Physical Volume.  If that amount 
exceeds the amount that you wish to recover, you may be able to
shrink Logical Volumes within the Physical Volume, but, of course,
before doing so, you should shrink the filesystems that are contained
within the logical volumes.



Have fun!
Brian
