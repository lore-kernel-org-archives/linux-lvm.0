Return-Path: <medi@sc.prepass.com>
Message-ID: <3AE56CDB.C9ADDCF7@sc.prepass.com>
Date: Tue, 24 Apr 2001 05:09:00 -0700
From: Medi Montaseri <medi@sc.prepass.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Need help with LVM on RedHat 7.1
References: <Pine.LNX.4.33.0104232136260.13970-100000@chasqui.LaRed.net.pe>
Content-Type: multipart/alternative;
 boundary="------------0ECB66727D2C59C55D09E856"
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

--------------0ECB66727D2C59C55D09E856
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I appreciate your support on this...

What is your opinion on RAID-0 or Linear vs LVM.
In my application, I was simply trying to concatnate four 75Gig disks to create
one large disk for a backup server. I decided on RAID-0.

Carlo Marcelo Arenas Belon wrote:

> > Thanks, but I usually don't use Beta on a production box and
> > also RedHat 7.1 comes with a rather old version of lvm, I think 0.8final.
>
> sorry, i think i didn't make myself clear.
>
> RedHat 7.1 DOESN'T come with lvm enabled, because the lvm that is inside
> the kernel (not RedHat's but the one from Linus) and that they ship
> (2.4.2-2) is a broken one (0.9.1beta2)
>
> they didn't package the lvm userland utilities neither, i guess because of
> that.
>
> BUT, you can make it work easily if you download the kernel module and
> userland utilities and patch your kernel as explained on sistina's
> documentation.
>
> i just happened to make it work this way on a Red Hat 7.1 beta system
> using the 0.9.1beta6 tar from sistina, so i think this should work on a
> Red Hat 7.1 final system.
>
> > But the compile errors I'm getting are two basics to have passed QA of
> > any distributor...I just recompiled again with only LVM enabled and not RAID
> > and MD
> > and was getting syntactical errors (compile errors) leaving to belive that
> > some .h
> > file is missing.
>
> i guess just because noone even QA this kind of configuration ;)
>
> > I will try the 'make mrproprer', maybe that'll fix it...
>
> i hope so, as the kernel should compile, after all, RedHat need to compile
> it in order to package.
>
> but as i explained before, having an lvm module on your kernel is just one
> step on having an lvm working system, you are going to need the lvm
> userland utilities, and the ones that match your kernel module.
>
> that is why i sugested to better download a new kernel module/userland and
> patch your kernel before even compiling.
>
> also don't forget to change your /etc/init.d/halt script as explained on
> the sistina's documentation.
>
> and as for running "betas" on production, don't forget that the 0.9.1lvm
> is still on beta.
>
> best regards,
>
> Carlo
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--
=======================================================================
Medi Montaseri, medi@prepass.com, 408-450-7114
Prepass Inc, IT/Operations, Software Eng.
=======================================================================



--------------0ECB66727D2C59C55D09E856
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
I appreciate your support on this...
<p>What is your opinion on RAID-0 or Linear vs LVM.
<br>In my application, I was simply trying to concatnate four 75Gig disks
to create
<br>one large disk for a backup server. I decided on RAID-0.
<p>Carlo Marcelo Arenas Belon wrote:
<blockquote TYPE=CITE>> Thanks, but I usually don't use Beta on a production
box and
<br>> also RedHat 7.1 comes with a rather old version of lvm, I think 0.8final.
<p>sorry, i think i didn't make myself clear.
<p>RedHat 7.1 DOESN'T come with lvm enabled, because the lvm that is inside
<br>the kernel (not RedHat's but the one from Linus) and that they ship
<br>(2.4.2-2) is a broken one (0.9.1beta2)
<p>they didn't package the lvm userland utilities neither, i guess because
of
<br>that.
<p>BUT, you can make it work easily if you download the kernel module and
<br>userland utilities and patch your kernel as explained on sistina's
<br>documentation.
<p>i just happened to make it work this way on a Red Hat 7.1 beta system
<br>using the 0.9.1beta6 tar from sistina, so i think this should work
on a
<br>Red Hat 7.1 final system.
<p>> But the compile errors I'm getting are two basics to have passed QA
of
<br>> any distributor...I just recompiled again with only LVM enabled and
not RAID
<br>> and MD
<br>> and was getting syntactical errors (compile errors) leaving to belive
that
<br>> some .h
<br>> file is missing.
<p>i guess just because noone even QA this kind of configuration ;)
<p>> I will try the 'make mrproprer', maybe that'll fix it...
<p>i hope so, as the kernel should compile, after all, RedHat need to compile
<br>it in order to package.
<p>but as i explained before, having an lvm module on your kernel is just
one
<br>step on having an lvm working system, you are going to need the lvm
<br>userland utilities, and the ones that match your kernel module.
<p>that is why i sugested to better download a new kernel module/userland
and
<br>patch your kernel before even compiling.
<p>also don't forget to change your /etc/init.d/halt script as explained
on
<br>the sistina's documentation.
<p>and as for running "betas" on production, don't forget that the 0.9.1lvm
<br>is still on beta.
<p>best regards,
<p>Carlo
<p>_______________________________________________
<br>linux-lvm mailing list
<br>linux-lvm@sistina.com
<br><a href="http://lists.sistina.com/mailman/listinfo/linux-lvm">http://lists.sistina.com/mailman/listinfo/linux-lvm</a></blockquote>

<pre>--&nbsp;
=======================================================================
Medi Montaseri, medi@prepass.com, 408-450-7114
Prepass Inc, IT/Operations, Software Eng.
=======================================================================</pre>
&nbsp;</html>

--------------0ECB66727D2C59C55D09E856--
