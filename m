Message-Id: <199910122036.AA00959@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] stripesize
Date: Tue, 12 Oct 1999 22:35:07 METDST
In-Reply-To: <002c01bf0ecb$f25267e0$030116ac@fd1>; from "Fernando Dammous" at Oct 4, 99 9:52 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fernando Dammous <ferdam@internetcom.com.br>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hello.

> 
> Hi,
> 
> Could anybody explain to me which the meaning of the option stripesize =
> (lvcreate -I)? 

It is the the size by which i/o request are devided and put to the different
disks in a stripe set.

For eg.: you have i/o requests sized 16k, a striped logical volume on
         4 disks and a stripesize of 4k --> your requests are devided into 4
         chunks, 4k each, which are stored in parallel to all 4 disks.

For sure your hardware has to support parallel i/o (think about IDE constraints)
and the i/o requests are indirected thrugh the Linux buffer cache.

> When to use 4k, 8k or 16K?

It heavyly depends on the application and the amount of disks in the stipe set.

For eg.: ext2 with 4k blocksize, stripesize 1k and 4 stripes/disks
         performs well.
         If you have 2 stripes/disks, ext2 with 4k blocksize, try stripesize 2k.

Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
