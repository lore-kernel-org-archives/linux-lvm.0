Return-Path: <bluca@comedia.it>
Date: Fri, 1 Dec 2000 14:17:10 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Old problem cropping up again with 0.9 lvm tools?
Message-ID: <20001201141710.A508@colombina.comedia.it>
References: <3A247D53.E3B78F60@cup.hp.com> <20001129174952.A26362@colombina.comedia.it> <20001129215950.B26839@srv.t-online.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001129215950.B26839@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Wed, Nov 29, 2000 at 09:59:50PM +0000
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 29, 2000 at 09:59:50PM +0000, Heinz J. Mauelshagen wrote:
> > vgscan will fail in pv_read
> > since pv_read.c contains a line which makes it fail if the device is an
> > me device.
> 
> It's used to distinguish in a higher library layer between MD and other devices.
> 
> > 
> > 0.8.1 has the same line, but pvread s not calle d by vgscan :)
> 
> It gets called indirectly from from vgscan by calling vg_read_with_pv_and_lv().
ok, but 0.8.1 vgscan works with md devices, 0.9 does not,
should i try to patch it at an higher layer then pv_read.c then?

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
