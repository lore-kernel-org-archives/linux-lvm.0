Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66D05176D7
	for <linux-lvm@redhat.com>; Tue,  2 May 2017 01:43:13 +0000 (UTC)
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3D12C0BE1A4
	for <linux-lvm@redhat.com>; Tue,  2 May 2017 01:43:12 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id m36so101259083qtb.0
	for <linux-lvm@redhat.com>; Mon, 01 May 2017 18:43:12 -0700 (PDT)
MIME-Version: 1.0
From: Sen Han <hansen3032@gmail.com>
Date: Mon, 1 May 2017 21:43:11 -0400
Message-ID: <CAKkvdVDSL+zoFGtWNA7Scwb22JYiTCv28quxkv7S_STcT6wEbw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113a31469dea97054e80a962
Subject: [linux-lvm] init script 'command not found error'
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

--001a113a31469dea97054e80a962
Content-Type: text/plain; charset=UTF-8

Recently we got some error say 'pvcreate: command not found error' in our
init script. Turns out to be the pvcreate, and other commands like
vgcreate, are just sym links to the command 'lvm'.
And the symlink at the init script phase are not available yet.

Actually, pvcreate, pvremove, lvdisplay, pvdisplay are all just symlinks to
lvm.
seems it directly links to a subcommand,
such as 'pvcreate' is equivalent to 'lvm pvcreate'.

Is there documentation about how these symlinks works? such as how they are
generated etc. Like a link to the source repo,

is it safe to replace pvcreate with 'lvm pvcreate' in my script?

--001a113a31469dea97054e80a962
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Recently we got some error say &#39;pvcreate: command not =
found error&#39; in our init script. Turns out to be the pvcreate, and othe=
r commands like vgcreate, are just sym links to the command &#39;lvm&#39;.=
=C2=A0<br>And the symlink at the init script phase are not available yet.=
=C2=A0<br><br>Actually, pvcreate, pvremove, lvdisplay, pvdisplay are all ju=
st symlinks to lvm.=C2=A0<br>seems it directly links to a subcommand,=C2=A0=
<br>such as &#39;pvcreate&#39; is equivalent to &#39;lvm pvcreate&#39;.<br>=
<br>Is there documentation about how these symlinks works? such as how they=
 are generated etc. Like a link to the source repo,<br><br>is it safe to re=
place pvcreate with &#39;lvm pvcreate&#39; in my script?</div>

--001a113a31469dea97054e80a962--
