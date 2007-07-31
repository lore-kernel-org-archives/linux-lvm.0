Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6VET5O1017522
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2007 10:29:06 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.249])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6VET4bR027308
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2007 10:29:04 -0400
Received: by an-out-0708.google.com with SMTP id c31so427789ana
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2007 07:29:03 -0700 (PDT)
Message-ID: <ca3f4a240707310729t72de8478mb80b6f1b2431a9f0@mail.gmail.com>
Date: Tue, 31 Jul 2007 09:29:03 -0500
From: "Allan Wolfe" <allan.wolfe@gmail.com>
Subject: Re: [linux-lvm] disk recovery - mounting external USB lvm2 volume
In-Reply-To: <469DEBB4.5080602@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_50969_20515197.1185892143085"
References: <ca3f4a240707151830q4cd06100hbaea5969e4589258@mail.gmail.com>
	<20070716014007.GA31102@bdmcc-us.com>
	<ca3f4a240707161928y94deabr15839a6b6eb554ef@mail.gmail.com>
	<20070717031215.GB24644@bdmcc-us.com>
	<ca3f4a240707171841w626b2a41o7cc07d14111ebea9@mail.gmail.com>
	<469DEBB4.5080602@redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_50969_20515197.1185892143085
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks Bryn for the added info.

I finally wound back around to finish the renaming of my local volume name.
It was successful after figuring out that the lvm commands are packaged as
the single "lvm" command on the Fedora Rescue CD.  I also discovered that
the initrd had to be expanded and modified and repacked.  There was a
reference there as well.

Thanks for your help.

On 7/18/07, Bryn M. Reeves <breeves@redhat.com> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Allan Wolfe wrote:
> > Yes.  The grub.conf does refer to the logical volume.  I also see
> > /etc/blkid/blkid.tab which looks like it is built at boot time (kudzu?).
> >
>
> The /etc/blkid/blkid.tab file is the libblkid persistent device cache.
> It's used by the blkid command and other users of the library (e.g.
> e2fsprogs). It's always validated prior to use and is indexed by UUID,
> label etc, so there's no need to worry about updating it when device
> nodes change.
>
> Kind regards,
> Bryn.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFGneu06YSQoMYUY94RAg2oAKCABfby/SZtrOyLZ8zTZcr1FdKzjwCgj9Tn
> Z9Axek7SWivOMiBbSYxOjCs=
> =ySEM
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_50969_20515197.1185892143085
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks Bryn for the added info. <br><br>I finally wound back around to finish the renaming of my local volume name.&nbsp; It was successful after figuring out that the lvm commands are packaged as the single &quot;lvm&quot; command on the Fedora Rescue CD.&nbsp; I also discovered that the initrd had to be expanded and modified and repacked.&nbsp; There was a reference there as well.
<br><br>Thanks for your help.<br><br><div><span class="gmail_quote">On 7/18/07, <b class="gmail_sendername">Bryn M. Reeves</b> &lt;<a href="mailto:breeves@redhat.com">breeves@redhat.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
-----BEGIN PGP SIGNED MESSAGE-----<br>Hash: SHA1<br><br>Allan Wolfe wrote:<br>&gt; Yes.&nbsp;&nbsp;The grub.conf does refer to the logical volume.&nbsp;&nbsp;I also see<br>&gt; /etc/blkid/blkid.tab which looks like it is built at boot time (kudzu?).
<br>&gt;<br><br>The /etc/blkid/blkid.tab file is the libblkid persistent device cache.<br>It&#39;s used by the blkid command and other users of the library (e.g.<br>e2fsprogs). It&#39;s always validated prior to use and is indexed by UUID,
<br>label etc, so there&#39;s no need to worry about updating it when device<br>nodes change.<br><br>Kind regards,<br>Bryn.<br>-----BEGIN PGP SIGNATURE-----<br>Version: GnuPG v1.4.7 (GNU/Linux)<br>Comment: Using GnuPG with Fedora - 
<a href="http://enigmail.mozdev.org">http://enigmail.mozdev.org</a><br><br>iD8DBQFGneu06YSQoMYUY94RAg2oAKCABfby/SZtrOyLZ8zTZcr1FdKzjwCgj9Tn<br>Z9Axek7SWivOMiBbSYxOjCs=<br>=ySEM<br>-----END PGP SIGNATURE-----<br><br>_______________________________________________
<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at 
<a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_50969_20515197.1185892143085--
