Return-Path: <list@showme.wox.org>
Message-ID: <003301c0ac47$0ed576e0$0f01a8c0@myplace.net>
From: "Bas" <list@showme.wox.org>
References: <001601c0ac41$fc35a640$0f01a8c0@myplace.net> <20010313211749.B18064@cistron.nl>
Subject: Re: [linux-lvm] Changing device numbers.
Date: Tue, 13 Mar 2001 21:24:35 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Hi,

Because since I removed a couple of LVs and created a few, lilo seems to
have some trouble when it's told that root=/dev/rootvg/root. (this number
has changed). Plus I think it looks a lot "nicer" ...

Bye,
Bas

----- Original Message -----
From: Wichert Akkerman <wichert@cistron.nl>
To: <linux-lvm@sistina.com>
Sent: dinsdag 13 maart 2001 12:17
Subject: Re: [linux-lvm] Changing device numbers.


> Previously Bas wrote:
> > I want root to have major 58, minor 0 and usr major 58, minor 1. How can
I
> > get that done.
>
> The first thing that comes to my mind is: why would anyone care
> what the device numbers are? The whole purpose of device files,
> and especially devfs, is that you can use names instead of number
> and never need to care about them.
>
> Wichert.
>
> --
>    ________________________________________________________________
>  / Generally uninteresting signature - ignore at your convenience  \
> | wichert@cistron.nl                  http://www.liacs.nl/~wichert/ |
> | 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
