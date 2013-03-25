Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2PLp0Nj008595
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 17:51:00 -0400
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2PLowSW032393
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 17:50:59 -0400
Received: by mail-vc0-f175.google.com with SMTP id hf12so5106459vcb.34
	for <linux-lvm@redhat.com>; Mon, 25 Mar 2013 14:50:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5150C1F8.8090107@bmsi.com>
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
Date: Mon, 25 Mar 2013 21:50:58 +0000
Message-ID: <CA+iDeo3Z80XNNzW4v9jwp4VuCi+L18RADtAi5WVcRXD68E8k3g@mail.gmail.com>
From: =?ISO-8859-1?Q?Bj=F6rn_Nadrowski?= <bjrnfrdnnd@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c1ed3ed612e604d8c6ccb3
Subject: Re: [linux-lvm] vg disappeared after replacing disc in raid10
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--001a11c1ed3ed612e604d8c6ccb3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Well, I see I would have to remove the volume group first, at the very
least.
Should I just issue

sudo vgremove vol0

followed by

sudo pvremove /dev/127

and followed by

sudo pvcreate --uuid WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26 --restorefile
vol0.t
xt /dev/md127

?

But I would just be back in the middle of my problem description on
ubuntuforums, wouldn' t I?
Still no volume group, still no logical volumes...


On Mon, Mar 25, 2013 at 9:30 PM, Stuart D Gathman <stuart@bmsi.com> wrote:

> Long ago, Nostradamus foresaw that on 03/25/2013 04:46 PM, Bj=F6rn
> Nadrowski would write:
> > Recreation of the volume group seemed  a good idea as I only had one
> volume group on the pv and therefore I did not see how this could have
> destroyed anything.
> > The (human-readable) data at the beginning of the device /dev/md127 is
> still there and does display the same information. Please see my posting
> Recreating the vg overwrites the human-readable data at the beginning of
> the device.  You claim that it is "still there" and is the "same
> information".  But this cannot be true because originally that
> information had your LV data, and now (apparently) it does not.  Do you
> see your LVs when looking at the vg metadata with an editor??   What do
> you mean by "displays the same information"?  Does lvs list your LVs?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001a11c1ed3ed612e604d8c6ccb3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Well, I see I would have to remove the volume group first, at the very leas=
t. <br>Should I just issue <br><br>sudo vgremove vol0<br><br>followed by<br=
><br>sudo pvremove /dev/127<br><br>and followed by <br><br>sudo pvcreate --=
uuid WFo1On-anFb-2av8-DuRq-vKee-nJEt-ZLnu26 --restorefile vol0.t<br>
xt /dev/md127<br><br>?<br><br>But I would just be back in the middle of my =
problem description on ubuntuforums, wouldn&#39; t I?<br>Still no volume gr=
oup, still no logical volumes...<br><br><br><div class=3D"gmail_quote">On M=
on, Mar 25, 2013 at 9:30 PM, Stuart D Gathman <span dir=3D"ltr">&lt;<a href=
=3D"mailto:stuart@bmsi.com" target=3D"_blank">stuart@bmsi.com</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Long ago, Nostradamus foresaw that on 03/25/=
2013 04:46 PM, Bj=F6rn<br>
<div class=3D"im">Nadrowski would write:<br>
&gt; Recreation of the volume group seemed =A0a good idea as I only had one=
 volume group on the pv and therefore I did not see how this could have des=
troyed anything.<br>
&gt; The (human-readable) data at the beginning of the device /dev/md127 is=
 still there and does display the same information. Please see my posting<b=
r>
</div>Recreating the vg overwrites the human-readable data at the beginning=
 of<br>
the device. =A0You claim that it is &quot;still there&quot; and is the &quo=
t;same<br>
information&quot;. =A0But this cannot be true because originally that<br>
information had your LV data, and now (apparently) it does not. =A0Do you<b=
r>
see your LVs when looking at the vg metadata with an editor?? =A0 What do<b=
r>
you mean by &quot;displays the same information&quot;? =A0Does lvs list you=
r LVs?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--001a11c1ed3ed612e604d8c6ccb3--
