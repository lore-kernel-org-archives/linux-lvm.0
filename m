Return-Path: <mauelshagen@sistina.com>
Date: Wed, 25 Jul 2001 21:48:43 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Logical Volume file system
Message-ID: <20010725214843.E27765@sistina.com>
References: <20010725162635.F32341@cistron.nl> <20010725165117.B598@dardhal.mired.net> <20010725165527.I32341@cistron.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010725165527.I32341@cistron.nl>; from wichert@cistron.nl on Wed, Jul 25, 2001 at 04:55:27PM +0200
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Wed, Jul 25, 2001 at 04:55:27PM +0200, Wichert Akkerman wrote:
> Previously Jos� Luis Domingo L�pez wrote:
> > Does it mean that applications can use a LV as a "raw device" ?.
> 
> There is no such as a `raw device'. A LV can be seen as a normal blockdevice
> from userland, just like a normal harddisk or disk slice.
> 
> I think what you are referring to is `raw io', which is something you
> can do with any block device. Currently you still need a special rawio
> patch for Linux kernels, but it's a well tested and stable patch.

Wichert is right,

you need a patch for 2.2.

rawio is included in 2.4.

> 
> Wichert.
> 
> -- 
>   _________________________________________________________________
>  /       Nothing is fool-proof to a sufficiently talented fool     \
> | wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
> | 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
