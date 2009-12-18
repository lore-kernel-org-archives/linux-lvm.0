Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBI3WBGT022671
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 22:32:12 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBI3W16K011988
	for <linux-lvm@redhat.com>; Thu, 17 Dec 2009 22:32:02 -0500
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1NLTZP-0006qF-BW
	for linux-lvm@redhat.com; Thu, 17 Dec 2009 19:31:59 -0800
Date: Thu, 17 Dec 2009 21:31:58 -0600
From: Ray Morris <support@bettercgi.com>
Subject: Re: [linux-lvm] Re: brainfart: lilo'd a PV
References: <4B2AD174.40402@redhat.com>
	<1261101785.21162.712.camel@pc.interlinx.bc.ca>
In-Reply-To: <1261101785.21162.712.camel@pc.interlinx.bc.ca> (from
	brian@interlinx.bc.ca on Thu Dec 17 20:03:08 2009)
Message-Id: <1261107118.11465.16@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> > Yes. The area begin with "LABELONE" is PV label,
> 
> Looks like the LVM developers foresaw my brainfart and left the first
> sector of the disk for me to bugger up without buggering up LVM.  :-)


    Applause.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 12/17/2009 08:03:08 PM, Brian J. Murrell wrote:
> On Thu, 2009-12-17 at 19:48 -0500, Takahiro Yasui wrote:
> >
> > Yes. The area begin with "LABELONE" is PV label,
> 
> Looks like the LVM developers foresaw my brainfart and left the first
> sector of the disk for me to bugger up without buggering up LVM.  :-)
> 
> > which is recorded in
> > the first sector by default.
> 
> Hrm.  Do you really mean "first" there or second, which is sector 1 if
> you start counting with 0?
> 
> > This is the description from the pvcreate
> > man page.
> >
> >        --labelsector sector
> >               By default the PV is labelled with an  LVM2   
> identifier  in  its
> >               second  sector (sector 1).
> 
> Yes, this looks so.
> 
> >   This lets you use a different sector
> >               near the start of the disk (between 0  and  3   
> inclusive  -  see
> >               LABEL_SCAN_SECTORS in the source).  Use with care.
> 
> > You don't have any problem on the PV, do you?
> 
> I don't think I do:
> 
> # pvdisplay /dev/sda
>   --- Physical volume ---
>   PV Name               /dev/sda
>   VG Name               datavol
>   PV Size               931.51 GB / not usable 1.71 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              238467
>   Free PE               85356
>   Allocated PE          153111
>   PV UUID               C22uVB-4m26-5cvl-I11V-NXCm-mVNo-UTAXUH
> 
> But of course, I just want to get the opinion of the experts.
> 
> > I don't think you need something to repair the PV.
> 
> I don't think so either, but of course, do want to confirm my  
> suspicion.
> 
> Thanx much for your insight.
> 
> b.
> 
> 

------quoted attachment------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
