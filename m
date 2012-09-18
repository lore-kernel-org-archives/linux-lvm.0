Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8IJo4u6009318
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2012 15:50:05 -0400
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8IJo35h029980
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2012 15:50:03 -0400
Received: by qcro28 with SMTP id o28so222906qcr.33
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2012 12:50:03 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 18 Sep 2012 21:50:03 +0200
Message-ID: <CAHwWuAHdBRDu9DOoW_eFgH1oRiF7UEz0vSNyYYiYMR9na9m5gw@mail.gmail.com>
From: =?ISO-8859-1?B?ROluZXMgTultZXRo?= <mr.nemeth.denes@gmail.com>
Content-Type: multipart/alternative; boundary=20cf3005dc9836360804c9ff329d
Subject: [linux-lvm] How to reliably detect duplicate PVs with the same UUID
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

--20cf3005dc9836360804c9ff329d
Content-Type: text/plain; charset=ISO-8859-1

Hi all

Can anyone help me how
1. can I detect if multiple PV with the same UUID is present?
2. determine the name of the name of the volume group in which the multiple
pvs are found

The only thing that I could come up with:

The return status of pvs is zero.
if [ `pvs | grep Duplicate | wc -l` -ne 0 ] ; then
  echo "Found duplicates"
fi

The problem with this is that "Duplicates" is language specific :(

The second problem with pvs is that it incorrectly reports device names.
It says that "using /dev/sda instead of /dev/sdb"
/dev/sda pvuuid vgname

it is compleatly undeterministic if sda or sdb is reported
even if logical volume is active in that volume group
naturally after vgimportclone /dev/sdb
pvs returns to behave normally

Thanks

--20cf3005dc9836360804c9ff329d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all<br><br>Can anyone help me how <br>1. can I detect if multiple PV wit=
h the same UUID is present?<br>2. determine the name of the name of the vol=
ume group in which the multiple pvs are found<br><br>The only thing that I =
could come up with:<br>
<br>The return status of pvs is zero.<br>if [ `pvs | grep Duplicate | wc -l=
` -ne 0 ] ; then<br>=A0 echo &quot;Found duplicates&quot;<br>fi<br><br>The =
problem with this is that &quot;Duplicates&quot; is language specific :(<br=
>
<br>The second problem with pvs is that it incorrectly reports device names=
.<br>It says that &quot;using /dev/sda instead of /dev/sdb&quot;<br>/dev/sd=
a pvuuid vgname<br><br>it is compleatly undeterministic if sda or sdb is re=
ported<br>
even if logical volume is active in that volume group<br>naturally after vg=
importclone /dev/sdb<br>pvs returns to behave normally<br><br>Thanks<br><br=
><br>

--20cf3005dc9836360804c9ff329d--
