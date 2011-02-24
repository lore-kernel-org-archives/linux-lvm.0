Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1OApeAC018509
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 05:51:40 -0500
Received: from mail.ixserver.net (mail.ixserver.net [94.143.114.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1OApTcv016343
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 05:51:29 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.ixserver.net (Postfix) with ESMTP id 5925ADA2057
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 11:51:28 +0100 (CET)
Received: from mail.ixserver.net ([127.0.0.1])
	by localhost (mail.ixserver.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cHH56evzJ50a for <linux-lvm@redhat.com>;
	Thu, 24 Feb 2011 11:51:28 +0100 (CET)
Received: from [90.94.162.175] (unknown [90.94.162.175])
	by mail.ixserver.net (Postfix) with ESMTPSA id B4AF3DA2047
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 11:51:27 +0100 (CET)
Message-ID: <4D66382E.4090906@ixcore.com>
Date: Thu, 24 Feb 2011 11:51:26 +0100
From: =?UTF-8?B?Q8OpZHJpYyBMZW1hcmNoYW5k?= <cedric.lemarchand@ixcore.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Different PV on the same raid array
Reply-To: cedric.lemarchand@ixblue.com,
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hello,

To bypass the DOS MBR 2TB limits, i plan to use LVM to create on the
same raid array some "small" PV (< 2TB)  that will be in the same big VG
(> 2TB).

First, am i planning ugly thing ? is the GPT alternative a better way ?

Secondly, I dont know how LVM use PVs within a VG, but for performances
issues, i would like that LVM use 1 PV first and then the second when
the first come full  (not both at the same time).
Maybe LVM do that by default, or do i need some option ? (i saw
"--contiguous" in the lvcreate man pages, but dont know exactly what
this option does ... )


Thx

C=C3=A9dric
