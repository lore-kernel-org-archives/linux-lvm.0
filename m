Return-Path: <carenas@chasqui.lared.net.pe>
Date: Mon, 23 Apr 2001 21:47:49 -0500 (PET)
From: Carlo Marcelo Arenas Belon <carenas@chasqui.lared.net.pe>
Subject: Re: [linux-lvm] Need help with LVM on RedHat 7.1
In-Reply-To: <3AE47CC3.149B6725@sc.prepass.com>
Message-ID: <Pine.LNX.4.33.0104232136260.13970-100000@chasqui.LaRed.net.pe>
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
To: linux-lvm@sistina.com

> Thanks, but I usually don't use Beta on a production box and
> also RedHat 7.1 comes with a rather old version of lvm, I think 0.8final.

sorry, i think i didn't make myself clear.

RedHat 7.1 DOESN'T come with lvm enabled, because the lvm that is inside
the kernel (not RedHat's but the one from Linus) and that they ship
(2.4.2-2) is a broken one (0.9.1beta2)

they didn't package the lvm userland utilities neither, i guess because of
that.

BUT, you can make it work easily if you download the kernel module and
userland utilities and patch your kernel as explained on sistina's
documentation.

i just happened to make it work this way on a Red Hat 7.1 beta system
using the 0.9.1beta6 tar from sistina, so i think this should work on a
Red Hat 7.1 final system.

> But the compile errors I'm getting are two basics to have passed QA of
> any distributor...I just recompiled again with only LVM enabled and not RAID
> and MD
> and was getting syntactical errors (compile errors) leaving to belive that
> some .h
> file is missing.

i guess just because noone even QA this kind of configuration ;)

> I will try the 'make mrproprer', maybe that'll fix it...

i hope so, as the kernel should compile, after all, RedHat need to compile
it in order to package.

but as i explained before, having an lvm module on your kernel is just one
step on having an lvm working system, you are going to need the lvm
userland utilities, and the ones that match your kernel module.

that is why i sugested to better download a new kernel module/userland and
patch your kernel before even compiling.

also don't forget to change your /etc/init.d/halt script as explained on
the sistina's documentation.

and as for running "betas" on production, don't forget that the 0.9.1lvm
is still on beta.

best regards,

Carlo
