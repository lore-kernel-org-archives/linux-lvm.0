Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6JFSP5e019387
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2016 11:28:25 -0400
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62EA046298
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2016 15:28:23 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id u134so18601839ywg.3
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2016 08:28:23 -0700 (PDT)
MIME-Version: 1.0
From: Scott Sullivan <ssullivan@liquidweb.com>
Date: Tue, 19 Jul 2016 11:28:22 -0400
Message-ID: <CAOXD2Kufsndmiian5NwV5Cmg+CAZeiKRyzDRQdazbkOzs0LL9Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1140959638bb310537febc8b
Subject: [linux-lvm] Snapshots & data security
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

--001a1140959638bb310537febc8b
Content-Type: text/plain; charset=UTF-8

Hello,

Could someone please clarify if there is a legitimate reason to worry about
data security of a old (removed) LVM snapshot?

For example, when you lvremove a LVM snapshot, is it possible for data to
be recovered if you create another LVM and it happens to go into the same
area as the old snapshot we lvremoved?

If this helps clarify, do we have to worry about security scrubbing a LVM
snapshot for data security ?

--001a1140959638bb310537febc8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hello,<br><br></div>Could someone please cl=
arify if there is a legitimate reason to worry about data security of a old=
 (removed) LVM snapshot? <br><br></div>For example, when you lvremove a LVM=
 snapshot, is it possible for data to be recovered if you create another LV=
M and it happens to go into the same area as the old snapshot we lvremoved?=
<br><br></div>If this helps clarify, do we have to worry about security scr=
ubbing a LVM snapshot for data security ?<br></div>

--001a1140959638bb310537febc8b--
