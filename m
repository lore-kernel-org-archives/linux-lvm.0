Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6N8qhdf002126
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2012 04:52:43 -0400
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6N8qf7w000737
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2012 04:52:42 -0400
Received: by weyx8 with SMTP id x8so4631308wey.33
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2012 01:52:41 -0700 (PDT)
MIME-Version: 1.0
Sender: fvzwieten@gmail.com
Date: Mon, 23 Jul 2012 10:52:41 +0200
Message-ID: <CALVifsZrOo+D7nWpO3gKd87B1=Sn_F3PQy377etCb8p90=twow@mail.gmail.com>
From: Fred van Zwieten <fvzwieten@vxcompany.com>
Content-Type: multipart/alternative; boundary=bcaec53d58875892a804c57b5eae
Subject: [linux-lvm] Snapshot limit?
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

--bcaec53d58875892a804c57b5eae
Content-Type: text/plain; charset=UTF-8

Hi,

I would like to know is there is a limit on the amount of snapshots one can
take from a single LV.

I have a single LV with a very low changerate, but I have a retention
requirement of about 150 readonly snapshots for it. Is it is at all
possible, will there be a performance hit?

Fred
**

--bcaec53d58875892a804c57b5eae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>I would like to know is there is a limit on the amount of snapsh=
ots one can take from a single LV.<br><br>I have a single LV with a very lo=
w changerate, but I have a retention requirement of about 150 readonly snap=
shots for it. Is it is at all possible, will there be a performance hit?<br=
>
<br>Fred<br><b><font style=3D"color:rgb(51,102,255)" color=3D"#000099"></fo=
nt></b>

--bcaec53d58875892a804c57b5eae--
