Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9K0k2KH010787
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 20:46:02 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9K0jiir009772
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 20:45:44 -0400
Received: by yxe13 with SMTP id 13so4255816yxe.23
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 17:45:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4ADCBD92.3000800@velocity.org>
References: <4ADCBD92.3000800@velocity.org>
Date: Mon, 19 Oct 2009 20:45:43 -0400
Message-ID: <a5a956f70910191745s1759b7earf48f556d5b73ffa7@mail.gmail.com>
Subject: Re: [linux-lvm] lvcreate on specific pv in system-config-lvm
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=0016e68debb7a87c400476532e5e
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

--0016e68debb7a87c400476532e5e
Content-Type: text/plain; charset=ISO-8859-1

this may help:
Open the LVM GUI. Oh the left panel, open the Unallocated Entities. Select
on the PV (eg: /dev/hdd). Then click the Add to existing Volume Group
button, and choose VolGroup00.
After LVM reloads its data, look in the left panel. Let's assume you want to
extend LogVol00 to the new PV (or vice versa depending on how your mind
works). Open the VolGroup00 (Logical View) tree, and select LogVol00, and
click the Edit Properties button. In the Size panel you should see the
remaining free space; this is from the added PY. Before you actually do
this, find out how to undo it. I haven't found out yet.

So in summary, the process using the GUI is somewhat different than using
the LVM commands, but the results are the same.

There does seem to be something wrong in the GUI: Select the new PY in the
left panel, then click the Migrate Selected Extent(s) from volume. It asks
you to select some extents first, but there is no way of doing that.
Good luck.
Lou.

On 10/19/09, Dan Ragle <dan@velocity.org> wrote:
>
> Hi, I'm new to LVM and trying to find my way through the
> available options...
>
> I see that with lvcreate there is the ability to create a
> logical volume on a specified physical volume; but in system-config-lvm
> I do not see how to do that (I can only see how to set the size of
> the LV from the free space available in the VG; I don't see how
> to specify on which PV it should be created). Obviously if
> I'm missing something please let me know; but otherwise I was
> just curious as to why that feature wasn't available in the
> GUI (i.e., is it problematic, or something I should try to avoid
> for some other reason)?
>
> Many thanks,
>
> Dan Ragle
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016e68debb7a87c400476532e5e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>this may help:</div>
<div>Open the LVM GUI. Oh the left panel, open the Unallocated Entities.=A0=
Select on the PV (eg: /dev/hdd). Then click the Add to existing Volume Grou=
p button, and choose VolGroup00.</div>
<div>After LVM reloads its data, look in the left panel. Let&#39;s assume y=
ou want to extend LogVol00 to the new PV (or vice versa depending on how yo=
ur mind works).=A0Open the VolGroup00 (Logical View) tree, and select LogVo=
l00, and click the Edit Properties button. In the Size panel you should see=
 the remaining free space; this is from the added PY. Before you actually d=
o this, find out how to undo it. I haven&#39;t found out yet.</div>

<div>=A0</div>
<div>So in summary, the process using the GUI is somewhat different than us=
ing the=A0LVM=A0commands, but the results are the same.</div>
<div>=A0</div>
<div>There does seem to be something wrong in the GUI: Select the new PY in=
 the left panel, then click the Migrate Selected Extent(s) from volume. It =
asks you to select some extents first, but there is no way of doing that.<b=
r>
Good luck.</div>
<div>Lou.<br>=A0</div>
<div><span class=3D"gmail_quote">On 10/19/09, <b class=3D"gmail_sendername"=
>Dan Ragle</b> &lt;<a href=3D"mailto:dan@velocity.org">dan@velocity.org</a>=
&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi, I&#39;m new to LVM and tryin=
g to find my way through the<br>available options...<br><br>I see that with=
 lvcreate there is the ability to create a<br>
logical volume on a specified physical volume; but in system-config-lvm<br>=
I do not see how to do that (I can only see how to set the size of<br>the L=
V from the free space available in the VG; I don&#39;t see how<br>to specif=
y on which PV it should be created). Obviously if<br>
I&#39;m missing something please let me know; but otherwise I was<br>just c=
urious as to why that feature wasn&#39;t available in the<br>GUI (i.e., is =
it problematic, or something I should try to avoid<br>for some other reason=
)?<br>
<br>Many thanks,<br><br>Dan Ragle<br><br>__________________________________=
_____________<br>linux-lvm mailing list<br><a onclick=3D"return top.js.Open=
ExtLink(window,event,this)" href=3D"mailto:linux-lvm@redhat.com" target=3D"=
_blank">linux-lvm@redhat.com</a><br>
<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https:/=
/www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a oncli=
ck=3D"return top.js.OpenExtLink(window,event,this)" href=3D"http://tldp.org=
/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><b=
r>
</blockquote></div><br>

--0016e68debb7a87c400476532e5e--
