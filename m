Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9FKour13985
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 16:50:56 -0400
Received: from sphinx.mythic-beasts.com (sphinx.mythic-beasts.com
	[212.69.37.6])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9FKonoC029694
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 16:50:50 -0400
Received: from pdw by sphinx.mythic-beasts.com with local (Exim 4.34)
	id 1CIZ2H-0003Nb-IP
	for linux-lvm@redhat.com; Fri, 15 Oct 2004 21:50:49 +0100
Date: Fri, 15 Oct 2004 21:50:49 +0100
From: Paul Warren <pdw@ex-parrot.com>
Subject: Re: [linux-lvm] Re: [OxLUG] LVM2 problems
Message-ID: <20041015215049.A27758@sphinx.mythic-beasts.com>
References: <20041015192848.O30562@sphinx.mythic-beasts.com>
	<20041015185452.GG565@scooby.ox.compsoc.net>
	<20041015201822.B29778@sphinx.mythic-beasts.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041015201822.B29778@sphinx.mythic-beasts.com>;
	from pdw@ex-parrot.com on Fri, Oct 15, 2004 at 08:18:22PM +0100
Sender: Paul Warren <pdw@sphinx.mythic-beasts.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Oct 15, 2004 at 08:18:22PM +0100, Paul Warren wrote:
> > > /lib/lvm-200/lvm vgconvert -d -v  -M1 mainvg
> > >     Using volume group(s) on command line
> > >     Finding volume group "mainvg"
> > >     Archiving volume group "mainvg" metadata.
> > > Segmentation fault
> >  
> > If it does it with the latest (2.00.25) version,
> > configure --enable-debug and send me the binary + core file
> > to investigate.
> 
> OK - I'll give it a go and follow-up on linux-lvm.

I am now unable to reproduce this.  Instead I get the following with
both 2.00.21 and 2.00.25:

./lvm vgconvert -M1 -d -v mainvg
    Using volume group(s) on command line
    Finding volume group "mainvg"
    Archiving volume group "mainvg" metadata.
  Metadata would overwrite physical extents
  /dev/sda2: Format-specific setup of physical volume failed.
  Failed to setup physical volume "/dev/sda2"

Paul
