Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Sun, 3 Dec 2000 13:53:03 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Old problem cropping up again with 0.9 lvm tools?
Message-ID: <20001203135303.A3922@srv.t-online.de>
References: <3A247D53.E3B78F60@cup.hp.com> <20001129174952.A26362@colombina.comedia.it> <20001129215950.B26839@srv.t-online.de> <20001201141710.A508@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20001201141710.A508@colombina.comedia.it>; from bluca@comedia.it on Fri, Dec 01, 2000 at 02:17:10PM +0100
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Dec 01, 2000 at 02:17:10PM +0100, Luca Berra wrote:
> On Wed, Nov 29, 2000 at 09:59:50PM +0000, Heinz J. Mauelshagen wrote:
> > > vgscan will fail in pv_read
> > > since pv_read.c contains a line which makes it fail if the device is an
> > > me device.
> > 
> > It's used to distinguish in a higher library layer between MD and other devices.
> > 
> > > 
> > > 0.8.1 has the same line, but pvread s not calle d by vgscan :)
> > 
> > It gets called indirectly from from vgscan by calling vg_read_with_pv_and_lv().
> ok, but 0.8.1 vgscan works with md devices, 0.9 does not,
> should i try to patch it at an higher layer then pv_read.c then?
> 

Please help us by narrowing the problem down.

> L.
> 
> -- 
> Luca Berra -- bluca@comedia.it
>     Communication Media & Services S.r.l.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

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
