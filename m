Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7CD7Nxa026621
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 09:07:23 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.159])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7CD79NG021025
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 09:07:09 -0400
Received: by fg-out-1718.google.com with SMTP id e21so1501012fga.7
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 06:07:08 -0700 (PDT)
Message-ID: <47311dd20808120607w3a20fe0u2e776d9e86a08a9f@mail.gmail.com>
Date: Tue, 12 Aug 2008 15:07:08 +0200
From: "Pedro Gonzalez Zamora" <pedroche5@gmail.com>
Subject: Re: [linux-lvm] Found duplicate PV 7TGP3THphAvROCTtC4OI2gZrvrAGrn15:
	using /dev/sdah not /dev/sdq Found duplicate PV
	Qbpd3ov1sd3GHCwCQHUzkI00X53lbcDC: using /dev/sdai not /dev/sdr
	Found duplicate PV v0YURmuRm51dfY8br0Bx7XxOOIJyV6oa: using /dev/sdt no
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9535_1260062.1218546428178"
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
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_9535_1260062.1218546428178
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Bryan

How can I configure multipathing if I  have scsi enviroment with multiple
paths?

Best

Pedro

2008/8/12 Bryn M. Reeves <bmr@redhat.com>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Pedro Gonzalez Zamora wrote:
> > Hi all,
> >
> > I'm new in LVM when I execute the command "vgscan -v" I get a message
> below
> > I don't why this message appear
> >
> >
> > Found duplicate PV 7TGP3THphAvROCTtC4OI2gZrvrAGrn15: using /dev/sdah not
> > /dev/sdq
> > Found duplicate PV Qbpd3ov1sd3GHCwCQHUzkI00X53lbcDC: using /dev/sdai not
> > /dev/sdr
> >
> > Anyone Can help me to understand what is the problem and How  can I fix
> it?
> >
> > Bests Regards
> >
> > Pedro G.
>
> Do you have a SAN/fiber/iSCSI environment with multiple paths to the
> storage? If so, then you can configure multipathing and filtering to
> allow LVM to take advantage of the redundant paths to the storage.
>
> If you don't have a multipath environment then you need to figure out
> why these two devices seem to have the same content. Could they have
> been copied (dd, some clever storage mirroring thingamy? broken (split)
> RAID1 mirror?).
>
> Regards,
> Bryn.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFIoXR56YSQoMYUY94RAigRAKCIh7YRDyiXjqK0rIxuBRbUbTHTvACbBoAL
> WB4BOU4CoOlPxs95s6OvNBg=
> =0GU3
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_9535_1260062.1218546428178
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Hi Bryan<br><br>How can I configure multipathing if I&nbsp; have scsi enviroment with multiple paths?<br><br>Best<br><br>Pedro<br><br><div class="gmail_quote">2008/8/12 Bryn M. Reeves <span dir="ltr">&lt;<a href="mailto:bmr@redhat.com">bmr@redhat.com</a>&gt;</span><br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<div><div></div><div class="Wj3C7c"><br>
Pedro Gonzalez Zamora wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I&#39;m new in LVM when I execute the command &quot;vgscan -v&quot; I get a message below<br>
&gt; I don&#39;t why this message appear<br>
&gt;<br>
&gt;<br>
&gt; Found duplicate PV 7TGP3THphAvROCTtC4OI2gZrvrAGrn15: using /dev/sdah not<br>
&gt; /dev/sdq<br>
&gt; Found duplicate PV Qbpd3ov1sd3GHCwCQHUzkI00X53lbcDC: using /dev/sdai not<br>
&gt; /dev/sdr<br>
&gt;<br>
&gt; Anyone Can help me to understand what is the problem and How &nbsp;can I fix it?<br>
&gt;<br>
&gt; Bests Regards<br>
&gt;<br>
&gt; Pedro G.<br>
<br>
</div></div>Do you have a SAN/fiber/iSCSI environment with multiple paths to the<br>
storage? If so, then you can configure multipathing and filtering to<br>
allow LVM to take advantage of the redundant paths to the storage.<br>
<br>
If you don&#39;t have a multipath environment then you need to figure out<br>
why these two devices seem to have the same content. Could they have<br>
been copied (dd, some clever storage mirroring thingamy? broken (split)<br>
RAID1 mirror?).<br>
<br>
Regards,<br>
Bryn.<br>
<br>
-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1.4.7 (GNU/Linux)<br>
Comment: Using GnuPG with Fedora - <a href="http://enigmail.mozdev.org" target="_blank">http://enigmail.mozdev.org</a><br>
<br>
iD8DBQFIoXR56YSQoMYUY94RAigRAKCIh7YRDyiXjqK0rIxuBRbUbTHTvACbBoAL<br>
WB4BOU4CoOlPxs95s6OvNBg=<br>
=0GU3<br>
-----END PGP SIGNATURE-----<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br></div>

------=_Part_9535_1260062.1218546428178--
