Message-ID: <00a801c12f01$0f7fefc0$f04b7818@lvcm.com>
From: "Glenn Shannon" <warl0k@lvcm.com>
References: <Pine.A41.3.96.1010827154540.15862G-100000@hadron.tp2.ruhr-uni-bochum.de>
Subject: Re: [linux-lvm] Problems compiling lvm 1.0 and 2.4.x kernel
Date: Mon, 27 Aug 2001 07:03:34 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Actually, I got this same problem with the 2.4.9 kernel...I fixed it by 
installing clean source and using lvm1.0-rc1 instead.

Hope this helps.

Glenn

----- Original Message ----- 
From: "Peter Druck" <peterd@tp2.ruhr-uni-bochum.de>
To: <linux-lvm@sistina.com>
Cc: "Peter Druck" <Peter.Druck@tp2.ruhr-uni-bochum.de>
Sent: Monday, August 27, 2001 6:51 AM
Subject: [linux-lvm] Problems compiling lvm 1.0 and 2.4.x kernel


> Hallo,
> I want to update my lvm from 0.9xx to 1.0. I've downloaded a
> new kernel 2.4.9 (but I also tried it with 2.4.4). After I've
> applied the patch and compile the kernel I get the following
> error. Any idears what goes wrong?
> 
> Peter
> 
> Here is what make says:
> lvm.c:2329: macro `min' used with only 2 args
> lvm.c:2343: macro `min' used with only 2 args
> lvm.c: In function `__extend_reduce':
> lvm.c:2329: parse error before `__x'
> lvm.c:2329: `__x' undeclared (first use in this function)
> lvm.c:2329: (Each undeclared identifier is reported only once
> lvm.c:2329: for each function it appears in.)
> lvm.c:2329: `__y' undeclared (first use in this function)
> lvm.c:2343: `old_stripe_size' undeclared (first use in this function)
> lvm.c:2343: parse error before `__x'
> lvm.c:2280: warning: `end' might be used uninitialized in this function
> lvm.c:2339: warning: `end' might be used uninitialized in this function
> make[3]: *** [lvm.o] Error 1
> make[2]: *** [first_rule] Error 2
> make[1]: *** [_subdir_md] Error 2
> make: *** [_dir_drivers] Error 2
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
