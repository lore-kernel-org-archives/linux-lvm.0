Message-ID: <3991C64D.7F787704@geotec.net>
Date: Wed, 09 Aug 2000 15:59:58 -0500
From: Eric Smith <seric@geotec.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] dual adapter machine
References: <31A612FE6020D2119F6400A0C9B67EBB0381B27A@FTHW901E>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Cc: 'Michael Lausch' <mla@1012surf.net>, linux-lvm@msede.com

I think LVM should be made to do it.  Veritas calls theirs  DMP: Dynamic Multi
Pathing.  What's cool is, not only do you eliminate your single point of
failure. but also DMP round-robins requests between the two paths when both are
active, increasing your throughput.

LVM should do this, imho!


Franken Klaus wrote:

> Hi,
>
> there is a commercial software called "Duplex Data Manager (DDM)" from
> Fujitsu-Siemens-Computers for exactly this.
> Unfortunately I can't found an online documentation.
> I can send you a PDF and a powerpoint ducumentation if needed.
> In the german magazin "Linux Enterprise" (1.2000) was an article about DDM.
>
> DDM seems very well designed, you can use it in conjunction with MD, LVM etc.
>
> But an open-source tool would be nice too.
>
> Klaus.Franken@fth2.siemens.de    +49 911 978 3707
> Siemens Business Services IP 21F
>
> > -----Original Message-----
> > From: Michael Lausch [mailto:mla@1012surf.net]
> > Sent: Monday, August 07, 2000 12:33 PM
> > To: linux-lvm@msede.com
> > Subject: [linux-lvm] dual adapter machine
> >
> >
> >
> > We are going to use linux LVM on some servers using 2 FCAL adapters
> > per machine, since our RAID System (HP XP256) has two FCAL
> > channels. So in order to have no single point of failure, we want to
> > use 2 FCAL adapters in each machine, connected to the same (virttual)
> > disks. This means i see the same partition on two controlers.
> >
> > For example: controller 1, SCSIID 3, LUN 1, Partition 1
> > and          controller 2, SCSIID 3, LUN 1, Partition 1
> >
> > refer to the same blocks.
> >
> > So when everything is okay i'll talk to the disk through c1d3l1s1 (in
> > solaris notation). When this FCAL has an error, i want to talk to the
> > same disk via c2d3l1s1. How can this be done with linux LVM?
> >
> > Anybody got any ideas?
> >
> > thanks in advance.
> > --
> > michael lausch
> >
