Date: Tue, 4 Jan 2000 11:08:14 -0500 (EST)
From: Terry Hardie <terryh@orcas.net>
Subject: Re: [linux-lvm] [3 Questions... (fwd)
In-Reply-To: <387158FF.F4EBEFB1@msede.com>
Message-ID: <Pine.LNX.4.21.0001041105330.26541-100000@orcas.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jamesp@emporia.u-net.com
Cc: linux-lvm@msede.com

On Tue, 4 Jan 2000, Michael Marxmeier wrote:

> 2. LVM 0.8i kernel compile fails
> 
> I got an error yesterday while trying to compile the latest LVM patch
> - it
> failed with 'undefined reference to lvm_init' or something when
> linking
> the final kernel. The kernel config works fine with 0.7...

Actually, on line 362 of lvm.c in your kernel source, block/drivers,
change the word "static" to "extern". The problem doesn't show up if
you're compiling LVM as a module.

---
Terry Hardie					terry@gxc.com
Founder and Chief Technology officer		ICQ#: 977679
Convergence Equipment Co, Manassas, VA, USA	V: +1-703-361-5566
"Home of the BOB Class 4 convergence switch"
