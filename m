Message-ID: <3B967E63.3020302@st-peter.stw.uni-erlangen.de>
Date: Wed, 05 Sep 2001 21:34:59 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] rh kernel patches
References: <B45465FD9C23D21193E90000F8D0F3DF404FF4@mailsrv.linkvest.com>
Content-Type: multipart/mixed;
 boundary="------------020206010705000900000808"
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
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------020206010705000900000808
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

hi tried adding the macros but it didn't work for me


Jean-Eric Cuendet wrote:

>Hi,
>I have patched RH 2.4.7 kernel successfully. I understand what you want
>to do and must say that it's a *good* thing for 2 reasons:
>- having ext3 in the kernel
>- having quotas3 in the kernel
>
>To do so, get the redhat sources. Put them in <srcdir> (Ex:
>/tmp/linux-2.4.7-rh)
>Get the LVM 1.0.1rc2 (not another release) and uncompress them (Ex:
>/tmp/LVM/1.0.1rc2)
>Then, go in .../LVM/1.0.1-rc2 and run ./configure
>--with-kernel_dir=<srcdir>
>Then make, make install the tools (Note that kernel is not touch at this
>point). They yre mandatory to make your LVM system working.
>Then go in <srcdir>, and patch your kernel with a patch made by
>configure just for your kernel. It's in
>.../LVM/1.0.1rc2/PATCHES/lvm_1.0.1rc2-2.4.7.<snip>.patch. It was created
>by configure for the kernel you gave in <srcdir>
>Then patch it with:
>- cd <srcdir>
>- patch -p1 < .../LVM/1.0.1rc2/PATCHES/lvm.<snip>.patch
>
>And you are done. (quite...)
>Then make bzImage will compile it, except for a little thing: min/max
>functions. RH kernel is made from Alan Cox one. And Linus kernel changed
>min/max functions. LVM uses Linus min/max functions while -ac (RedHat)
>kernel uses old min/max functions.
>
>During the compilation, you'll get errors with files in drivers/md/.
>They are lvm.c, lvm-snap.c and perhaps a third I don't remember. To
>correct those, just copy the 2 macros in each fault file:
>#define min(a,b) (((a)<(b))?(a):(b))
>#define max(a,b) (((a)>(b))?(a):(b))
>At the beginning of the file (before anything else).
>
>And compile with work.
>
>But if you don't need ext3 nor quotas3, then go with a plain Linus
>kernel (available at www.kernel.org), you'll have less problems... :-)
>
>Ask for more help
>-jec
>
>>-----Original Message-----
>>From: Pierre Lamb [mailto:plamb_98@yahoo.com] 
>>Sent: mardi, 4. septembre 2001 19:56
>>To: linux-lvm@sistina.com
>>Subject: [linux-lvm] rh kernel patches
>>
>>
>>Is there a correct way to patch RH kernels. I have
>>tried using the "final path" to update 2.4.7 rh kernel
>>but just get errors. Is there a work around for this
>>problem.
>>
>>Pierre
>>
>>__________________________________________________
>>Do You Yahoo!?
>>Get email alerts & NEW webcam video instant messaging with 
>>Yahoo! Messenger http://im.yahoo.com
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com 
>>http://lists.sistina.com/mailman/listinfo/linu> x-lvm
>>read the 
>>LVM HOW-TO at 
>>http://www.sistina.com/lvm/Pages/howto.html
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>


--------------020206010705000900000808
Content-Type: text/plain;
 name="lvm-1.0.1rc2-2.4.5"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lvm-1.0.1rc2-2.4.5"

/usr/bin/kgcc -D__KERNEL__ -I/usr/src/linux-2.4.5/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe  -march=i686    -c -o lvm.o lvm.c
lvm.c: In function `__extend_reduce':
lvm.c:2329: warning: implicit declaration of function `min'
lvm.c:2329: parse error before `uint'
lvm.c:2343: parse error before `uint'
lvm.c:2280: warning: `end' might be used uninitialized in this function
lvm.c:2339: warning: `end' might be used uninitialized in this function
make[3]: *** [lvm.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.5/drivers/md'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.5/drivers/md'
make[1]: *** [_subdir_md] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.5/drivers'
make: *** [_dir_drivers] Error 2


##########################################################################################################
and after adding 

#define min(a,b) (((a)<(b))?(a):(b)) 
#define max(a,b) (((a)>(b))?(a):(b)) 
##########################################################################################################


make[3]: Entering directory `/usr/src/linux-2.4.5/drivers/md'
/usr/bin/kgcc -D__KERNEL__ -I/usr/src/linux-2.4.5/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe  -march=i686    -c -o lvm.o lvm.c
lvm.c:2332: macro `min' used with too many (3) args
lvm.c:2346: macro `min' used with too many (3) args
lvm.c: In function `__extend_reduce':
lvm.c:2332: parse error before `<'
lvm.c:2332: parse error before `:'
lvm.c:2346: parse error before `<'
lvm.c:2346: parse error before `:'
lvm.c:2283: warning: `end' might be used uninitialized in this function
lvm.c:2342: warning: `end' might be used uninitialized in this function
make[3]: *** [lvm.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.5/drivers/md'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.5/drivers/md'
make[1]: *** [_subdir_md] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.5/drivers'
make: *** [_dir_drivers] Error 2
--------------020206010705000900000808--
