Return-Path: <dice@mfa.kfki.hu>
Date: Fri, 15 Dec 2000 18:58:20 +0100 (CET)
From: Gergely Tamas <dice@mfa.kfki.hu>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <87hf46kifi.wl@pear.hibi-local.net>
Message-ID: <Pine.LNX.4.30.0012151849540.24097-100000@falka.mfa.kfki.hu>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: HIBINO Kei <ex8k-hbn@asahi-net.or.jp>
Cc: linux-lvm@sistina.com

Hi!

> I fixed the above and some problems of pacakges placed under
> 'ftp://ftp.sistina.com/pub/LVM/0.9/binaries/debian/'.
>
> I put this fixed pacakge under
> 'http://www.asahi-net.or.jp/~ex8k-hbn/deb/lvm/'.

Good work.

But here are some remarks to your /etc/init.d/lvm script ...

1]----
if [ ! -f /proc/lvm ]; then
	if [ ! -f /lib/modules/`uname -r`/block/lvm.o -a ! -f /lib/modules/`uname -r`/block/lvm-mod.o ]; then
		exit 0
	fi
fi
------

What if somebody compiled lvm into the kernel, not as a module? This
script doesn't work. :(

2]----
case "$1" in
	start|"")
		echo "Setting up LVM Volume Groups..."
		#/sbin/vgscan
		/sbin/vgchange -a y
		;;
------

Why did you use 'start|""' above? If run without parameters, it should
simply display a usage help.

Thanks,
Gergely
