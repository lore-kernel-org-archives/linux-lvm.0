Return-Path: <list@showme.wox.org>
Message-ID: <004f01c0ac4a$fa071760$0f01a8c0@myplace.net>
From: "Bas" <list@showme.wox.org>
References: <001601c0ac41$fc35a640$0f01a8c0@myplace.net> <20010313211749.B18064@cistron.nl> <003301c0ac47$0ed576e0$0f01a8c0@myplace.net> <20010313214317.A19896@cistron.nl>
Subject: Re: [linux-lvm] Changing device numbers.
Date: Tue, 13 Mar 2001 21:52:38 -0800
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

I thought so too, but that made me connect a monitor twice today and append
a "root=/dev/rootvg/root" line ...

----- Original Message -----
From: Wichert Akkerman <wichert@cistron.nl>
To: <linux-lvm@sistina.com>
Sent: dinsdag 13 maart 2001 12:43
Subject: Re: [linux-lvm] Changing device numbers.


> Previously Bas wrote:
> > Because since I removed a couple of LVs and created a few, lilo seems to
> > have some trouble when it's told that root=/dev/rootvg/root. (this
number
> > has changed). Plus I think it looks a lot "nicer" ...
>
> Just running lilo again should fix that, right? It would be nice if
> someone updated grub to handle LVM
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
