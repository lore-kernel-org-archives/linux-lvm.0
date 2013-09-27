Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8R9QZv0024997
	for <linux-lvm@redhat.com>; Fri, 27 Sep 2013 05:26:35 -0400
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8R9QYoT026844
	for <linux-lvm@redhat.com>; Fri, 27 Sep 2013 05:26:34 -0400
Received: by mail-ob0-f178.google.com with SMTP id uy5so2966997obc.23
	for <linux-lvm@redhat.com>; Fri, 27 Sep 2013 02:26:34 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 27 Sep 2013 17:26:33 +0800
Message-ID: <CAHuLeSktKr++TH6cqsaHYS9CEDNCm9DVYAy=f8nWPkz8vEpjFw@mail.gmail.com>
From: Justin Lee <justinlee5455@gmail.com>
Subject: [linux-lvm] Continue an interrupted mirror sync?
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

Hello,

I would like to know If a mirror sync process is interrupted by some
uncontrollable reason, is it possible to continue the sync process
near the point where it was interrupted?

Volume mirroring may take a long time to be done, if the connection of
the storage device is over an unreliable channel (such as SAN, iSCSI
or Fibre Channel) it is possible that ongoing sync will be interrupted
over and over again due to frequent connection loss so that the sync
will never complete...

Has LVM existing solutions for the issue? Or any suggestion? Thank you!

Justin
