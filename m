Return-Path: <heartboy@nycap.rr.com>
From: Joe Morris <heartboy@nycap.rr.com>
Subject: Re: [linux-lvm] unresolved SYMBOL get_hardblocksize during modules generation
Date: Tue, 24 Jul 2001 11:57:40 -0400
References: <OF40000665.5AD9BBC9-ONC1256A93.0052DCBF@coface.com>
In-Reply-To: <OF40000665.5AD9BBC9-ONC1256A93.0052DCBF@coface.com>
MIME-Version: 1.0
Message-Id: <01072411574000.04697@alb-66-66-255-20>
Content-Transfer-Encoding: 8bit
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

On Tuesday 24 July 2001 11:09 am, you wrote:
> Good afternoon,
>
> I am trying to build 2.4.7 kernel with lvm-0.9.1_beta7-2.4.7.patch and I
> have this error during modules build :
>
> gcc -D__KERNEL__ -I/usr/src/linux-2.4.7/include -Wall -Wstrict-prototypes
> -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common
> -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE -DMODVERSIONS
> -include /usr/src/linux-2.4.7/include/linux/modversions.h   -c -o lvm.o
> lvm.c
> lvm.c: In function `__update_hardblocksize':
> lvm.c:1794: warning: implicit declaration of function `get_hardblocksize'
>
> I don't find in the kernel tree directory this function, is it a problem
> with the LVM patch or the level of the kernel.
>
> Thanks by advance to help to achieve the build of this kernel.
>
> Regards.
>
> T. DANJEAN

Did you try replacing all the get_hardblocksize with get_hardsect_size?
Joe
