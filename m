Date: Sun, 29 Oct 2000 15:45:08 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Size limits and kernel versions
Message-ID: <20001029154508.B22058@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <OLEAJMNOEMOMMNEIMMINEEEBCBAA.pswartz@digitalrom.com> <200010270313.e9R3DGU27627@webber.adilger.net> <20001029060639.A6263@omnifarious.mn.org>
Mime-Version: 1.0
In-Reply-To: <20001029060639.A6263@omnifarious.mn.org>; from hopper@omnifarious.mn.org on Sun, Oct 29, 2000 at 06:06:39AM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Cc: linux-lvm@msede.com

On Sun, Oct 29, 2000 at 06:06:39AM -0600, Eric M. Hopper wrote:
> On Thu, Oct 26, 2000 at 09:13:16PM -0600, Andreas Dilger wrote:
> > 
> >> If so, what kernel patch do I use for RedHat 7.0?
> > 
> > You can probably use my 2.2 patch at
> > ftp://ftp.stelias.com/pub/adilger/ but I haven't tried it on Red Hat.
> > I have heard some strange things about RH 7.0 headers and such, so it
> > may take a bit of work.  It may even be that RH 7.0 has LVM in it
> > already, I don't know.
> 
> 	The main problem I'd had with RedHat kernels lately has been
> that their MD (kernel RAID) modifications don't work well with LVM.  I
> just disable MD and it works fine.
> 
> 	This is with the stock 0.8i kernel patch.

Basically the mess in terms of meta device drivers patching ll_rw_blk.c
causing all kinds of problems is addressed much better in 2.4.

Anyway: can you elaborate a bit on what you mean with
        "their MD (kernel RAID) modifications don't work well with LVM", please?


Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
