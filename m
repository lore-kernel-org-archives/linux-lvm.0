From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM2 for kernels 2.4.20
Message-ID: <20030126133312.GB15603@percy.comedia.it>
References: <20030126120322.GA405@4allsystems.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030126120322.GA405@4allsystems.com>
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
Date: Sun Jan 26 07:34:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jan 26, 2003 at 07:03:22AM -0500, Maximo Ramos wrote:
>Hi!
>
>sorry to bother you but I am trying to use LVM2 in my 2.4.20 kernel ...
>
>the current device-mapper doesn't have a path for 2.4.20 so ...
>
>I've got 2.4.20-dm-7.tar.bz2 but that's a lot of patch files with no README
>in it ...
>
>I patch my kernel with those files, one-by-one (there are 40) but after the
>modules building, I've got:
for the hassle of patching i use this
#!/bin/sh
set -e
pname=`basename $1`
for i in $1/*.patch
do
        pnum=`basename $i`
        pnum=${pnum%.patch}
        patch -p1 -s -N -E -b -z .$pname.$pnum.orig < $i
        for j in `find . -name \*.$pname.$pnum.orig`
        do
                if [ -f ${j%.$pnum.orig}.orig ]
                then
                        rm -f $j
                else
                        mv $j ${j%.$pnum.orig}.orig
                fi
        done
done

to use cd into kernel source dir and run it vs /path/to/2.4.20-dm-7

>
>[~]$modprobe dm-mod
>/lib/modules/2.4.20/kernel/drivers/md/dm-mod.o: unresolved symbol mempool_destroy_Raf572a67

can you confirm you were running from a clean kernel source tree
(i.e. you just untarred or made mrproper)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
