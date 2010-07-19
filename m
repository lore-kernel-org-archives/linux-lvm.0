Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6JJ3lik006529
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 15:03:47 -0400
Received: from web137311.mail.in.yahoo.com (web137311.mail.in.yahoo.com
	[121.101.151.138])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o6JJ3bIM010976
	for <linux-lvm@redhat.com>; Mon, 19 Jul 2010 15:03:38 -0400
Message-ID: <799595.45439.qm@web137311.mail.in.yahoo.com>
Date: Tue, 20 Jul 2010 00:33:36 +0530 (IST)
From: andiket a <truly_linux@yahoo.co.in>
In-Reply-To: <87zkxnh62j.wl%ejt@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1645292404-1279566216=:45439"
Subject: Re: [linux-lvm] COW store
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

--0-1645292404-1279566216=:45439
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Thank Stuart and Joe.

I am just composing reply to another email by Greg.
He has got my point right.



--- On Mon, 19/7/10, ejt@redhat.com <ejt@redhat.com> wrote:

From: ejt@redhat.com <ejt@redhat.com>
Subject: Re: [linux-lvm] COW store
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Date: Monday, 19 July, 2010, 8:28 PM

At Mon, 19 Jul 2010 09:22:30 -0400,
Stuart D Gathman wrote:
> (LVM lawyers - what are legal chars to
> use?)

There don't seem to be many restrictions.=A0 You can't have '/'s, also
the following strings are forbidden:

=A0 =A0 ^snapshot.*
=A0 =A0 ^pvmove.*
=A0 =A0 .*_mlog.*
=A0 =A0 .*_mimage.*

- Joe

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=0A=0A
--0-1645292404-1279566216=:45439
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Thank Stuart and Joe.<br><br>I am just compos=
ing reply to another email by Greg.<br>He has got my point right.<br><br><b=
r><br>--- On <b>Mon, 19/7/10, ejt@redhat.com <i>&lt;ejt@redhat.com&gt;</i><=
/b> wrote:<br><blockquote style=3D"border-left: 2px solid rgb(16, 16, 255);=
 margin-left: 5px; padding-left: 5px;"><br>From: ejt@redhat.com &lt;ejt@red=
hat.com&gt;<br>Subject: Re: [linux-lvm] COW store<br>To: "LVM general discu=
ssion and development" &lt;linux-lvm@redhat.com&gt;<br>Date: Monday, 19 Jul=
y, 2010, 8:28 PM<br><br><div class=3D"plainMail">At Mon, 19 Jul 2010 09:22:=
30 -0400,<br>Stuart D Gathman wrote:<br>&gt; (LVM lawyers - what are legal =
chars to<br>&gt; use?)<br><br>There don't seem to be many restrictions.&nbs=
p; You can't have '/'s, also<br>the following strings are forbidden:<br><br=
>&nbsp; &nbsp; ^snapshot.*<br>&nbsp; &nbsp; ^pvmove.*<br>&nbsp; &nbsp;
 .*_mlog.*<br>&nbsp; &nbsp; .*_mimage.*<br><br>- Joe<br><br>_______________=
________________________________<br>linux-lvm mailing list<br><a ymailto=3D=
"mailto:linux-lvm@redhat.com" href=3D"/mc/compose?to=3Dlinux-lvm@redhat.com=
">linux-lvm@redhat.com</a><br><a href=3D"https://www.redhat.com/mailman/lis=
tinfo/linux-lvm" target=3D"_blank">https://www.redhat.com/mailman/listinfo/=
linux-lvm</a><br>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LV=
M-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></div><=
/blockquote></td></tr></table><br>
--0-1645292404-1279566216=:45439--
