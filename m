Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i632Mc009953
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 22:22:38 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i632Mae1008542
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 22:22:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.myself.gen.nz (Postfix) with ESMTP id 0EC83403E1
	for <linux-lvm@redhat.com>; Sat,  3 Jul 2004 14:24:44 +1200 (NZST)
Received: from mail.myself.gen.nz ([127.0.0.1])
	by localhost (guardian.cyber.god [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 05665-03 for <linux-lvm@redhat.com>;
	Sat,  3 Jul 2004 14:24:42 +1200 (NZST)
Received: from fosi (fosi.cyber.god [192.168.1.2])
	by mail.myself.gen.nz (Postfix) with ESMTP id 720A1403E0
	for <linux-lvm@redhat.com>; Sat,  3 Jul 2004 14:24:42 +1200 (NZST)
From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] pvmove - Can't expand LV: Mirror support
	missingfromkernel?
Date: Sat, 3 Jul 2004 14:22:44 +1200
Message-ID: <008e01c460a4$a022ba30$0201a8c0@fosi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040702234154.GB1506@chaos.ao.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Dan Merillat wrote:
> On Sat, 03 Jul 2004, Steve Wray wrote:
> 
> > I strongly doubt that you'll get any help out of the list on this,
> > but if someone does send you a fix which works, off-list, *please*
> > send it to me too; I have two failing disks which I need to 
> decommission.
> 
> stock 2.6 dosn't have many dm-targets in it.  Pick up the LVM patches
> off the website and apply them for the more "experimental" things like
> mirroring.

You mean like dm-mirror?
