Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAOCLJ97016867
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2016 07:21:19 -0500
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
	[80.67.31.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B33A8050D
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2016 12:21:18 +0000 (UTC)
Received: from [217.251.126.54] (helo=ucs.cubewerk.intern)
	by smtprelay04.ispgateway.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84)
	(envelope-from <sb@plzk.de>) id 1c9t1g-0000wk-IN
	for linux-lvm@redhat.com; Thu, 24 Nov 2016 13:21:16 +0100
Received: from ucs.cubewerk.intern (localhost [127.0.0.1])
	by ucs.cubewerk.intern (Postfix) with ESMTP id 0BAF8170F
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2016 13:21:16 +0100 (CET)
From: =?utf-8?Q?Stefan_Bauer?= <sb@plzk.de>
Date: Thu, 24 Nov 2016 13:21:15 +0100
Mime-Version: 1.0
Sender: =?utf-8?Q?Stefan_Bauer?= <stefan.bauer@cubewerk.de>
Message-Id: <kcim.5836db3b.7323.0bc3159117d344ab@ucs.cubewerk.intern>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] auto_activation_volume_list in lvm.conf not honored
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
To: =?utf-8?Q?linux-lvm=40redhat=2Ecom?= <linux-lvm@redhat.com>

hi folks,=20

howto avoid pvescan to initialize lvm volume groups on startup (it's for a =
cluster setup)? auto_activation_volume_list was filled with the remaining V=
Gs we want to setup. Manually it does what it should=20

/sbin/lvm pvescan --config 'activation { auto_activation_volume_list =3D "v=
g2" }'=C2=A0 only activates vg2 but keeps vg1 "untouched".

But on system startup, all VGs are activated. (ubuntu 14.04.5 LTS)

We also updated the ramdisk and verified, the changes are also in the ramdi=
sks lvm.conf

However vg1 is also enabled.

Any help is greatly appreciated.

Stefan
