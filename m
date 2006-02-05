Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k15I5L108513
	for <linux-lvm@redhat.com>; Sun, 5 Feb 2006 13:05:21 -0500
Received: from uproxy.gmail.com (uproxy.gmail.com [66.249.92.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k15I5B2B014668
	for <linux-lvm@redhat.com>; Sun, 5 Feb 2006 13:05:11 -0500
Received: by uproxy.gmail.com with SMTP id c2so531683ugf
	for <linux-lvm@redhat.com>; Sun, 05 Feb 2006 10:05:10 -0800 (PST)
Message-ID: <77ec93690602051005k3c4d8cbah@mail.gmail.com>
Date: Sun, 5 Feb 2006 19:05:10 +0100
From: Martin Lindquist <black.ant@gmail.com>
Subject: Re: [linux-lvm] Accidental removal of logical volume - any way to
	salvage?
In-Reply-To: <20060205175808.GA22481@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_19896_25031444.1139162710439"
References: <77ec93690602050953r6ada49aat@mail.gmail.com>
	<20060205175808.GA22481@agk.surrey.redhat.com>
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

------=_Part_19896_25031444.1139162710439
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

First of all, thank you for a fast response.

The backup of /etc was done after running 'lvremove' and 'vgexport' so if I
understand you correctly that won't do any good.

Yes, I am using LVM2. How do I salvage the metadata "from the front of the
disk?"

Regards,
Martin

2006/2/5, Alasdair G Kergon <agk@redhat.com>:
>
> On Sun, Feb 05, 2006 at 06:53:45PM +0100, Martin Lindquist wrote:
> > could anyone first of all tell me if there is any way at all to salvage
> the
> > data from the logical volume "main"?
>
> man vgcfgrestore if you retained metadata backups from /etc from before
> you deleted the LV.
>
> Failing that, if you're using LVM2 you might still be able to salvage
> the metadata from the from the front of the disk.
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



--
Martin Lindquist
IRC: nms @ irc.freenode.net, irc.vapor.com and irc.gimp.org
E-mail: black.ant@gmail.com
ICQ: 10386446
Skype: bilgalning
GSM: +46-(0)73-505 29 97
WoW: Vhasiu @ Ravencrest (EU)

------=_Part_19896_25031444.1139162710439
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

First of all, thank you for a fast response.<br><br>The backup of /etc was =
done after running 'lvremove' and 'vgexport' so if I understand you correct=
ly that won't do any good.<br><br>Yes, I am using LVM2. How do I salvage th=
e metadata &quot;from the front of the disk?&quot;
<br><br>Regards,<br>Martin<br><br><div><span class=3D"gmail_quote">2006/2/5=
, Alasdair G Kergon &lt;<a href=3D"mailto:agk@redhat.com">agk@redhat.com</a=
>&gt;:</span><blockquote class=3D"gmail_quote" style=3D"border-left: 1px so=
lid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On Sun, Feb 05, 2006 at 06:53:45PM +0100, Martin Lindquist wrote:<br>&gt; c=
ould anyone first of all tell me if there is any way at all to salvage the<=
br>&gt; data from the logical volume &quot;main&quot;?<br><br>man vgcfgrest=
ore if you retained metadata backups from /etc from before
<br>you deleted the LV.<br><br>Failing that, if you're using LVM2 you might=
 still be able to salvage<br>the metadata from the from the front of the di=
sk.<br><br>Alasdair<br>--<br><a href=3D"mailto:agk@redhat.com">agk@redhat.c=
om
</a><br><br>_______________________________________________<br>linux-lvm ma=
iling list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com<=
/a><br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https:=
//www.redhat.com/mailman/listinfo/linux-lvm
</a><br>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/"=
>http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br><br clear=
=3D"all"><br>-- <br>Martin Lindquist<br>IRC: nms @ <a href=3D"http://irc.fr=
eenode.net">
irc.freenode.net</a>, <a href=3D"http://irc.vapor.com">irc.vapor.com</a> an=
d <a href=3D"http://irc.gimp.org">irc.gimp.org</a><br>E-mail: <a href=3D"ma=
ilto:black.ant@gmail.com">black.ant@gmail.com</a><br>ICQ: 10386446<br>Skype=
: bilgalning
<br>GSM: +46-(0)73-505 29 97<br>WoW: Vhasiu @ Ravencrest (EU)

------=_Part_19896_25031444.1139162710439--
