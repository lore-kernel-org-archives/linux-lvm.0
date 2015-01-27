Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0R4MWIC015451
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2015 23:22:32 -0500
Received: from mail-wg0-f68.google.com (mail-wg0-f68.google.com [74.125.82.68])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0R4MUOZ027451
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2015 23:22:31 -0500
Received: by mail-wg0-f68.google.com with SMTP id b13so3797347wgh.3
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2015 20:22:29 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 26 Jan 2015 20:22:29 -0800
Message-ID: <CAFvEs3Y+tA7=ATJMrZ2trzOfN+1mU7koWkB8ZcDk-FYbUTSGgQ@mail.gmail.com>
From: Pheckphul <pheckphul@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec53d5c7362a86b050d9a9a60
Subject: [linux-lvm] Question about expanding RAID 5 LVs
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

--bcaec53d5c7362a86b050d9a9a60
Content-Type: text/plain; charset=UTF-8

I'm working on a project and want to make sure I understand the
requirements for expanding a RAID 5 LV, and am hoping for feedback.

When expanding a RAID 5 LV, and wanting to maintain RAID 5 functionality,
must one always increase the storage by a number of physical volumes equal
to (no more and no less, but evenly divisible by) the number of physical
volumes used to originally create the RAID 5 LV? e.g. I create a RAID 5 LV
that consists of four PVs and later want to increase the size of the RAID 5
LV. To do so I must add an additional four PVs, but may add any number
evenly divisible by four in order to maintain RAID 5 functionality. Do I
understand this correctly?

Thank you to those that provide feedback on this.

--bcaec53d5c7362a86b050d9a9a60
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I&#39;m working on a project and want to make sure I underst=
and the requirements for expanding a RAID 5 LV, and am hoping for feedback.=
</p>
<p dir=3D"ltr">When expanding a RAID 5 LV, and wanting to maintain RAID 5 f=
unctionality, must one always increase the storage by a number of physical =
volumes equal to (no more and no less, but evenly divisible by) the number =
of physical volumes used to originally create the RAID 5 LV? e.g. I create =
a RAID 5 LV that consists of four PVs and later want to increase the size o=
f the RAID 5 LV. To do so I must add an additional four PVs, but may add an=
y number evenly divisible by four in order to maintain RAID 5 functionality=
. Do I understand this correctly?<br></p>
<p dir=3D"ltr">Thank you to those that provide feedback on this.=C2=A0</p>

--bcaec53d5c7362a86b050d9a9a60--
