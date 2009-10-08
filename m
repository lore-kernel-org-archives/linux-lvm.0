Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n98LiQVu020796
	for <linux-lvm@redhat.com>; Thu, 8 Oct 2009 17:44:26 -0400
Received: from mail-pz0-f187.google.com (mail-pz0-f187.google.com
	[209.85.222.187])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n98Li7wk010738
	for <linux-lvm@redhat.com>; Thu, 8 Oct 2009 17:44:07 -0400
Received: by pzk17 with SMTP id 17so272283pzk.6
	for <linux-lvm@redhat.com>; Thu, 08 Oct 2009 14:44:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0910081523100.26436@bmsred.bmsi.com>
References: <99f624940910081142q8e3388br8fb2fdd61e0874fe@mail.gmail.com>
	<Pine.LNX.4.64.0910081523100.26436@bmsred.bmsi.com>
Date: Thu, 8 Oct 2009 14:44:07 -0700
Message-ID: <99f624940910081444o3fa2d177w8b7d55a1417b4d5a@mail.gmail.com>
Subject: Re: [linux-lvm] Corrupted LV after resize2fs crashed when adding new 
	disk to LV
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd28d12e98bde0475735c47
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

--000e0cd28d12e98bde0475735c47
Content-Type: text/plain; charset=ISO-8859-1

The gods of Linux must be watching over me . I shall never blaspheme against
Linux again!

I had removed the new drive from the VG, then restored the VG (vgrestore) to
an archived version created before I had added the drive to the PV. I then
added the drive back to the VG (vgextend), extended the LV partition to the
max (lvextend), then resized the LV (resize2fs). Oh, before I could do the
resize, I had to run e2fsck, which praise the gods, ran successfully. As did
the resize.

I re-ran e2fsck (with -f) and ir ran 100% successful and clean.

And then the piece de resistance - I mounted the LV and everything was as I
orginally wanted. The old data was still there and valid, and the new size
of the LV was the original + the new disk!!!!!

I don't know what I did to make this work. I all seems magical to me now. As
with Stuart's below:

Disclaimer, I am (in no way, shape or form) an LV expert.

Thanks all.

ken

PS:

"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

This is from Mozart's unfinished Requiem. If you watch the movie Amadeus, it
is at the end right before he dies. I don't know Latin very well, but I
think it has something to do with the burning flames of h*ll :-).


On Thu, Oct 8, 2009 at 12:37 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:

>
> On Thu, 8 Oct 2009, Ken Bass wrote:
>
> Look at your metadata backups, and see if you can find the version with
> the larger LV.  Look at the timestamp on the revert to get a clue on
> how it got reverted.
>
> First, I would make a copy of what you got (it will fit on a cheap
> external USB disk) before making any more mods.  Then restore the metadata
> to the extended LV before retrying e2fsck.
>
> Disclaimer, I am not an LVM expert.
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--000e0cd28d12e98bde0475735c47
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

The gods of Linux must be watching over me . I shall never blaspheme agains=
t Linux again!<br><br>I had removed the new drive from the VG, then restore=
d the VG (vgrestore) to an archived version created before I had added the =
drive to the PV. I then added the drive back to the VG (vgextend), extended=
 the LV partition to the max (lvextend), then resized the LV (resize2fs). O=
h, before I could do the resize, I had to run e2fsck, which praise the gods=
, ran successfully. As did the resize. <br>
<br>I re-ran e2fsck (with -f) and ir ran 100% successful and clean.<br><br>=
And then the piece de resistance - I mounted the LV and everything was as I=
 orginally wanted. The old data was still there and valid, and the new size=
 of the LV was the original + the new disk!!!!!<br>
<br>I don&#39;t know what I did to make this work. I all seems magical to m=
e now. As with Stuart&#39;s below: <br><br>Disclaimer, I am (in no way, sha=
pe or form) an LV expert.<br><br>Thanks all.<br><br>ken<br><br>PS:<br><br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background so=
ng for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commer=
cial.<br>=A0
<br>This is from Mozart&#39;s unfinished Requiem. If you watch the movie Am=
adeus, it is at the end right before he dies. I don&#39;t know Latin very w=
ell, but I think it has something to do with the burning flames of h*ll :-)=
.<br>
<br><br><div class=3D"gmail_quote">On Thu, Oct 8, 2009 at 12:37 PM, Stuart =
D. Gathman <span dir=3D"ltr">&lt;<a href=3D"mailto:stuart@bmsi.com">stuart@=
bmsi.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; p=
adding-left: 1ex;">
<br><div class=3D"im">On Thu, 8 Oct 2009, Ken Bass wrote:<br>
<br>
</div>Look at your metadata backups, and see if you can find the version wi=
th<br>
the larger LV. =A0Look at the timestamp on the revert to get a clue on<br>
how it got reverted.<br>
<br>
First, I would make a copy of what you got (it will fit on a cheap<br>
external USB disk) before making any more mods. =A0Then restore the metadat=
a<br>
to the extended LV before retrying e2fsck.<br>
<br>
Disclaimer, I am not an LVM expert.<br>
<br>
--<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0Stuart D. Gathman &lt;<a href=3D"mailto:stuart@=
bmsi.com">stuart@bmsi.com</a>&gt;<br>
 =A0 =A0Business Management Systems Inc. =A0Phone: 703 591-0911 Fax: 703 59=
1-6154<br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background so=
ng for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commer=
cial.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

--000e0cd28d12e98bde0475735c47--
