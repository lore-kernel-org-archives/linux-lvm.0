Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA1JpMS4024440
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 15:51:22 -0400
Received: from qmta15.westchester.pa.mail.comcast.net
	(qmta15.westchester.pa.mail.comcast.net [76.96.59.228])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA1JpLCW030689
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2011 15:51:21 -0400
Date: Tue, 1 Nov 2011 19:51:21 +0000 (UTC)
From: Dan White <ygor@comcast.net>
Message-ID: <151363651.1656354.1320177081644.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <4EB04692.3060705@alteeve.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
 Volume Group ?
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
Content-Type: text/plain; charset="utf-8"
To: Digimer <linux@alteeve.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

----- Digimer <linux@alteeve.com> wrote:
> On 11/01/2011 03:13 PM, Dan White wrote:
> > ----- Digimer <linux@alteeve.com> wrote:
> >> On 11/01/2011 02:39 PM, Dan White wrote:
> >>> Is a logical volume group necessary before one can start making mountable partitions ?
> >>>
> >>> I'm trying to work with a SAN.  We were allocated a 10Gb LUN to "play" with. Another admin created a logical volume on the LUN and then made a single partition out of the logical volume.  The flow I am familiar with from Red Hat's GUI is to first make a logical volume group, then make partitions in the group that I can adjust in size as necessary.
> >>>
> >>> Are both workflows valid ?
> >>
> >> LVs must be created from VGs.
> >>
> > 
> > I agree.  Got a documentation reference I can use for backup ?
> 
> man lvcreate? Not being flippant, but the 'VolumeGroupName' is a
> required value. :)
> 
> Also from the man page;
> 
> DESCRIPTION
>        lvcreate creates a new logical volume in a volume group  (  see vgcre-
>        ate(8), vgchange(8) ) by allocating logical extents from the free  phys-
>        ical extent pool of that volume group.  If there are  not  enough free
>        physical  extents  then  the  volume  group can be extended ( see vgex-
>        tend(8) ) with other physical volumes or by reducing  existing logical
>        volumes  of this volume group in size ( see lvreduce(8) ). If you spec-
>        ify one or more PhysicalVolumes, allocation of physical extents will be
>        restricted to these volumes.
>        The second form supports the creation of snapshot logical volumes which
>        keep the contents of the original logical volume for backup purposes.
> 

Many thanks.  Not at all flippant.  Direct and informative.

“Sometimes I think the surest sign that intelligent life exists elsewhere in the universe is that none of it has tried to contact us.”
Bill Waterson (Calvin & Hobbes)
