Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r1QIijvf015521
	for <linux-lvm@redhat.com>; Tue, 26 Feb 2013 13:44:45 -0500
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1QIiiVE023580
	for <linux-lvm@redhat.com>; Tue, 26 Feb 2013 13:44:44 -0500
Received: by mail-pa0-f44.google.com with SMTP id kp1so2627922pab.3
	for <linux-lvm@redhat.com>; Tue, 26 Feb 2013 10:44:44 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 26 Feb 2013 15:44:43 -0300
Message-ID: <CAEZ+n-hGcgRPvc+Rx1co3G_Bd-n8mC+5LUhdkSqiz9PRdtt27Q@mail.gmail.com>
From: Leo Antonio <heiligerstein@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bacc40c10502e04d6a50d59
Subject: [linux-lvm] How does LVM-Cache work?
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

--047d7bacc40c10502e04d6a50d59
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello, everyone.

I'm willing to do research about second-level cache using SSDs and I think
that the best way to do this is using LVM/Device Mapper, because other
implementations are based on FUSE, virtualization layers, and others.

What I'm trying to do is to develop a subsystem that will put hot
blocks/PEs on SSDs-Cache, as well as group related blocks/PEs on cache
automatically. Not simply put on SSD the most  used files or directories.

The problem is that I could not find any documentation about DM or LVM to
help my research and development.

Could you point me to some documentation or what's the best way to
accomplish this?

Thanks!

Leonardo Ant=F4nio dos Santos
Federal University of Paran=E1 (Brazil)

--047d7bacc40c10502e04d6a50d59
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hello, everyone.</div><div><br></div><div>I&#39;m willing to do resear=
ch about second-level cache using SSDs and I think that the best=A0way to=
=A0do this is=A0using LVM/Device Mapper, because other implementations are =
based on=A0FUSE,=A0virtualization layers, and others.</div>
<div><br></div><div>What I&#39;m trying to do is to develop a subsystem tha=
t will=A0put hot blocks/PEs on SSDs-Cache, as well as group related blocks/=
PEs on cache automatically. Not simply put on SSD the most =A0used=A0files =
or directories.</div>
<div><br></div><div>The problem is that I could not find any documentation =
about DM or LVM to help my=A0research and development.</div><div><br></div>=
<div>Could you point me to some documentation or what&#39;s the best way to=
 accomplish this?</div>
<div><br></div><div>Thanks!</div><div><br></div><div>Leonardo Ant=F4nio dos=
 Santos</div><div>Federal University of Paran=E1 (Brazil)</div>

--047d7bacc40c10502e04d6a50d59--
