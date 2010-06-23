Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5NBl004012128
	for <linux-lvm@redhat.com>; Wed, 23 Jun 2010 07:47:00 -0400
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5NBkn9D005789
	for <linux-lvm@redhat.com>; Wed, 23 Jun 2010 07:46:50 -0400
Received: by bwz9 with SMTP id 9so570662bwz.33
	for <linux-lvm@redhat.com>; Wed, 23 Jun 2010 04:46:49 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 23 Jun 2010 13:46:49 +0200
Message-ID: <AANLkTinqbHHCIv4YLoBGnJ0xHuA0psm3j50bwTkY4oLS@mail.gmail.com>
From: Philippe Cerfon <philcerf@googlemail.com>
Subject: [linux-lvm] when to vgscan/pvscan/lvscan
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

(seems that this did not came through the first time?!)

Hi.

(Talking always about lvm2...)

Is there a real technical difference between pvscan, vgscan and lvscan?
I mean as far as I understand one always needs all information about
PVs,VGs and LVs in order to get the later.
So apart from different textual "debug" output, do all the same, i.e.
scanning over all configured block devices, looking for PVs and
scanning their VG-descriptors in order to get the information about al
LVs?


Is there ever the need to rund pvscan/vgscan/lvscan manually and if so
in which cases? I mean the vgscan manpage says that this happens
automatically in lvm2, so if I e.g. have my init-scripts and want to
make the LVs available, is it generally enough to do
vgchange -an
or can there be cases when the preceding vgscan is still required?


Thanks,
Philippe.
