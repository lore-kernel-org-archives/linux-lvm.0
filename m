Message-Id: <199909211422.AA26575@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] kernel oopsing update
Date: Tue, 21 Sep 1999 16:18:51 METDST
In-Reply-To: <Pine.LNX.4.10.9909211424440.1088-100000@fuse.aethos.co.uk>; from "James Pattinson" at Sep 21, 99 2:27 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jamesp@aethos.co.uk
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


This looks like an out of sync lvmtab.
See my previous related mail run vgscan please.

Regards,
Heinz

> 
> Hi again
> 
> Arrggh! It's all going a bit strange on me. I have two VG's, vg00 and
> vgdb. When I type 'vgdisplay vg00' i get the information for vgdb, and
> vice versa:
> 
> [root@greebo][/root]# vgdisplay vgdb
> --- Volume group ---
> VG Name               vg00
> VG Access             read/write
> 


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
