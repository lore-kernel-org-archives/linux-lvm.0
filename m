Subject: Re: [linux-lvm] LVM2 for kernels 2.4.20
Message-ID: <20030202175153.GA11372@fib011235813.fsnet.co.uk>
References: <20030126120322.GA405@4allsystems.com> <20030126133312.GB15603@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030126133312.GB15603@percy.comedia.it>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Sun Feb  2 11:53:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jan 26, 2003 at 02:33:13PM +0100, Luca Berra wrote:
> for the hassle of patching i use this
> #!/bin/sh
> set -e
> pname=`basename $1`
> for i in $1/*.patch
> do
>        pnum=`basename $i`
>        pnum=${pnum%.patch}
>        patch -p1 -s -N -E -b -z .$pname.$pnum.orig < $i
>        for j in `find . -name \*.$pname.$pnum.orig`
>        do
>                if [ -f ${j%.$pnum.orig}.orig ]
>                then
>                        rm -f $j
>                else
>                        mv $j ${j%.$pnum.orig}.orig
>                fi
>        done
> done
> 
> to use cd into kernel source dir and run it vs /path/to/2.4.20-dm-7

I just

cat /tmp/2.4.20-dm-7/*.patch | patch -p1

- Joe
