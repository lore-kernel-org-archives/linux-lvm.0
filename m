Message-ID: <3959EF00.C2F8E676@ednet.ns.ca>
Date: Wed, 28 Jun 2000 09:26:40 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] ReiserFS/XFS/JFS, LVM, Raid5
References: <B45465FD9C23D21193E90000F8D0F3DF6834F2@mailsrv.linkvest.ch>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Jean-Eric Cuendet wrote:

> > We use LVM + Reiserfs on 2 production boxes. One is a 5x36 gig Raid 5
> > (Dell (AMI) PERC Controller) while the other is just two 18 gig drives
> > LVMed together. So far there have been no problems.
>
> So you have a HARD Raid5 controller with LVM and Reiser?
> Did you already had a crash? How was the filesystem after that?
>
> -jec

We had one crash on the box with the HARD Raid5 controller and the file
systems were fine when it came backup.

We have had more crashes on the box with the 2 drives and the filesystems
have also been fine.
