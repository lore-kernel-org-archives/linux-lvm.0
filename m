Date: Sun, 3 Oct 1999 17:42:41 +0200 (CEST)
From: Andreas Kostyrka <andreas@mtg.co.at>
Subject: Re: [linux-lvm] LVM & Raid
In-Reply-To: <199910031148.NAA24977@seger.axis.se>
Message-ID: <Pine.LNX.4.10.9910031740360.5099-100000@gatekeeper.zwax.mtg.co.at>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Segerlund <lars.segerlund@axis.com>
Cc: linux-lvm@msede.com

On Sun, 3 Oct 1999, Lars Segerlund wrote:

> 
>  Hello,
> 
>  I'm having trouble setting up lvm on a raid5 array ( /dev/md0 ),
>  my trouble is that pvscan doesn't find it, ( how in the heck
Well, see the list archives, I've posted a small patch so that it can be
found.
>  do I label a raid partitium so that pvscan vill recognize and vgcreate
>  will think of it a partitiun ?? )
> 
>  I have been running lvm with raw disks, but now I seem a bit stuck.
Well, I did get some hung boxes (completely hung, without oopses, etc.
on a raid0145 / LVM 0.7 box with a RAID5 physical volume. So I reverted
to using raid0145 with LVM :( )

Andreas
--
Andreas Kostyrka                     | andreas@mtg.co.at
phone: +43/1/7070750                 | phone: +43/676/4091256   
MTG Handelsges.m.b.H.                | fax:   +43/1/7065299
Raiffeisenstr. 16/9                  | 2320 Zwoelfaxing AUSTRIA        
