Return-Path: <list@showme.wox.org>
Message-ID: <005801c0ac4b$a781cc00$0f01a8c0@myplace.net>
From: "Bas" <list@showme.wox.org>
References: <001601c0ac41$fc35a640$0f01a8c0@myplace.net> <20010313211749.B18064@cistron.nl> <003301c0ac47$0ed576e0$0f01a8c0@myplace.net> <wxxbsr5e6vx.fsf@fjorir.ifi.uio.no>
Subject: Re: [linux-lvm] Changing device numbers.
Date: Tue, 13 Mar 2001 21:57:29 -0800
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

Subject: Re: [linux-lvm] Changing device numbers.


> "Bas" <list@showme.wox.org> writes:
>
> > Because since I removed a couple of LVs and created a few, lilo
> > seems to have some trouble when it's told that
> > root=/dev/rootvg/root. (this number has changed).
>
>   and rerunning lilo doesn't help? if it doesn't you could try playing
>   with the "disk"-settings in lilo?

Rerunning lilo seemed to work, but I had the same problem just a while ago
without
changing anything but adding a LV.

>
> > Plus I think it looks a lot "nicer" ...
>
>   yes, well, you have to break a few eggs to make an omelet. or
>   something. YMMV.

>
> --
> Terje - who has / as a normal partition mostly because he got a new
>         disk to install LVM on, and didn't bother moving /.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
