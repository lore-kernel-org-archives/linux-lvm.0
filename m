Message-Id: <199903111341.OAA07416@e35.msede.com>
Date: Thu, 11 Mar 1999 08:40:42 -0500
From: "Verloove, Olivier" <olivier_verloove@merck.com>
Subject: RE: [linux-lvm] Bonehead problem
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I have the same problem (Linux 2.2.2 + LVM 0.6).
With or without lvm module loaded, I get:
	vgscan -- invalid i/o protocol version

Is there another module which should be loaded at the same time ?
lsmod gives me:
	lvm	26960	0  (unused)

Thanks.
Olivier Verloove

> ----------
> From:
> ishamael@erroneous.demon.co.uk[SMTP:ishamael@erroneous.demon.co.uk]
> Sent: 	Thursday, 11 Mar, 1999 1:25
> To: 	linux-lvm@msede.com
> Subject: 	Re: [linux-lvm] Bonehead problem
> 
> Shawn Leas wrote:
> >When I upgraded to v0.6 from v0.5alpha, I end up having
> >to keep the old v0.5 version of vgscan around.
> >
> >Reason? Well, this is WEIRD... v0.6 vgscan always errs out
> >with 96, or, invalid IO/protocol version. Then, I use v0.5
> >vgscan, and the same happens. Then, I use v0.6 vgscan again,
> >and IT WORKED!
> >
> >What the hell is going on?
> 
> Did you build lvm as a module? _insmod lvm_ worked for me, after several
> hours 
> of profound confusion.
> 
> -michael
> -- 
> St michael (mainly) Erroneous   http://www.erroneous.demon.co.uk/
> "It's ok to be bitter and twisted,
>  Provided you don't mind leaving a nasty taste in your own mouth."
> 
> 
