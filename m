Date: Sun, 22 Oct 2000 16:09:40 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] using previously created lvm
Message-ID: <20001022160940.B24630@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <000401c03a8e$4861a620$a200a8c0@babbage.siliconinfusion.com> <20001020154123.A10018@colombina.comedia.it> <yq1puku53kx.fsf@jaguar.mkp.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yq1puku53kx.fsf@jaguar.mkp.net>; from mkp@linuxcare.com on Sat, Oct 21, 2000 at 04:42:06PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <mkp@linuxcare.com>
Cc: linux-lvm@msede.com

On Sat, Oct 21, 2000 at 04:42:06PM -0400, Martin K. Petersen wrote:
> >>>>> "Luca" == Luca Berra <bluca@comedia.it> writes:
> 
> [HP/UX -> Linux]
> 
> Luca> besides Linux does not support HFS Filesystems. 
> 
> Actually, I implemented HFS support in Linux ufs when we started the
> PA-RISC port.  It's been included in the 2.[34] kernels for quite a
> while now...
Another well hidden secret :(
it is not documented anywhere except in /usr/src/linux/fs/ufs/super.c,
besides as of 2.4.0-test8 it seems read-only.

Anyway this is good news!!

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
