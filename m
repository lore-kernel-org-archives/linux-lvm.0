Message-ID: <389EF4DE.68165A11@osp.nl>
Date: Mon, 07 Feb 2000 17:37:50 +0100
From: Jos Visser <josv@osp.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Configuring boot partition with LVM
References: <Pine.LNX.4.20.0002041218580.416-100000@claudius.mgmt-inc.com> <20000207103719.A1170@suse.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Fabian.Herschel@suse.de
Cc: linux-lvm@msede.com

>  Lilo
> should also learn how to boot a kernel fom a striped volume...

Hi,

I don't think you fully appreciate the request you're making here.
Commercial Unices such as HP-UX and Solaris can not boot from striped
volumes for about the same reasons why it would be difficult to have
LILO read from a striped volume: the implications are just too
horrendous to comtemplate.

Typically I don't care that my boot partition/lv can not be striped. The
I/O rates into that volume are just not high enough to need striping.
Why not put our efforts to something else which is more important right
now.?

++Jos

-- 
All the rivers run into the sea; yet the sea is not full; unto
the place from whence the rivers come, thither they return again.
