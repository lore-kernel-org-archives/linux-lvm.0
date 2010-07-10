Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6A2EK2N004145
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 22:14:20 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6A2E9O8031700
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 22:14:10 -0400
Received: by wwd20 with SMTP id 20so1525062wwd.27
	for <linux-lvm@redhat.com>; Fri, 09 Jul 2010 19:14:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTil_oN8awYAtgRvu45izb46MPxxbw10H6thr3l-h@mail.gmail.com>
References: <AANLkTilc126w-ScRl_Vn_WMf4jYrE3jPnd1hIYvvbOf0@mail.gmail.com>
	<AANLkTil_oN8awYAtgRvu45izb46MPxxbw10H6thr3l-h@mail.gmail.com>
Date: Sat, 10 Jul 2010 07:18:39 +0530
Message-ID: <AANLkTilGPYOSH2UGoLk2vYdcvknc_HdracF4ROfkPLdG@mail.gmail.com>
From: Renil Thomas <renilthomas82@gmail.com>
Content-Type: multipart/alternative; boundary=0016e65a0a06f29b02048afeb7f5
Subject: Re: [linux-lvm] Online Update by using alternate root partition (as
	in Solaris)
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
To: linux-lvm@redhat.com

--0016e65a0a06f29b02048afeb7f5
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Can this be implemented on RHEL5.5 without any issues -
http://www.novell.com/communities/node/5932/rollback-sles-online-updates-lvm-snapshots
 ?

Thanks & Regards,
Renil Thomas.

<http://www.novell.com/communities/node/5932/rollback-sles-online-updates-lvm-snapshots>

On Sat, Jul 10, 2010 at 7:10 AM, Renil Thomas <renilthomas82@gmail.com>wrote:

>
>
> Hi All,
>
> This is about the online update on a linux machine. For instance, on a
> running machine (RHEL 5.5), software update has to be carried out without
> affecting the active root partition(LVM2 is used here), i.e., on an
> alternate root partition or environment , can snapshots help? Also, after
> updating in order to check the status of my update, can I boot from the
> alternate partition (if possible above)  and then if it works fine, can I
> sync the data into the older partition with these changes?
>
> Thanks & Regards,
> Renil Thomas
>
>

--0016e65a0a06f29b02048afeb7f5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Can this be implemented on RHEL5.5 without any issue=
s -=A0<a href=3D"http://www.novell.com/communities/node/5932/rollback-sles-=
online-updates-lvm-snapshots">http://www.novell.com/communities/node/5932/r=
ollback-sles-online-updates-lvm-snapshots</a>=A0?</div>
<div><br></div><div>Thanks &amp; Regards,</div><div>Renil Thomas.</div><div=
><br></div><div><a href=3D"http://www.novell.com/communities/node/5932/roll=
back-sles-online-updates-lvm-snapshots"></a><br><br><div class=3D"gmail_quo=
te">
On Sat, Jul 10, 2010 at 7:10 AM, Renil Thomas <span dir=3D"ltr">&lt;<a href=
=3D"mailto:renilthomas82@gmail.com">renilthomas82@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"gmail_quote"><br><br>Hi All,<div><br></div><div>This is about=
 the online update on a linux machine. For instance, on a running machine (=
RHEL 5.5), software update has to be carried out without affecting the acti=
ve root partition(LVM2 is used here), i.e., on an alternate root partition =
or environment , can snapshots help? Also, after updating=A0in order=A0to c=
heck the status of my update, can I boot from the alternate partition (if p=
ossible above) =A0and then if it works fine, can I sync the data into the o=
lder partition with these changes?</div>


<div><br></div><div>Thanks &amp; Regards,</div><div>Renil Thomas</div>
</div><br>
</blockquote></div><br></div>

--0016e65a0a06f29b02048afeb7f5--
