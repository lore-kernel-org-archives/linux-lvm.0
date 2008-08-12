Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7CEARZl020661
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 10:10:27 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.152])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7CEAMnu002397
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 10:10:23 -0400
Received: by fg-out-1718.google.com with SMTP id e21so1516812fga.7
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 07:10:22 -0700 (PDT)
Message-ID: <47311dd20808120710h48268c0uc941b28dca2eb903@mail.gmail.com>
Date: Tue, 12 Aug 2008 16:10:22 +0200
From: "Pedro Gonzalez Zamora" <pedroche5@gmail.com>
Subject: Re: [linux-lvm] Found duplicate PVs
In-Reply-To: <48A192B7.7000108@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_10254_32756604.1218550222084"
References: <47311dd20808120424w30a33b88uf8418db1f411a52d@mail.gmail.com>
	<48A1747A.8060808@redhat.com> <48A186A7.3050901@kadzban.is-a-geek.net>
	<48A192B7.7000108@redhat.com>
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

------=_Part_10254_32756604.1218550222084
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The messages "Found duplicate PVs" disappear when I add this line in
lvm.conf:

      filter = [ "a/sd[a-r]$/" , "r/.*/" ]

But I don't know  if it is a good solution?

Best

Pedro


2008/8/12 Bryn M. Reeves <bmr@redhat.com>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Bryan Kadzban wrote:
> > Bryn M. Reeves wrote:
> >>> broken (split) RAID1 mirror?
> >
> > Alternately, software RAID1 -- either a dm-raid type setup (most onboard
> > "RAID controllers", and in fact almost every consumer "RAID" device) or
> > md?
>
> That's exactly what I meant by a split/broken RAID1 mirror - either two
> disks being presented as SCSI/ATA devices when they contain an array or
> an array "controller" (fakeraid) using the wrong drivers. Unlikely to be
> MD since LVM2 already performs MD component detection (enabled by
> default iirc) and will use the MD device in preference to components.
>
> > You can control which devices get scanned by editing the "filter" option
> > in /etc/lvm/lvm.conf -- you can make it only include the RAID array
> > device (/dev/mapper/whatever or /dev/mdX), instead of the member drives
> > (/dev/sdXY).
>
> Shouldn't be needed for MD devices - just make sure you have:
>
> devices {
> [...]
>    md_component_detection = 1
> }
>
> Somewhere in your lvm.conf. As you say, this is most common with dmraid
>  since the "controller" is just a regular ATA part with some BIOS goop
> and a bit of metadata on the disks but you can get the same sort of
> behavior with "real" RAID controllers in some cases.
>
> > (And this is probably just a special case of the "broken (split) RAID1
> > mirror" possibility that Bryn was talking about.)
>
> Yup :)
>
> Regards,
> Bryn.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFIoZK36YSQoMYUY94RAid3AKDFmEtVBuIBCKOhNJbsC70oVcRdzgCdFRQs
> BjW8XPFFatq0y8GpER6GI+c=
> =vplQ
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_10254_32756604.1218550222084
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr"><br>The messages &quot;Found duplicate PVs&quot; disappear when I add this line in lvm.conf:<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filter = [ &quot;a/sd[a-r]$/&quot; , &quot;r/.*/&quot; ]<br><br>But I don&#39;t know&nbsp; if it is a good solution?<br>
<br>Best<br><br>Pedro<br><br><br><div class="gmail_quote">2008/8/12 Bryn M. Reeves <span dir="ltr">&lt;<a href="mailto:bmr@redhat.com">bmr@redhat.com</a>&gt;</span><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<div class="Ih2E3d"><br>
Bryan Kadzban wrote:<br>
&gt; Bryn M. Reeves wrote:<br>
&gt;&gt;&gt; broken (split) RAID1 mirror?<br>
&gt;<br>
&gt; Alternately, software RAID1 -- either a dm-raid type setup (most onboard<br>
&gt; &quot;RAID controllers&quot;, and in fact almost every consumer &quot;RAID&quot; device) or<br>
&gt; md?<br>
<br>
</div>That&#39;s exactly what I meant by a split/broken RAID1 mirror - either two<br>
disks being presented as SCSI/ATA devices when they contain an array or<br>
an array &quot;controller&quot; (fakeraid) using the wrong drivers. Unlikely to be<br>
MD since LVM2 already performs MD component detection (enabled by<br>
default iirc) and will use the MD device in preference to components.<br>
<div class="Ih2E3d"><br>
&gt; You can control which devices get scanned by editing the &quot;filter&quot; option<br>
&gt; in /etc/lvm/lvm.conf -- you can make it only include the RAID array<br>
&gt; device (/dev/mapper/whatever or /dev/mdX), instead of the member drives<br>
&gt; (/dev/sdXY).<br>
<br>
</div>Shouldn&#39;t be needed for MD devices - just make sure you have:<br>
<br>
devices {<br>
[...]<br>
 &nbsp; &nbsp;md_component_detection = 1<br>
}<br>
<br>
Somewhere in your lvm.conf. As you say, this is most common with dmraid<br>
&nbsp;since the &quot;controller&quot; is just a regular ATA part with some BIOS goop<br>
and a bit of metadata on the disks but you can get the same sort of<br>
behavior with &quot;real&quot; RAID controllers in some cases.<br>
<div class="Ih2E3d"><br>
&gt; (And this is probably just a special case of the &quot;broken (split) RAID1<br>
&gt; mirror&quot; possibility that Bryn was talking about.)<br>
<br>
</div>Yup :)<br>
<br>
Regards,<br>
Bryn.<br>
<div class="Ih2E3d">-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1.4.7 (GNU/Linux)<br>
</div>Comment: Using GnuPG with Fedora - <a href="http://enigmail.mozdev.org" target="_blank">http://enigmail.mozdev.org</a><br>
<br>
iD8DBQFIoZK36YSQoMYUY94RAid3AKDFmEtVBuIBCKOhNJbsC70oVcRdzgCdFRQs<br>
BjW8XPFFatq0y8GpER6GI+c=<br>
=vplQ<br>
<div><div></div><div class="Wj3C7c">-----END PGP SIGNATURE-----<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br></div>

------=_Part_10254_32756604.1218550222084--
