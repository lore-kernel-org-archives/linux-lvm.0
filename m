Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3R27K9O029057
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2012 22:07:20 -0400
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3R27J4k029437
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2012 22:07:19 -0400
Received: by obbta14 with SMTP id ta14so543264obb.33
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2012 19:07:18 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 27 Apr 2012 14:02:16 +1200
Message-ID: <CAEHxbC2B4yt2Mq2TKs1S0VV-rVfTDm_GTfJ+y-cwU2y2v-yGGA@mail.gmail.com>
From: Greg Zapp <greg.zapp@gmail.com>
Subject: [linux-lvm] Erasing snapshot data from disk
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

Hola,

I'm looking into ways to ensure that the blocks copied into the
snapshot are zero'd out on disk after/during snapshot removal.  Has
anybody been faced with this issue?


-Greg
