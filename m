From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm on initrd
Message-ID: <20040126215354.GD30430@percy.comedia.it>
References: <200401240137.35706.arekm@pld-linux.org> <20040124095810.GA6204@percy.comedia.it> <200401252110.07895.arekm@pld-linux.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200401252110.07895.arekm@pld-linux.org>
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
Date: Mon Jan 26 16:55:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jan 25, 2004 at 09:10:07PM +0100, Arkadiusz Miskiewicz wrote:
>Unfortunately this doesn't give any significant size drop:
>lvm staticly linked with uClibc and device-mapper lib with all features
>-rwxr-xr-x    1 misiek   users      555815 2004-01-25 21:05 initrd-lvm
>lvm staticly linked with uClibc and device-mapper lib using my patch above (so 
>only vgscan and vgchange functions available)
>-rwxr-xr-x    1 root     root       482428 2004-01-25 20:51 initrd-lvm
>
>How these sizes look with dietlibc?

-rwxr-xr-x  1 root root 308180 Jan 23 22:14 /sbin/lvm2-static*

Which is still very big, but reducing it will take significantly more
work.

>Also some problems with lvm way of checking what command user wants based on 
>argv[0] came out:
>[root@arm misiek]# /sbin/initrd-lvm
>  No such command.  Try 'help'.
...
>It would be much better if when argv[0] is not known internally for lvm then 
>work as argv[0] = lvm.
>
unfortunately it seems done the other way around in lvm.c
i found it easier to add possible aliases for lvm in there
http://www.comedia.it/~bluca/cooker/lvm2/lvm2-2.00.08-7mdk/lvm2-alternatives.patch.bz2

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
