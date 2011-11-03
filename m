Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA3HYlLv029631
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2011 13:34:47 -0400
Received: from mualmarp01.mcs.muohio.edu (mualmarp01.mcs.muohio.edu
	[134.53.6.70])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA3HYkWC011835
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2011 13:34:46 -0400
Received: from mualmafp02.mcs.muohio.edu (mualmafp02.mcs.muohio.edu
	[134.53.6.6])
	by mualmarp01.mcs.muohio.edu (8.13.8/8.13.8) with ESMTP id
	pA3HYjAi001742
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2011 13:34:45 -0400
Received: from muconnect.muohio.edu (liberator.it.muohio.edu [10.0.66.50])
	by mualmafp02.mcs.muohio.edu (8.13.8/8.13.8) with ESMTP id
	pA3HYiUj011143
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2011 13:34:44 -0400
From: "Robin, Robin" <robinr@muohio.edu>
Date: Thu, 3 Nov 2011 13:34:38 -0400
Message-ID: <CAD848EE.8BF1A%robinr@muohio.edu>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CAD848EE8BF1Arobinrmuohioedu_"
MIME-Version: 1.0
Subject: [linux-lvm] TLER/CCTL/ERC
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

--_000_CAD848EE8BF1Arobinrmuohioedu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I know that a lot of RAID controllers require drives with TLER/CCTL/ERC sup=
port, so as not to prematurely presume a drive is dead (and put array in de=
graded mode).

Does LVM have such requirement as well ? I'm wondering if LVM will prematur=
ely declare a non-TLER/CCTL/ERC drive dead prematurely and deactivates the =
entire volume group..
Or is LVM configurable to operate reliably over a long time on non-TLER/CCT=
L/ERC drives ?

Thanks,
Robin


--_000_CAD848EE8BF1Arobinrmuohioedu_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; -webkit-line-break: after-white-space; color: rgb(0, 0, 0); font-si=
ze: 14px; font-family: Calibri, sans-serif; "><div>Hi,</div><div><br></div>=
<div>I know that a lot of RAID controllers require drives with TLER/CCTL/ER=
C support, so as not to prematurely presume a drive is dead (and put array =
in degraded mode).</div><div><br></div><div>Does LVM have such requirement =
as well ? I'm wondering if LVM will prematurely declare a non-TLER/CCTL/ERC=
 drive dead prematurely and deactivates the entire volume group..</div><div=
>Or is LVM configurable to operate reliably over a long time on non-TLER/CC=
TL/ERC drives ?</div><div><br></div><div>Thanks,</div><div>Robin</div><div>=
<br></div></body></html>

--_000_CAD848EE8BF1Arobinrmuohioedu_--
