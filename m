Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r329UxsQ010032
	for <linux-lvm@redhat.com>; Tue, 2 Apr 2013 05:30:59 -0400
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r329Uurk001361
	for <linux-lvm@redhat.com>; Tue, 2 Apr 2013 05:30:57 -0400
Received: by mail-lb0-f179.google.com with SMTP id t1so267524lbd.38
	for <linux-lvm@redhat.com>; Tue, 02 Apr 2013 02:30:56 -0700 (PDT)
MIME-Version: 1.0
From: =?ISO-8859-1?Q?Lo=EFc?= <loic@recisio.com>
Date: Tue, 2 Apr 2013 11:30:36 +0200
Message-ID: <CAA9cXK6YG11ofKBUcj_N=HdPf=-JRSoHzQcFJXH2XS2gOyHP=w@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Alert before LVM snapshot becomes full
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hi all,

Is there a way to launch a script or disable an LVM snaphot before it
becomes full ?
For example I would like to launch a script that will umount the LVM
snapshot and delete it if it reaches 90%.

Lo=EF=BF=BDc
