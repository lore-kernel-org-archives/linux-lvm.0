Date: Wed, 29 Dec 1999 16:47:40 -0500 (EST)
From: Terry Hardie <terryh@orcas.net>
Subject: Re: [linux-lvm] vgcreate core dumps
In-Reply-To: <19991229141146.A15001@deja.com>
Message-ID: <Pine.LNX.4.21.9912291647171.492-100000@orcas.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Haig <rhaig@deja.com>
Cc: linux-lvm@msede.com

On Wed, 29 Dec 1999, Robert Haig wrote:

> I'm perplexed.
> 
> here's what happened
> ==========================
> # fdisk /dev/sdb
> 
> Command (m for help): p
> 
> Disk /dev/sdb: 255 heads, 63 sectors, 553 cylinders
> Units = cylinders of 16065 * 512 bytes
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sdb1             1       553   4441941   8e  Unknown
> 
> Command (m for help): q
> 
> # pvcreate /dev/sdb1
> pvcreate -- reinitializing physical volume
> pvcreate -- physical volume "/dev/sdb1" successfully created
> 
> # vgcreate test_vg /dev/sdb1
> Segmentation fault (core dumped)

See the message I posted about the missing "data = NULL;" - That's the
problem it fixes.

---
Terry Hardie					terry@gxc.com
Founder and Chief Technology officer		ICQ#: 977679
Convergence Equipment Co, Manassas, VA, USA	V: +1-703-361-5566
"Home of the BOB Class 4 convergence switch"
