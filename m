Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1699H128062
	for <linux-lvm@redhat.com>; Mon, 6 Feb 2006 04:09:17 -0500
Received: from uproxy.gmail.com (uproxy.gmail.com [66.249.92.197])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1699GqP028989
	for <linux-lvm@redhat.com>; Mon, 6 Feb 2006 04:09:16 -0500
Received: by uproxy.gmail.com with SMTP id q2so776607uge
	for <linux-lvm@redhat.com>; Mon, 06 Feb 2006 01:09:16 -0800 (PST)
Message-ID: <77ec93690602060109g179f3622r@mail.gmail.com>
Date: Mon, 6 Feb 2006 10:09:15 +0100
From: Martin Lindquist <black.ant@gmail.com>
Subject: Re: [linux-lvm] Accidental removal of logical volume - any way to
	salvage?
In-Reply-To: <20060205205445.GD22481@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_25347_12581636.1139216955808"
References: <77ec93690602050953r6ada49aat@mail.gmail.com>
	<20060205175808.GA22481@agk.surrey.redhat.com>
	<77ec93690602051005k3c4d8cbah@mail.gmail.com>
	<20060205205445.GD22481@agk.surrey.redhat.com>
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

------=_Part_25347_12581636.1139216955808
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Many, many, many thanks. After sleeping for a few hours and eating a proper
breakfast I managed to restore all of the lost data thanks to your hints.

Eternally thankful,
Martin

2006/2/5, Alasdair G Kergon <agk@redhat.com>:
>
> On Sun, Feb 05, 2006 at 07:05:10PM +0100, Martin Lindquist wrote:
> > The backup of /etc was done after running 'lvremove' and 'vgexport' so
> if I
> > understand you correctly that won't do any good.
>
> Take a look at your backup and check the comments in the files
> in /etc/lvm/archive/<vgname>*
>
> Alasdair
> --
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_25347_12581636.1139216955808
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Many, many, many thanks. After sleeping for a few hours and eating a proper=
 breakfast I managed to restore all of the lost data thanks to your hints.<=
br><br>Eternally thankful,<br>Martin<br><br><div><span class=3D"gmail_quote=
">
2006/2/5, Alasdair G Kergon &lt;<a href=3D"mailto:agk@redhat.com">agk@redha=
t.com</a>&gt;:</span><blockquote class=3D"gmail_quote" style=3D"border-left=
: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1e=
x;">
On Sun, Feb 05, 2006 at 07:05:10PM +0100, Martin Lindquist wrote:<br>&gt; T=
he backup of /etc was done after running 'lvremove' and 'vgexport' so if I<=
br>&gt; understand you correctly that won't do any good.<br><br>Take a look=
 at your backup and check the comments in the files
<br>in /etc/lvm/archive/&lt;vgname&gt;*<br><br>Alasdair<br>--<br><a href=3D=
"mailto:agk@redhat.com">agk@redhat.com</a><br><br>_________________________=
______________________<br>linux-lvm mailing list<br><a href=3D"mailto:linux=
-lvm@redhat.com">
linux-lvm@redhat.com</a><br><a href=3D"https://www.redhat.com/mailman/listi=
nfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>rea=
d the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tld=
p.org/HOWTO/LVM-HOWTO/
</a><br></blockquote></div>

------=_Part_25347_12581636.1139216955808--
