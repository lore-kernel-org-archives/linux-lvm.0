Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9N4Q6Rm018088
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2013 00:26:06 -0400
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9N4Q4W7014017
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2013 00:26:05 -0400
Received: by mail-ee0-f42.google.com with SMTP id b45so119644eek.1
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2013 21:26:04 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 22 Oct 2013 22:26:03 -0600
Message-ID: <CAFp1kvNSrN+FiVqyzO2OW7FkjtCA3oeo1DQ3D8m2d9ycSCBvsw@mail.gmail.com>
From: Shi Jin <jinzishuai@gmail.com>
Content-Type: multipart/alternative; boundary=089e0163549e4ed28c04e960ea8b
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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
Cc: joe.harvell@tekcomms.com

--089e0163549e4ed28c04e960ea8b
Content-Type: text/plain; charset=UTF-8

Hi Joe,

I am having similar issues in that I have a LVM2 raid1 mirror between a
local disk and a iSCSI disk and once I remove the iSCSI disk and add it
back, the mirror stays broken. I traced the cause of that to be LVM2 still
complains about a PV missing even though the same PV has been added back.

I wonder if you have resolved your issue and what did you do.
Thanks a lot.
Shi

--089e0163549e4ed28c04e960ea8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joe,
<div><br></div><div>I am having similar issues in that I have a LVM2 raid1 =
mirror between a local disk and a iSCSI disk and once I remove the iSCSI di=
sk and add it back, the mirror stays broken. I traced the cause of that to =
be LVM2 still complains about a PV missing even though the same PV has been=
 added back.</div>
<div><br></div><div>I wonder if you have resolved your issue and what did y=
ou do.</div><div>Thanks a lot.</div><div>Shi</div></div>

--089e0163549e4ed28c04e960ea8b--
