Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2DD1111427
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 05:56:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E134101A540
	for <linux-lvm@redhat.com>; Mon, 14 Sep 2020 05:56:26 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id a15so17591173ljk.2
	for <linux-lvm@redhat.com>; Sun, 13 Sep 2020 22:56:23 -0700 (PDT)
Received: from [192.168.1.103] (m83-187-161-157.cust.tele2.se.
	[83.187.161.157])
	by smtp.gmail.com with ESMTPSA id c10sm3564127lfc.4.2020.09.13.22.56.20
	for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 13 Sep 2020 22:56:21 -0700 (PDT)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 14 Sep 2020 07:56:19 +0200
Message-Id: <5CE72DC6-9948-4CB6-83E9-C1F2AE55D5DB@gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] vgcfgrestore + pvcreate using liblockdev api in C
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
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@redhat.com

hi

Is there an api available today or an example how to perform the below OS c=
ommands in C using a function or api instead of system calls?

1. create an unique uid on the server, and store it on the PV disk

# pvcreatue -u <generated uid> <your device>

2. create the LVM metadata backup content (as /etc/lvm/backup/...)
- add PV uid generated above as there is no parameter to save the data to a=
 device
- add unique VG
- add exactly 1 contiguous LV

3. save LVM metadata to the PV disk as the OS command does

# vgcfgrestore VG

Can this be done by instead of using system() calls, instead using native C=
 commands either via an API or other methods?

the examples for bd_lvm_pvcreate() in libblockdevapi for example does not s=
ay how to add -u flag
and I couldn=E2=80=99t find any vgcfgrestore there too?

besides this, I found it strange why pvcreate -u is needed at all? would be=
 better to have a <dev> parameter directly to the vgcfgrestore command inst=
ead

looking forward to hearing from you soon again=20

regards Tomas

Sent from my iPhone
