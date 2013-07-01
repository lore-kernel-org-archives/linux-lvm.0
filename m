Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r61AmH4U030700
	for <linux-lvm@redhat.com>; Mon, 1 Jul 2013 06:48:17 -0400
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r61AmFTV014170
	for <linux-lvm@redhat.com>; Mon, 1 Jul 2013 06:48:16 -0400
Received: by mail-lb0-f177.google.com with SMTP id 10so2272961lbf.8
	for <linux-lvm@redhat.com>; Mon, 01 Jul 2013 03:48:14 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 1 Jul 2013 12:48:14 +0200
Message-ID: <CAFrGbuWP-aqh8MvGND=0rvuvXtpXqApBXAWxp-yi_ftnoxasWw@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c3d14a2d593604e070f708
Subject: [linux-lvm] Forcing the lvconvert copy to be on a different
	physical disk
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

--001a11c3d14a2d593604e070f708
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

in my company they want to use LVM to handle a transition period while
moving VM guests from local datastore to a NAS (via iSCSI)

An example with numbers is worth thousands of words.
The idea is to have one leg locally and one leg on the NAS, then we'll
remove the local leg and tha machine will run with the leg on the NAS.

So there are two MBR-partitioned vdisks, 10G each, and with one big LVM
partition (0x8e)

I have created one VG spanning both disks and one LV hosted on the local
disk.

How to tell lvconvert that the mirror, of the LV I want, must entirely be
hosted on the second disk?

Thanks,

Alex

--001a11c3d14a2d593604e070f708
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,<div><br></div><div>in my company they want to use LVM to handle a t=
ransition period while moving VM guests from local datastore to a NAS (via =
iSCSI)</div><div><br></div><div>An example with numbers is worth thousands =
of words.</div>
<div>The idea is to have one leg locally and one leg on the NAS, then we&#3=
9;ll remove the local leg and tha machine will run with the leg on the NAS.=
</div><div><br></div><div>So there are two MBR-partitioned vdisks, 10G each=
, and with one big LVM partition (0x8e)</div>
<div><br></div><div>I have created one VG spanning both disks and one LV ho=
sted on the local disk.</div><div><br></div><div>How to tell lvconvert that=
 the mirror, of the LV I want, must entirely be hosted on the second disk?<=
/div>
<div><br></div><div>Thanks,</div><div><br></div><div>Alex</div>

--001a11c3d14a2d593604e070f708--
