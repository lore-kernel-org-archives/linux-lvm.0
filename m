Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6L2lR8H014009
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2014 22:47:28 -0400
Received: from servidor.dhapcenter.es (mail.dhapcenter.es [86.109.170.250])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6L2lMm2015075
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2014 22:47:25 -0400
Date: Mon, 21 Jul 2014 04:43:54 +0200 (CEST)
From: David <david@dhapcenter.es>
Message-ID: <632060220.1897.1405910634369.open-xchange@webmail.dhapcenter.es>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Differences between thin snapshots from the same
 external origin volume or from the same internal thin origin volume
Reply-To: David <david@dhapcenter.es>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/html; charset="utf-8"
To: linux-lvm <linux-lvm@redhat.com>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org=
/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns=3D"http://www.w3.org/1999/xht=
ml"><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
" />
=20
 </head><body>
=20
  <p>Hello friends,</p>
  <p><span style=3D"font-size: 14px;"><br />My question is about sharing tw=
o or more levels of a base image between Linux containers by using thin sna=
pshot volumes.</span></p>
  <p><span style=3D"font-size: 14px;">There are any difference between crea=
ting multiple and recursive thin snapshots of the same external origin volu=
me or creating multiple and recursive thin snapshots of the same thin volum=
e?</span><span style=3D"font-size: 14px;"></span></p>
  <p><span style=3D"font-size: 14px;">In terms of =E2=80=9Ccopy on write=E2=
=80=9D implementation and performance impact.</span></p>
  <p>Thanks<br /><span style=3D"font-size: 14px;">David</span></p>
=20
</body></html>
