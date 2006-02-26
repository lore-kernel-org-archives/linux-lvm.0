Received: from o.ww.redhat.com (vpn-4-2.stuttgart.redhat.com [10.32.4.2])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	k1QDgSQZ019868
	for <linux-lvm@redhat.com>; Sun, 26 Feb 2006 14:42:28 +0100
Date: Sun, 26 Feb 2006 14:42:27 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Volume Groups and Clusters
Message-ID: <20060226134227.GC23655@redhat.com>
References: <BD8C22BB-D4AF-4117-A615-D67AAD9E81F3@kivasystems.com>
	<20060222084902.GB23655@redhat.com>
	<F54A1B51-5C2E-4F94-AA7D-0F33E256E3BC@kivasystems.com>
	<43FC6330.3090406@redhat.com>
	<3C7F6729-9AD3-4EAA-BD57-24F321451862@kivasystems.com>
	<1140808929.6609.8.camel@fritzdesk.potsdam.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1140808929.6609.8.camel@fritzdesk.potsdam.edu>
Reply-To: mauelshagen@redhat.com,
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Feb 24, 2006 at 02:22:08PM -0500, Jeff Hardy wrote:
> I played around with this kind of setup for awhile, and found that there
> was no need to vgchange -an on the "Other nodes" when I was making
> changes on the "Admin node."  I was also able to make volume changes on
> two Admin nodes at the same time.  I figured I was probably just
> extremely lucky to win some extremely dangerous race conditions, so I
> wouldn't do it in production.  I assume the cluster extensions to LVM
> (CLVM) are what allow multiple Admin actions on multiple Admin nodes?

Yes.

Heinz

> 
> Anyway, just some friendly advice: follow the docs :)
> 
> 
> On Wed, 2006-02-22 at 08:27 -0500, Joshua ChaitinPollak wrote:
> > On Feb 22, 2006, at 8:12 AM, Patrick Caulfield wrote:
> > 
> > > Joshua ChaitinPollak wrote:
> > >>
> > >> On Feb 22, 2006, at 3:49 AM, Heinz Mauelshagen wrote:
> > >>
> > >>> On Tue, Feb 21, 2006 at 04:22:10PM -0500, Joshua ChaitinPollak  
> > >>> wrote:
> > >>>> Hello, I found this mention of sharing Volume Groups across  
> > >>>> Clusters
> > >>>> on the LVM howto:
> > >>>>
> > >>>> http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html
> > >>>>
> > >>>> Am I right in assuming that this means you can have a single volume
> > >>>> group active on multiple nodes in a cluster, provided that you  
> > >>>> doing
> > >>>> mount the same logical volume on more than one node at a time?
> > >>>
> > >>> Yes, you assume right *but* you need a cluster filesystem (eg, GFS)
> > >>> as well to be able to mount shared logical volumes on multiple nodes
> > >>> at once or you mess up the data.
> > >>
> > >> Right, but I don't need GFS if I'm only going to mount the file  
> > >> system
> > >> on one machine at a time, right?
> > >
> > > No, just a lot of care and discipline :)
> > 
> > Great! And, my co-workers keep telling me, "You lack discipline!"
> > 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
