Subject: Re: [linux-lvm] one PV crashed
References: <878zad8qrx.fsf@papadoc.bayour.com>
    <20020201111151.B15491@sistina.com>
From: Turbo Fredriksson <turbo@bayour.com>
In-Reply-To: <20020201111151.B15491@sistina.com>
Message-Id: <87bsf1eg6b.fsf@papadoc.bayour.com>
MIME-Version: 1.0
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
Date: Thu Feb  7 04:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Quoting "Heinz J . Mauelshagen" <mauelshagen@sistina.com>:

> Buy a replacemeent drive (say /dev/sdg1 ;-) and run
> 
> fdisk # to partition it the same way the broken one was
> pvcreate /dev/sdg1
> vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 /dev/sdg1
> vgscan

Oki, since I had a LVM with broken loop support, I'll try with a spare disk...

----- s n i p -----
[papadoc.root]# pvcreate /dev/sdh1
pvcreate -- physical volume "/dev/sdh1" successfully created

[papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 /dev/sdh1
vgcfgrestore -- physical volume "/dev/sdh1" doesn't belong to volume group "vg1"

[papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 -o /dev/sdg1 /dev/sdh1
vgcfgrestore -- size of physical volume /dev/sdh1 differs from backup
----- s n i p -----

I'm not sure exactly how big my previous (now crashed) sdg disk was, or how big
the sdg1 partition was...

How do I:

        1. Find out _exactly_ how big the sdg1 partition was (the only
           number I have is '15.5Gb')?
        or
        2. Use the  existing sdh1 even though the size don't match?


> After either of the above aproaches you need to lvreduce/lvremove those
> LVs which had extents allocated on the failed drive.
>
> You can figure out which those are by
>
> pvdisplay -v /dev/sdg1

----- s n i p ----
[papadoc.root]# pvdisplay -v /dev/sdh1
pvdisplay -- getting physical volume size
pvdisplay -- "/dev/sdh1" is a new physical volume of 2.22 GB
----- s n i p ----

Not nearly the same size as the original sdg1, but....

cracking Saddam Hussein Albanian class struggle smuggle BATF Legion of
Doom Cuba ammonium DES 747 767 pits Serbian plutonium
[See http://www.aclu.org/echelonwatch/index.html for more about this]
