Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1NM77K08820
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 17:07:07 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.132])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1NM71Nx024994
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 17:07:02 -0500
Received: from westrelay01.boulder.ibm.com (westrelay01.boulder.ibm.com
	[9.17.195.10])
	by e34.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j1NM6uMN518628
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 17:06:56 -0500
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by westrelay01.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j1NM6uqe107186
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 15:06:56 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j1NM6uim019193
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 15:06:56 -0700
Received: from d03nm691.boulder.ibm.com (d03nm691.boulder.ibm.com
	[9.17.195.60])
	by d03av03.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j1NM6tja019149
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2005 15:06:56 -0700
Message-ID: <OF9566C217.DA496793-ON88256FB1.0076FD81-88256FB1.00797A49@us.ibm.com>
From: Matthew D Keller <mdkeller@us.ibm.com>
Date: Wed, 23 Feb 2005 14:06:51 -0800
MIME-Version: 1.0
Content-type: multipart/alternative; 
	Boundary="0__=07BBE522DFE57B118f9e8a93df938690918c07BBE522DFE57B11"
Content-Disposition: inline
Subject: [linux-lvm] vgda documentation
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
To: linux-lvm@redhat.com

--0__=07BBE522DFE57B118f9e8a93df938690918c07BBE522DFE57B11
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: quoted-printable






does anyone know of any good resources (for someone unfamiliar with the=
 lvm
source code) for manipulating on-disk metadata such as pv uuid's?  or
perhaps just documentation on the format of vgda's so i can go in and
change these fields manually?

i have a low level copy routine (think dd) that copies one entire physi=
cal
volume byte for byte to another.  what i want to do is use this routine=
 to
copy all the pv's in a logical volume and have the linux lvm recognize =
the
lv copy without problems.  for sure, i'm gonna have to create new pv uu=
id's
for the copies, and update those fields in several locations.  but is t=
hat
all that needs to be updated?  any comments are greatly appreciated...

much obliged,
matthew keller=

--0__=07BBE522DFE57B118f9e8a93df938690918c07BBE522DFE57B11
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-transfer-encoding: quoted-printable

<html><body>
<p>does anyone know of any good resources (for someone unfamiliar with =
the lvm source code) for manipulating on-disk metadata such as pv uuid'=
s?  or perhaps just documentation on the format of vgda's so i can go i=
n and change these fields manually?<br>
<br>
i have a low level copy routine (think dd) that copies one entire physi=
cal volume byte for byte to another.  what i want to do is use this rou=
tine to copy all the pv's in a logical volume and have the linux lvm re=
cognize the lv copy without problems.  for sure, i'm gonna have to crea=
te new pv uuid's for the copies, and update those fields in several loc=
ations.  but is that all that needs to be updated?  any comments are gr=
eatly appreciated...<br>
<br>
much obliged,<br>
matthew keller<br>
</body></html>=

--0__=07BBE522DFE57B118f9e8a93df938690918c07BBE522DFE57B11--
