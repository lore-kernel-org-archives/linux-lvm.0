Message-Id: <199904171124.AA07700@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Swap/DB devices (fwd)
Date: Sat, 17 Apr 1999 13:22:29 METDST
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com



On Sat, 17 Apr 1999 01:14:00 +0100 (BST), Stephen Tweedie
<sct@redhat.com> wrote:

> 
> On Fri, 16 Apr 1999 23:47:06 METDST, Heinz Mauelshagen
> <mauelsha@ez-darmstadt.telekom.de> said:
> 
> >> I'm curious: why?  I would have thought that LVM should support any
> >> requests coming in through ll_rw_block already.
> 
> > It's simply a matter of userland (lv_create_node() and friends in lvmlib)
> > to create the LVM 'raw' device specials.
> > Only regular buffer cached device specials are created up to 0.6.
> 
> You won't need to.  The raw device patches create one single new major
> number, and let you bind the minor numbers to any block devices you
> want.  You can access _any_ block device driver without modification.
> 

The LVM lib creates the device special nodes dynamically if a logical volume
is created by lvcreate(8) or found by vgscan(8)/vgimport(8).

LVM function lv_create_node() has to be extended to create the raw device too.
The LVM driver can then be accessed by that raw device node
_without_ modification.

Heinz


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
