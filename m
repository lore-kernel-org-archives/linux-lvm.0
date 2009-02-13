Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1DJxgMo032155
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 14:59:42 -0500
Received: from mail-fx0-f10.google.com (mail-fx0-f10.google.com
	[209.85.220.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1DJxLAO029062
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 14:59:21 -0500
Received: by fxm3 with SMTP id 3so2512487fxm.3
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 11:59:20 -0800 (PST)
MIME-Version: 1.0
Sender: markus.baertschi@gmail.com
Date: Fri, 13 Feb 2009 20:56:50 +0100
Message-ID: <b08d3e870902131156x25bc521ek47260f2f47d98175@mail.gmail.com>
From: Markus Baertschi <markus@markus.org>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] why is pvmove so slow ?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

I'm reorganizing my disks and use pvmove to move data. The operation is
much slower than waht I expected. My pvmove between two SATA disks is
moving along at around 10MB/s. The disks are capable of 80MB/s when
reading/writing with 'dd'.

I'm used to lvm stuff on AIX and there the pvmove equivalent is as fast as
the underlying hardware and I expected the same on my linux box.

How can I improve the performance ?

Markus
--=20
  Markus Baertschi             Phone: ++41 (21) 807 1677
  Bas du Ross=C3=A9 16             Fax  : ++41 (21) 807 1678
  CH-1163, Etoy                Email: markus@markus.org
  Switzerland                  Homepage: www.markus.org
