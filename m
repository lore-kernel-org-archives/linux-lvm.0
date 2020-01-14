Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C09852166B28
	for <linux-lvm@redhat.com>; Tue, 14 Jan 2020 09:52:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FA83101D22A
	for <linux-lvm@redhat.com>; Tue, 14 Jan 2020 09:52:33 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id c16so13123958ioh.6
	for <linux-lvm@redhat.com>; Tue, 14 Jan 2020 01:52:29 -0800 (PST)
MIME-Version: 1.0
From: Paul Dann <pdgiddie@gmail.com>
Date: Tue, 14 Jan 2020 09:52:17 +0000
Message-ID: <CALZj-VrVhXLSBTthE5nsL9wQVaTr2XgJRULRFKvNqi9CCbvV5A@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c76b93059c168cbd"
Subject: [linux-lvm] lvreduce thin-pool
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

--000000000000c76b93059c168cbd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi there,

I've been following Ede Wolf's thread with interest, but it hasn't quite
covered my query, and I've not been able to find much about this in the
archives:

Are there any plans to implement reducing of thin pools? I've been bitten
several times by carelessly allowing a thin pool to expand onto unsuitable
storage and subsequently being unable to reduce the pool again to ensure IO
performance of the pool. (I know that better forward planning can mitigate
this.)

Mainly, I'm wondering if there are technical reasons this hasn't been
implemented yet? On the face of it, I'd have expected this to be a
relatively straight-forward procedure? But I'd be interested in why this
might not be the case.

Cheers,
Paul

--000000000000c76b93059c168cbd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi there,</div><div><br></div><div>I&#39;ve been foll=
owing Ede Wolf&#39;s thread with interest, but it hasn&#39;t quite covered =
my query, and I&#39;ve not been able to find much about this in the archive=
s:</div><div><br></div><div>Are there any plans to implement reducing of th=
in pools? I&#39;ve been bitten several times by carelessly allowing a thin =
pool to expand onto unsuitable storage and subsequently being unable to red=
uce the pool again to ensure IO performance of the pool. (I know that bette=
r forward planning can mitigate this.)<br></div><div><br></div><div>Mainly,=
 I&#39;m wondering if there are technical reasons this hasn&#39;t been impl=
emented yet? On the face of it, I&#39;d have expected this to be a relative=
ly straight-forward procedure? But I&#39;d be interested in why this might =
not be the case.</div><div><br></div><div>Cheers,</div><div>Paul<br></div><=
/div>

--000000000000c76b93059c168cbd--
