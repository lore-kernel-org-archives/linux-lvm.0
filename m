Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8O2U8r08703
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 22:30:08 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8O2U11r001170
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 22:30:06 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.myself.gen.nz (Postfix) with ESMTP id 7161E18009B
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 14:33:15 +1200 (NZST)
Received: from mail.myself.gen.nz ([127.0.0.1])
	by localhost (guardian.cyber.god [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 01950-04 for <linux-lvm@redhat.com>;
	Fri, 24 Sep 2004 14:33:11 +1200 (NZST)
Received: from [127.0.0.1] (fosi.cyber.god [192.168.1.2])
	by mail.myself.gen.nz (Postfix) with ESMTP id C602D180098
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 14:33:11 +1200 (NZST)
Message-ID: <41538691.2040807@myself.gen.nz>
Date: Fri, 24 Sep 2004 14:29:37 +1200
From: Steve Wray <steve@myself.gen.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] which files, which physical volumes?
Reply-To: Steve Wray <steve.wray@paradise.net.nz>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi there,

Is there any way to find which files in a given logical volume occupy 
extents on a given physical volume?

I am trying to decommission a drive and pvmove still isn't working 
properly. Either that or;

1. pvmove -tv claims to fail when in fact without the -t it would 
actually work. Thie would seem like a joke in very bad taste (on the 
part of the developers.

or

2. pvmove -v which is supposed to give verbose progress output, in fact 
will sit there for a *very* long time (half an hour or more) with no 
progress output and push load up extremely high.

Or maybe pvmove is *still* broken, in which case I need to find the 
files which occupy that physical volume, move them to a different 
logical volume altogether and then forcibly remove that physical volume 
without regard to the files that are no longer on it... and hopefuly 
this won't cause corruption on the filesystem on that logical volume.

help?

Thanks!
