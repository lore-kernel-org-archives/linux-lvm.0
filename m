Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p7ABe7YG002209
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2011 07:40:07 -0400
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7ABe5qO014169
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2011 07:40:06 -0400
Received: by fxh19 with SMTP id 19so1244740fxh.33
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2011 04:40:05 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 10 Aug 2011 13:40:05 +0200
Message-ID: <CAMN6oRmKSkiBqLwGjVyCFnoqGPbQYk=TTukFO_GdKO-M3FdcMw@mail.gmail.com>
From: Sun_Blood <sblood@gmail.com>
Subject: [linux-lvm] Securing against data lost
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

Hi

Hope someone have time to answer this because google is not giving me
the answers I need.

I have just started to use LVM(a few years later then everyone) and
I'm wondering how I can protect my self from failure to the LVM setup.
Before when I had for example 3 harddisk at 200gb each (/dev/sd[b-d])
with one partition each and a disk failed I would maximum lose 200gb.
Now with LVM the LV is 600gb I'm worried that I can loose all if one
disk have a problem.

So how can I protect myself from this?
What happens if I accidental destroys the LVM information?
What happens if the first disk fails do I lose everything on the two
second disk too?

Best regards
Martin
