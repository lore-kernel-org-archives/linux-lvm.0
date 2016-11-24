Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAOEKSog005136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2016 09:20:28 -0500
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
	[80.67.31.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A43BB3D96E
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2016 14:20:22 +0000 (UTC)
Received: from [217.251.126.54] (helo=ucs.cubewerk.intern)
	by smtprelay02.ispgateway.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84)
	(envelope-from <sb@plzk.de>) id 1c9usu-0000bP-NV
	for linux-lvm@redhat.com; Thu, 24 Nov 2016 15:20:20 +0100
Received: from ucs.cubewerk.intern (localhost [127.0.0.1])
	by ucs.cubewerk.intern (Postfix) with ESMTP id 513B516FF
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2016 15:20:20 +0100 (CET)
From: =?utf-8?Q?Stefan_Bauer?= <sb@plzk.de>
Date: Thu, 24 Nov 2016 15:20:20 +0100
Mime-Version: 1.0
Sender: =?utf-8?Q?Stefan_Bauer?= <stefan.bauer@cubewerk.de>
Message-Id: <kcim.5836f724.537.5a1ae8cd075fa956@ucs.cubewerk.intern>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm]  auto_activation_volume_list in lvm.conf not honored
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?utf-8?Q?LVM_general_discussion_and_development?= <linux-lvm@redhat.com>=?utf-8?Q?linux-lvm=40redhat=2Ecom?= <linux-lvm@redhat.com>

Its already gone in newer releases of Ubuntu. They replaced upstartd with s=
ytemd. The systemd scripts look sane and use -aay.

Stefan
=20
-----Urspr=C3=BCngliche Nachricht-----
> Von:Peter Rajnoha <prajnoha@redhat.com>
> SUBSYSTEM=3D=3D"block", ACTION=3D=3D"add|change", ENV{ID_FS_TYPE}=3D"lvm*=
|LVM*",
> RUN+=3D"watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'"
>=20
> So that "watershed" should use vgchange -aay. Please report this for
> Ubuntu directly for them to fix this (as the "watershed" helper binary
> is specific to Debian/Ubuntu only).
