Message-Id: <199907230841.AA29812@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] what does this mean?
Date: Fri, 23 Jul 1999 10:39:06 METDST
In-Reply-To: <Pine.LNX.4.05.9907080917500.15441-100000@srv1.ecropolis.com>; from "jeremy@xxedgexx.com" at Jul 8, 99 9:18 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeremy@xxedgexx.com
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hello Jeremy,

some kernels sometimes address beyond device limits 8*(.

Do you have a recent kernel in place?

If not, please try an update to 2.2.10, use LVM 0.7 and the 2.2.10
LVM kernel patch.

Regards,
Heinz

> 
> lvm - lvm_map *rsector: 3905085658 + size: 2 too large for 00:00
> Bad lvm_map in ll_rw_block
> lvm - lvm_map *rsector: 3905085658 + size: 2 too large for 00:00
> Bad lvm_map in ll_rw_block
> 
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS/TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
