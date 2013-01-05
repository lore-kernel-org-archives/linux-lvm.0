Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0505lT8002113
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2013 19:05:47 -0500
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0505j64016854
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2013 19:05:46 -0500
Received: by mail-ea0-f179.google.com with SMTP id i12so6837523eaa.10
	for <linux-lvm@redhat.com>; Fri, 04 Jan 2013 16:05:45 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 4 Jan 2013 16:00:03 -0800
Message-ID: <CAN4=B2mcZiiW=ErH=iNwLbQv=tWnR4bfcMG=1Tu_hvQ+b6heRQ@mail.gmail.com>
From: Brian Chrisman <brchrisman@gmail.com>
Subject: [linux-lvm] question about extending snapshots
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

I'm running rhel6.2 nearly stock.
When I mount a snapshot (writable) and perform an lvextend, the CoW
table increases in size, but the logical volume size (for example,
blockdev output) doesn't change itself.
Is this impossible because the regions of the snapshot volume wouldn't
have any corresponding regions in the origin volume?
Is there any way to change the size reported by a snapshot?

What I'm trying to do is take a snapshot, mount it, do stuff to it,
and if I need, make it bigger, and if I need to, just drop it and
create a new one.
If I just take a snapshot and modify the origin and use a merge, then
space becomes an issue.

thanks,
Brian
