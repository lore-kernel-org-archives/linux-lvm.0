Date: Mon, 14 Feb 2000 17:28:28 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Library strangeness
Message-ID: <20000214172828.D12623@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <Pine.LNX.4.10.10002090009460.18572-100000@greebo.jj.net>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.10.10002090009460.18572-100000@greebo.jj.net>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I tought i posted a patch eons ago. (lvm-0.7)

On Wed, Feb 09, 2000 at 12:11:18AM +0000, James Pattinson wrote:
> [root@greebo][/root]# ldd `which vgscan`
>         /lib/libNoVersion.so.1 => /lib/libNoVersion.so.1 (0x40014000)
		^^^^^^^^
you should use gcc to link files with glibc2.x

> I think this could be the offending line, from tools/Makefile:
> 
> XLINKER = -Xlinker -rpath $(TOP)/tools/lib -Xlinker -rpath /lib -Xlinker
> 
i believe the rpath junk can be removed for production, and can be
superseded by LD_LIBRARY_PATH in testing environments

regards,
Luca

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
