Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE632026D76
	for <linux-lvm@redhat.com>; Fri, 20 Nov 2020 16:18:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D0D7811E76
	for <linux-lvm@redhat.com>; Fri, 20 Nov 2020 16:18:27 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id r17so10625637ljg.5
	for <linux-lvm@redhat.com>; Fri, 20 Nov 2020 08:18:23 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
	<20201120111433.GI1787072@localhost.localdomain>
In-Reply-To: <20201120111433.GI1787072@localhost.localdomain>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Fri, 20 Nov 2020 21:48:10 +0530
Message-ID: <CAMaziXss8HAjSjV6g5kFjzkxnYCGZSowfZcT-nJVRm-tf0rJEQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000770ef505b48c31ba"
Subject: Re: [linux-lvm] Unusually long boot times with LVM Snapshots
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

--000000000000770ef505b48c31ba
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2020 at 4:45 PM Bryn M. Reeves <bmr@redhat.com> wrote:

> What type of snapshot are you using? LVM2 allows either "classic" CoW
> snaps,
> or the newer thin provisioned snapshots using the dm-thinp target.
>
> Classic snapshots are known to have very poor IO performance when multiple
> snapshots of the same volume exist simultaneously (especially for write-
> heavy workloads).
>
> Thin provisioned snapshots are not normally activated at boot time unless
> they are explicitly requested (via dracut's rd.lvm.lv options) since they
> have the skip activation flag set by default.
>
>
How can I check which type of snapshot I am using ?

I am very interested in knowing more about these newer snapshots.

I think I am using the older COW snapshots.

I created it using:

              sudo lvcreate -L 70GB -s -n test_snapshot
/dev/mapper/vgfedora-fedora


Is there any indication in the log of what's happening during the delay?
> Look through the journalctl output to see if there are any messages logged
> while the delay happens.
>
>
Yes, I have found the reason for the 3 minute delay:

Nov 20 21:14:15  dracut-initqueue[902]: Scanning devices dm-0  for LVM
logical volumes vgfedora/fedora
Nov 20 21:14:16  dracut-initqueue[927]: inactive Original
'/dev/vgfedora/fedora' [700.00 GiB] inherit
Nov 20 21:14:16  dracut-initqueue[927]: inactive Snapshot
'/dev/vgfedora/pre_kde_Nov_9' [70.00 GiB] inherit
Nov 20 21:17:27  systemd[1]: Found device /dev/mapper/vgfedora-fedora.
Nov 20 21:17:27  systemd[1]: Found device
/dev/disk/by-uuid/03aef3ba-dca1-4cba-a3f5-36c5c0fe948e.
Nov 20 21:17:27  systemd[1]: Reached target Initrd Root Device.

As you can see it initializing the snapshots.

This is my entire boot log if you need to delve deeper.
https://pastebin.com/raw/275JPvZB


> Another option is to use systemd-analyze to look into where the time is
> going during boot. It has various commands including "plot" which will
> generate an SVG plot of the boot timings on stdout. You can then compare
> that with a regular boot to try to understand the difference.
>


Well I don't know about "plot" but this is the output from "systemd-analyze
blame"

3min 30.737s dracut-initqueue.service

     31.399s udisks2.service

     26.650s lvm2-monitor.service

     25.500s systemd-journal-flush.service

     20.289s ModemManager.service

     18.242s abrtd.service

     18.233s avahi-daemon.service

     18.227s bluetooth.service

     17.725s systemd-cryptsetup@luks\x2d2ec7f1ae\x2d6f9b\x2d4896\x2da7b2\x2dbe7809e9d2f4.service

     17.604s firewalld.service


As you can see the 3min delay matches with the above LVM entry from the
boot log.


Again, I am very interested in knowing more about these newer snapshots.
-- 
Regards,
Sreyan Chakravarty

--000000000000770ef505b48c31ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Nov 20, 2020 at 4:45 PM Bryn M. R=
eeves &lt;<a href=3D"mailto:bmr@redhat.com" target=3D"_blank">bmr@redhat.co=
m</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">What type of snapshot are you using? LVM2 allow=
s either &quot;classic&quot; CoW snaps,<br>
or the newer thin provisioned snapshots using the dm-thinp target.<br>
<br>
Classic snapshots are known to have very poor IO performance when multiple<=
br>
snapshots of the same volume exist simultaneously (especially for write-<br=
>
heavy workloads).<br>
<br>
Thin provisioned snapshots are not normally activated at boot time unless<b=
r>
they are explicitly requested (via dracut&#39;s <a href=3D"http://rd.lvm.lv=
" rel=3D"noreferrer" target=3D"_blank">rd.lvm.lv</a> options) since they<br=
>
have the skip activation flag set by default.<br>
<br></blockquote><div><br></div><div>How can I check which type of snapshot=
 I am using ?</div><div><br></div><div>I am very interested=C2=A0in knowing=
 more about these newer snapshots.</div><div><br></div><div>I think I am us=
ing the older COW snapshots.</div><div><br></div><div>I created it using:</=
div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 su=
do lvcreate -L 70GB -s -n test_snapshot /dev/mapper/vgfedora-fedora=C2=A0</=
div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Is there any indication in the log of what&#39;s happening durin=
g the delay?<br>
Look through the journalctl output to see if there are any messages logged<=
br>
while the delay happens.<br>
<br></blockquote><div><br></div><div>Yes, I have found the reason for the 3=
 minute delay:</div><div><br></div>Nov 20 21:14:15 =C2=A0dracut-initqueue[9=
02]: Scanning devices dm-0 =C2=A0for LVM logical volumes vgfedora/fedora<br=
>Nov 20 21:14:16 =C2=A0dracut-initqueue[927]: inactive Original &#39;/dev/v=
gfedora/fedora&#39; [700.00 GiB] inherit<br>Nov 20 21:14:16 =C2=A0dracut-in=
itqueue[927]: inactive Snapshot &#39;/dev/vgfedora/pre_kde_Nov_9&#39; [70.0=
0 GiB] inherit<br>Nov 20 21:17:27 =C2=A0systemd[1]: Found device /dev/mappe=
r/vgfedora-fedora.<br>Nov 20 21:17:27 =C2=A0systemd[1]: Found device /dev/d=
isk/by-uuid/03aef3ba-dca1-4cba-a3f5-36c5c0fe948e.<br><div>Nov 20 21:17:27 =
=C2=A0systemd[1]: Reached target Initrd Root Device.</div><div><br></div><d=
iv>As you can see it initializing the snapshots.</div><div><br></div><div>T=
his is my entire boot log if you need to delve deeper.</div><div><a href=3D=
"https://pastebin.com/raw/275JPvZB">https://pastebin.com/raw/275JPvZB</a><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Another option is to use systemd-analyze to look into where the time is<br>
going during boot. It has various commands including &quot;plot&quot; which=
 will<br>
generate an SVG plot of the boot timings on stdout. You can then compare<br=
>
that with a regular boot to try to understand the difference.<br>
</blockquote></div><br clear=3D"all"><div><br></div><div>Well I don&#39;t k=
now about &quot;plot&quot; but this is the output from &quot;systemd-analyz=
e blame&quot;</div><div><br></div><div>3min 30.737s dracut-initqueue.servic=
e =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>=C2=A0 =C2=A0 =C2=A031.399s udisks2.service =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A026.650s lvm2-monitor.service =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 =C2=A025.500s systemd-journal-flush.service=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =
=C2=A0 =C2=A020.289s ModemManager.service =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0 =C2=
=A0 =C2=A018.242s abrtd.service =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>=C2=A0 =C2=A0 =C2=A018.233s avahi-daemon.service =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
br>=C2=A0 =C2=A0 =C2=A018.227s bluetooth.service =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>=C2=A0 =C2=A0 =C2=A017.725s systemd-cryptsetup@luks\x2d2ec7f1ae\x=
2d6f9b\x2d4896\x2da7b2\x2dbe7809e9d2f4.service =C2=A0 =C2=A0 =C2=A0<br>=C2=
=A0 =C2=A0 =C2=A017.604s firewalld.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0<br></div><div><br></div><div>As you can see the 3min delay matches w=
ith the above LVM entry from the boot log.</div><div><br></div><div><br></d=
iv><div>Again,=C2=A0I am very interested=C2=A0in knowing more about these n=
ewer snapshots.</div>-- <br><div dir=3D"ltr"><div dir=3D"ltr">Regards,<div>=
Sreyan Chakravarty</div></div></div></div>

--000000000000770ef505b48c31ba--
