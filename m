Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v239pEIZ019876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 3 Mar 2017 04:51:14 -0500
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9240C80F7B
	for <linux-lvm@redhat.com>; Fri,  3 Mar 2017 09:51:13 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id 126so1428217oig.3
	for <linux-lvm@redhat.com>; Fri, 03 Mar 2017 01:51:12 -0800 (PST)
MIME-Version: 1.0
From: Amjad Syed <amjadcsu@gmail.com>
Date: Fri, 3 Mar 2017 12:51:11 +0300
Message-ID: <CAJWdRQgunTFRS7fmHYTDw1MA7bPCQk+1TAD_q1dq4L2qog_rTA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113d21885982290549d07c0a
Subject: [linux-lvm] Changing from standard partition to LVM partition
	without reinstalling
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

--001a113d21885982290549d07c0a
Content-Type: text/plain; charset=UTF-8

Hello,

We are using  RHEL  7.2 servers to create two node  Active/Passive  High
available system with shared storage (SAN). We are using pacemaker.

The existing  Partition on HDD of  Server is of standard type and  we would
like to move it to LVM type as we have just two nodes and we are not going
to use clvm.

The current partition on HDD is as follows
/   ->  50 GB
swap -> 25 GB
/u01 -> 200GB

What is the best way to change the partition type to LVM without
reinstallation?

--001a113d21885982290549d07c0a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>We are using =C2=A0RHEL =C2=A07.=
2 servers to create two node =C2=A0Active/Passive =C2=A0High available syst=
em with shared storage (SAN). We are using pacemaker.</div><div><br></div><=
div>The existing =C2=A0Partition on HDD of =C2=A0Server is of standard type=
 and =C2=A0we would like to move it to LVM type as we have just two nodes a=
nd we are not going to use clvm.</div><div><br></div><div>The current parti=
tion on HDD is as follows</div><div>/ =C2=A0 -&gt; =C2=A050 GB</div><div>sw=
ap -&gt; 25 GB</div><div>/u01 -&gt; 200GB</div><div><br></div><div>What is =
the best way to change the partition type to LVM without reinstallation?</d=
iv><div><br></div><div><br></div><div><br></div></div>

--001a113d21885982290549d07c0a--
