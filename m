Message-Id: <3C4F07E6.E137C465@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 64K limit for VG/LV
References: <3C4D61CF.12330DF1@conterra.de>
    <20020122193953.A25782@sistina.com>
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
Date: Wed Jan 23 12:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" schrieb:
> that's correct. It is just a per LV limit for the max amount of its
> Logical Extents (LEs).
> 
> > Thus as long as each of my LV is <256G I don't have to worry, and
> > the reported "Free PE" might be just cosmetics.
> 
> Cosmetics is a nice way to put it :-)
> We probably have missed that one, because for a VG with such a large capacity
> we choosed larger PE sizes.

but I still worry a bit about my data. The reason for the wrong "Free 
PE"
reported seems not to be the 64k limit, but the fact that some of my LVs
are reported/counted twice!

-> vgdisplay -v vg0  | fgrep "LV Name"
LV Name                /dev/vg0/root
LV Name                /dev/vg0/win2k
LV Name                /dev/vg0/ortho
LV Name                /dev/vg0/praktikum
LV Name                /dev/vg0/swap
LV Name                /dev/vg0/mirror
LV Name                /dev/vg0/disk_huetti
LV Name                /dev/vg0/SuSE-7.3
LV Name                /dev/vg0/mirror          <<<<<
LV Name                /dev/vg0/disk_huetti     <<<<<

Thus I still fear of some evil inconsistencies for my data.
Is there any tool available like "e2fsck" for LVM to resolve such a
problem?

Dieter.
