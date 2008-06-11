Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5BKHbV8019061
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 16:17:37 -0400
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.29])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5BKHNWC023770
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 16:17:23 -0400
Received: by yx-out-2324.google.com with SMTP id 8so363054yxm.81
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 13:17:23 -0700 (PDT)
Message-ID: <c873553d0806111317i6417a45aq1d9add3fd6c73599@mail.gmail.com>
Date: Wed, 11 Jun 2008 15:17:23 -0500
From: "Zarthan South" <zarthan@gmail.com>
Subject: Re: [linux-lvm] which volume is a file on?
In-Reply-To: <484F8DD5.6010901@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_25100_23747656.1213215443225"
References: <c873553d0806101602w30ce13d5o8daf3a02dfc34eb5@mail.gmail.com>
	<484F8DD5.6010901@redhat.com>
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

------=_Part_25100_23747656.1213215443225
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks
I was starting to write some scripts and thought if there was a tool to
determine which LV a file was on it would eliminate a some writing.

On Wed, Jun 11, 2008 at 3:33 AM, Bryn M. Reeves <breeves@redhat.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Zarthan South wrote:
> > Is there a utility or a simple way to determine which volume a file is
> located on.
>
> That's more of a file system question than an LVM question and it's no
> different than any other type of device: find the mount point of the
> file system containing the file and then consult /proc/mounts or the
> output of the mount command to determine what LV the file is on.
>
> If you want to know where the data blocks are located physically you'll
> need to do a bit more work: find the inode location, determine what
> block ranges are allocated to it and then figure out how they map to
> physical device regions using e.g. lvdisplay --maps. The details for
> this step depend on the file system type you are using. For ext2/3 you
> can determine the physical location of a file's data blocks using degbugfs.
>
> Regards,
> Bryn.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iEYEARECAAYFAkhPjdUACgkQ6YSQoMYUY97/MwCgiyszlwRO/oYMR6ABbiITOeBU
> pnMAn3JLz1XNFbVlqx2KGJsgGWfhdhYk
> =MHes
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_25100_23747656.1213215443225
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks<br>I was starting to write some scripts and thought if there was a tool to determine which LV a file was on it would eliminate a some writing. <br><br><div class="gmail_quote">On Wed, Jun 11, 2008 at 3:33 AM, Bryn M. Reeves &lt;<a href="mailto:breeves@redhat.com">breeves@redhat.com</a>&gt; wrote:<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<div class="Ih2E3d"><br>
Zarthan South wrote:<br>
&gt; Is there a utility or a simple way to determine which volume a file is located on.<br>
<br>
</div>That&#39;s more of a file system question than an LVM question and it&#39;s no<br>
different than any other type of device: find the mount point of the<br>
file system containing the file and then consult /proc/mounts or the<br>
output of the mount command to determine what LV the file is on.<br>
<br>
If you want to know where the data blocks are located physically you&#39;ll<br>
need to do a bit more work: find the inode location, determine what<br>
block ranges are allocated to it and then figure out how they map to<br>
physical device regions using e.g. lvdisplay --maps. The details for<br>
this step depend on the file system type you are using. For ext2/3 you<br>
can determine the physical location of a file&#39;s data blocks using degbugfs.<br>
<br>
Regards,<br>
Bryn.<br>
<br>
-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1.4.9 (GNU/Linux)<br>
Comment: Using GnuPG with Fedora - <a href="http://enigmail.mozdev.org" target="_blank">http://enigmail.mozdev.org</a><br>
<br>
iEYEARECAAYFAkhPjdUACgkQ6YSQoMYUY97/MwCgiyszlwRO/oYMR6ABbiITOeBU<br>
pnMAn3JLz1XNFbVlqx2KGJsgGWfhdhYk<br>
=MHes<br>
-----END PGP SIGNATURE-----<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_25100_23747656.1213215443225--
