Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9KA4eV15422
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 06:04:40 -0400
Received: from qproxy.gmail.com (qproxy.gmail.com [72.14.204.207])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9KA4Rhd021026
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 06:04:32 -0400
Received: by qproxy.gmail.com with SMTP id c12so324339qbc
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 03:04:26 -0700 (PDT)
Message-ID: <80d985600510200257x1bf60c71o505ebff40c2ed7a2@mail.gmail.com>
Date: Thu, 20 Oct 2005 18:57:45 +0900
From: Craig Hagerman <craighagerman@gmail.com>
Subject: Re: [linux-lvm] setting up LVM, lost everything with a typo
In-Reply-To: <43576233.8030605@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_307_5603331.1129802265031"
References: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
	<43576233.8030605@gmx.net>
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

------=_Part_307_5603331.1129802265031
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 10/20/05, Klaus Strebel <klaus.strebel@gmx.net> wrote:
>
> What says vgscan in debug mode (you need vgscan before doing a vgchange).

  vgscan gives the same results as vgdisplay and lvdisplay...

vgscan
Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
Couldn't find all physical volumes for volume group media_vg.
Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
Couldn't find all physical volumes for volume group media_vg.
Volume group "media_vg" doesn't exist

:(

------=_Part_307_5603331.1129802265031
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div><span class=3D"gmail_quote">On 10/20/05, <b class=3D"gmail_sendername"=
>Klaus Strebel</b> &lt;<a href=3D"mailto:klaus.strebel@gmx.net">klaus.streb=
el@gmx.net</a>&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">What says vgscan in debug mode (=
you need vgscan before doing a vgchange).</blockquote>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>vgscan gives the same results as vgdisplay&nbsp;and lvdisplay...<br><b=
r>vgscan<br>&nbsp;Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1E=
d-GxWB-C4Smj6'.<br>&nbsp;Couldn't find all physical volumes for volume grou=
p media_vg.
<br>&nbsp;Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C=
4Smj6'.<br>&nbsp;Couldn't find all physical volumes for volume group media_=
vg.<br>&nbsp;Volume group &quot;media_vg&quot; doesn't exist</div><br>:(</d=
iv>

------=_Part_307_5603331.1129802265031--
