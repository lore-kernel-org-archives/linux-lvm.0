Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q28IfgI1007861
	for <linux-lvm@redhat.com>; Thu, 8 Mar 2012 13:41:42 -0500
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q28Ifflv031035
	for <linux-lvm@redhat.com>; Thu, 8 Mar 2012 13:41:41 -0500
Received: by eekc41 with SMTP id c41so258554eek.33
	for <linux-lvm@redhat.com>; Thu, 08 Mar 2012 10:41:40 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 8 Mar 2012 12:41:40 -0600
Message-ID: <CANiW5cFpy8a+dYPEXxzb-zjS+jYJH61P=jKKZV_N=tkSneHjmA@mail.gmail.com>
From: John Anthony <chirayithaj@gmail.com>
Content-Type: multipart/alternative; boundary=90e6ba5bb8eb7d550b04babfa037
Subject: [linux-lvm] Does a striped LV honor the order of specified PVs
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

--90e6ba5bb8eb7d550b04babfa037
Content-Type: text/plain; charset=ISO-8859-1

All:

This is situation where the number of LUNS - spindles - are many with the
LV striping across all of them.

To avoid hotspots - the idea is to control the order in which the LUNs are
written to by the LVs. It would appear the specifying the underlying PV -
LUN - order would achieve this goal. Is that correct ? Is there any value
to going through that trouble ? any experiences ?

TIA,

-JAC

--90e6ba5bb8eb7d550b04babfa037
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

All:<div><br></div><div>This is situation where the number of LUNS - spindl=
es - are many with the LV striping across all of them.=A0</div><div><br></d=
iv><div>To avoid hotspots - the idea is to control the order in which the L=
UNs are written to by the LVs. It would appear the specifying the underlyin=
g PV - LUN - order would achieve this goal. Is that correct ? Is there any =
value to going through that trouble ? any experiences ?</div>
<div><br></div><div>TIA,</div><div><br></div><div>-JAC</div>

--90e6ba5bb8eb7d550b04babfa037--
