Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A7A82166B2B
	for <linux-lvm@redhat.com>; Mon, 23 Dec 2019 16:08:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9246080056C
	for <linux-lvm@redhat.com>; Mon, 23 Dec 2019 16:08:57 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id a13so18226198ljm.10
	for <linux-lvm@redhat.com>; Mon, 23 Dec 2019 08:08:54 -0800 (PST)
Received: from [192.168.1.36] (88-114-211-119.elisa-laajakaista.fi.
	[88.114.211.119]) by smtp.gmail.com with ESMTPSA id
	j22sm8479407lfh.93.2019.12.23.08.08.52 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 23 Dec 2019 08:08:52 -0800 (PST)
From: Topi Miettinen <toiwoton@gmail.com>
Message-ID: <780c005d-fb6f-c3fb-c700-e7d4f136ad48@gmail.com>
Date: Mon, 23 Dec 2019 18:08:45 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------B8B1951364274611FA2C39C4"
Subject: [linux-lvm] [PATCH] generator: fix file descriptor leak
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

This is a multi-part message in MIME format.
--------------B8B1951364274611FA2C39C4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Set close-on-exec flag for kmsg file descriptor, so that _error() can
be used in case of execve() failure.

Signed-off-by: Topi Miettinen <toiwoton@gmail.com>
---
  scripts/lvm2_activation_generator_systemd_red_hat.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lvm2_activation_generator_systemd_red_hat.c=20
b/scripts/lvm2_activation_generator_systemd_red_hat.c
index 0f4ac8da2..e137aaf89 100644
--- a/scripts/lvm2_activation_generator_systemd_red_hat.c
+++ b/scripts/lvm2_activation_generator_systemd_red_hat.c
@@ -23,7 +23,7 @@ static int _kmsg_fd;
  static void _log_init(void)
  {
         // failing is harmless
-       _kmsg_fd =3D open(KMSG_DEV_PATH, O_WRONLY | O_NOCTTY);
+       _kmsg_fd =3D open(KMSG_DEV_PATH, O_WRONLY | O_NOCTTY | O_CLOEXEC);
  }

  static void _log_exit(void)
--=20
2.24.0

--------------B8B1951364274611FA2C39C4
Content-Type: text/x-diff; name="0001-generator-fix-file-descriptor-leak.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-generator-fix-file-descriptor-leak.patch"


--------------B8B1951364274611FA2C39C4--
