Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2QGGAet007885
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 12:16:10 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.173])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2QGG0Bf004871
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 12:16:00 -0400
Received: by ug-out-1314.google.com with SMTP id x30so1606208ugc
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 09:15:59 -0700 (PDT)
Message-ID: <8466e51e0703260915g6b3840d5p4c43bc2a670cfd49@mail.gmail.com>
Date: Mon, 26 Mar 2007 18:15:57 +0200
From: "termeau sebastien" <termeau@gmail.com>
Subject: (SOLVED] Re: [linux-lvm] extracting EXT3 from VG
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_275570_26158052.1174925757950"
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

------=_Part_275570_26158052.1174925757950
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2007/3/24, Bryn M. Reeves <breeves@redhat.com>:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> termeau sebastien wrote:
> > Hello,
> >
> > I have an hard drive image in a file.
> > If I try to mount it directly using "mount -o loop my_file.img
> > /mnt/my_dd", fdisk reports
> >   mount: unknown filesystem type 'LVM2_member'
> > This image contains a volume group that itself contains 4 logical vol
> > group.
> > lvscan reports:
> >   LogVol00  2.94GB
> >   LogVol03  64MB
> >   LogVol02  256MB
> >   LogVol01  2.31GB
>
> Put the image file on a loop device, then activate the volume group it
> contains:
>
> losetup /dev/loop0 my_file.img
> vgscan
> vgchange -ay <vg name>
>
> Then you should be able to access it as normal. Just dd the file system
> off the LV device node.
>
> To shut it down:
>
> vgchange -an <vg name>
> losetup -d /dev/loop0
>
> Obviously, change loop0 to something else if 0 is already in use.
>
> Kind regards,
>
> Bryn.
>
>
Thank you for your help it works fine :-)

------=_Part_275570_26158052.1174925757950
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br><div><span class="gmail_quote">2007/3/24, Bryn M. Reeves &lt;<a href="mailto:breeves@redhat.com">breeves@redhat.com</a>&gt;:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
-----BEGIN PGP SIGNED MESSAGE-----<br>Hash: SHA1<br><br>termeau sebastien wrote:<br>&gt; Hello,<br>&gt;<br>&gt; I have an hard drive image in a file.<br>&gt; If I try to mount it directly using &quot;mount -o loop my_file.img
<br>&gt; /mnt/my_dd&quot;, fdisk reports<br>&gt;&nbsp;&nbsp; mount: unknown filesystem type &#39;LVM2_member&#39;<br>&gt; This image contains a volume group that itself contains 4 logical vol<br>&gt; group.<br>&gt; lvscan reports:<br>
&gt;&nbsp;&nbsp; LogVol00&nbsp;&nbsp;2.94GB<br>&gt;&nbsp;&nbsp; LogVol03&nbsp;&nbsp;64MB<br>&gt;&nbsp;&nbsp; LogVol02&nbsp;&nbsp;256MB<br>&gt;&nbsp;&nbsp; LogVol01&nbsp;&nbsp;2.31GB<br><br>Put the image file on a loop device, then activate the volume group it<br>contains:<br><br>losetup /dev/loop0 my_file.img
<br>vgscan<br>vgchange -ay &lt;vg name&gt;<br><br>Then you should be able to access it as normal. Just dd the file system<br>off the LV device node.<br><br>To shut it down:<br><br>vgchange -an &lt;vg name&gt;<br>losetup -d /dev/loop0
<br><br>Obviously, change loop0 to something else if 0 is already in use.<br><br>Kind regards,<br><br>Bryn.<br><br></blockquote></div><br>Thank you for your help it works fine :-)<br>

------=_Part_275570_26158052.1174925757950--
