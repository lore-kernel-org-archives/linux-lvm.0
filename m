Message-Id: <199907121110.AA02186@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] loopback support?
Date: Mon, 12 Jul 1999 13:09:59 METDST
In-Reply-To: <000501beca08$afa30c40$0102010a@adminstation.sgymsdam.nl>; from "Lennert Buytenhek" at Jul 9, 99 2:43 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buytenh@dsv.nl
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Lennert,

Support comes these days with upcoming LVM 0.7.

Cheers,
Heinz


> Hi all,
> 
> I know this question has been asked before (Mar 16),
> but are there patches for making lvm work over the
> loopback device? I need to do some testing of my
> ext2 resizer on 2gig+ filesystems. All my partitions
> together (including the DOS ones*) might just have
> enough space free for this. I=B4ve tried some patching
> lvm before, but I believe the lvm code thinks that p=B4s
> in a device name are special in some way
> (/dev/loo=B4p=B40 **).
> 
> Thanks in advance,
> 
> Lennert Buytenhek
> <buytenh@dsv.nl>
> 
> * Yes, I know, and flames go to /dev/null. I have parents
> and I can=B4t do much about it :-). And I=B4m getting tired of
> this needing to defend myself.
> 
> ** Is this related to the c0s0p0t0x0y0z0 stuff that devfs
> is so fond of?
> 
> 
> 


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
