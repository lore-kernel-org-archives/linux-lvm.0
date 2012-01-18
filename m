Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0I2j9SR032159
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 21:45:09 -0500
Received: from mail-lpp01m010-f46.google.com (mail-lpp01m010-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0I2j7pu023825
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 21:45:08 -0500
Received: by lahc1 with SMTP id c1so2669992lah.33
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 18:45:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.00.1201171311000.22642@bmsred.bmsi.com>
References: <CALe_PVkSZD-ij5D7HQiKoL=obeQMuV3ZnJfd9f_1rocFdkt71A@mail.gmail.com>
	<alpine.LRH.2.00.1201171311000.22642@bmsred.bmsi.com>
Date: Wed, 18 Jan 2012 08:15:06 +0530
Message-ID: <CALe_PV=yDkPMfvYyKnXNiLVZFupTJJ3TyesLi6nsO1eKsvjpKw@mail.gmail.com>
From: Kiran Rao <techie.curious@gmail.com>
Content-Type: multipart/alternative; boundary=e89a8f22c69179591f04b6c46ff3
Subject: Re: [linux-lvm] Resizing a logical volume which is mounted (at
	/home)
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

--e89a8f22c69179591f04b6c46ff3
Content-Type: text/plain; charset=ISO-8859-1

Thanks Stuart.

That's what I did finally. Logged in as root in the console (in fact I
booted into recovery mode from GRUB in order to do this).
Also, to ensure that the underlying file system is also resized
accordingly, I used the -r option.

lvresize -r -L-20G vgme/lvhome
lvresize -r -L+20G vgme/lvroot

That did the trick. Thanks.

On Tue, Jan 17, 2012 at 11:45 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:

> Long ago, Nostradamus foresaw that on Jan 16, Kiran Rao would write:
>
>  Now, I tried the GUI (system-config-lvm) tool to do this. I can click on
>> lvhome and try to resize it. However, the problem is that since I am
>> logged
>> in as a non-root user, the /home is mounted. Resizing requires one to
>> unmount it, but the unmount operation fails since I am mounted.
>>
>> How do I work around this?
>>
>
> Log out of GUI
> Switch to text console (on linux try Ctrl-Alt-F3 for vt3)
> Login as root Unmount /home
> resize2fs <device-for-home>
> # WARNING!  Make sure lvresize size is >= resize2fs size.  If you aren't
> # sure about the units, make lvresize larger than you think you made
> # the filesystem.  You can always expand the filesystems again, but
> # you can't undo shrinking the LV too far.
> lvresize <device-for-home>
> mount /home
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> ______________________________**_________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/**mailman/listinfo/linux-lvm<https://www.redhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-**HOWTO/<http://tldp.org/HOWTO/LVM-HOWTO/>
>

--e89a8f22c69179591f04b6c46ff3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks Stuart.<br><br>That&#39;s what I did finally. Logged in as root in t=
he console (in fact I booted into recovery mode from GRUB in order to do th=
is).<br>Also, to ensure that the underlying file system is also resized acc=
ordingly, I used the -r option.<br>
<br>lvresize -r -L-20G vgme/lvhome<br>lvresize -r -L+20G vgme/lvroot<br><br=
>That did the trick. Thanks.<br><br><div class=3D"gmail_quote">On Tue, Jan =
17, 2012 at 11:45 PM, Stuart D. Gathman <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">Long ago, Nostradamus fore=
saw that on Jan 16, Kiran Rao would write:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Now, I tried the GUI (system-config-lvm) tool to do this. I can click on<br=
>
lvhome and try to resize it. However, the problem is that since I am logged=
<br>
in as a non-root user, the /home is mounted. Resizing requires one to<br>
unmount it, but the unmount operation fails since I am mounted.<br>
<br>
How do I work around this?<br>
</blockquote>
<br></div>
Log out of GUI<br>
Switch to text console (on linux try Ctrl-Alt-F3 for vt3)<br>
Login as root Unmount /home<br>
resize2fs &lt;device-for-home&gt;<br>
# WARNING! =A0Make sure lvresize size is &gt;=3D resize2fs size. =A0If you =
aren&#39;t<br>
# sure about the units, make lvresize larger than you think you made<br>
# the filesystem. =A0You can always expand the filesystems again, but<br>
# you can&#39;t undo shrinking the LV too far.<br>
lvresize &lt;device-for-home&gt;<br>
mount /home<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0Stuart D. Gathman &lt;<a href=3D"mailto:stuart@=
bmsi.com" target=3D"_blank">stuart@bmsi.com</a>&gt;<br>
 =A0 =A0Business Management Systems Inc. =A0Phone: 703 591-0911 Fax: 703 59=
1-6154<br>
&quot;Confutatis maledictis, flammis acribus addictis&quot; - background so=
ng for<br>
a Microsoft sponsored &quot;Where do you want to go from here?&quot; commer=
cial.<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</font></span></blockquote></div><br>

--e89a8f22c69179591f04b6c46ff3--
