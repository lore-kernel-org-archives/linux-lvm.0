Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A2BF82D.7AB68B9B@tls.msk.ru>
Date: Mon, 04 Dec 2000 23:01:49 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
References: <200012020529.WAA00876@lynx.turbolabs.com> <3A298498.86AB907B@tls.msk.ru> <3A29A31E.BC6A6243@tls.msk.ru> <3A2B58EA.71F92196@tls.msk.ru> <3A2BADF1.A12C700A@tls.msk.ru> <3A2BB554.2D83919E@tls.msk.ru> <3A2BF1E6.55FF3BF6@freeler.nl>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Final Q: i/o with 512 bytes: lvm+raw... [was: Oracle, lvm, rawio, ...]
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

Jorg de Jong wrote:
[]
> I successfully created a tabelspace on a raw device.
> See the attachment...

Oh, Thank you.  Thanks.

Now I have last 2 questions to LVM gurus.

1. 512-byte i/o is ok on 2.4 kernel, and failed on 2.2 kernel.
For example, the following sequence of syscalls:

 open("/dev/raw/raw1", O_RDWR)           = 11
 lseek(11, 0, SEEK_SET)                  = 0
 write(11, "\0\0\0\0\0 \0\0\0\0\0\0]\\[Z\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 8192) = 8192
 lseek(11, 7680, SEEK_SET)               = 7680
 read(11, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 512) = 512

will succed on 2.4 kernel (/dev/raw/raw1 bound to LV), and last read will fail on
2.2 kernel with EINVAL.  Why the difference?
With 1024-byte i/o, it will success on both.

2.  Is it ok to change BLOCK_SIZE in lvm.h to 512?  It seemed to be worked
with that, but I'm not shure for all cases.  What drawbacks can be here?
At least that definition in lvm.h looks strange, since for S390 it is ever
"better" -- 4096, and if I set it that way, lvm+rawio allows me to write
using 4096-bytes io, not 1024...

And for the last.  Does anybody knows why rawio always reports st_blksize=4096?
It seemed to be that st_blksize should match blksize of "underlying" device,
that in case of lvm has BLOCK_SIZE (from lvm.h) st_blksize...

Thanks to all whu answered my (a bit stupid) questions, especially to Jorg de Jong
for his testing with Oracle.

Regards,
 Michael.
