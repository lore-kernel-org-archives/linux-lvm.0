Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i632Ug011189
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 22:30:42 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i632UaXn023588
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 22:30:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.myself.gen.nz (Postfix) with ESMTP id 80B25403E1
	for <linux-lvm@redhat.com>; Sat,  3 Jul 2004 14:32:44 +1200 (NZST)
Received: from mail.myself.gen.nz ([127.0.0.1])
	by localhost (guardian.cyber.god [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 05665-05 for <linux-lvm@redhat.com>;
	Sat,  3 Jul 2004 14:32:42 +1200 (NZST)
Received: from fosi (fosi.cyber.god [192.168.1.2])
	by mail.myself.gen.nz (Postfix) with ESMTP id BB15F403E0
	for <linux-lvm@redhat.com>; Sat,  3 Jul 2004 14:32:42 +1200 (NZST)
From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] pvmove - Can't expand LV: Mirror support
	missingfromkernel?
Date: Sat, 3 Jul 2004 14:30:45 +1200
Message-ID: <009801c460a5$be609ed0$0201a8c0@fosi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040703002208.GN10907@polop.usc.edu>
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

Garrick Staples wrote:
> 
> On Fri, Jul 02, 2004 at 07:41:54PM -0400, Dan Merillat alleged:
> > On Sat, 03 Jul 2004, Steve Wray wrote:
> > 
> > > I strongly doubt that you'll get any help out of the list on this,
> > > but if someone does send you a fix which works, off-list, *please*
> > > send it to me too; I have two failing disks which I need to decommission.
> > 
> > stock 2.6 dosn't have many dm-targets in it.  Pick up the LVM patches
> > off the website and apply them for the more "experimental" things like
> > mirroring.
> 
> What the?
> 
[snip]
> 
> Some of those patch tarballs seem to be patching a whole lot more then
> just dm.

Indeed and this is what I have in the .config for a kernel which can't 
do a pvmove;

CONFIG_BLK_DEV_DM=m
CONFIG_DM_CRYPT=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_MIRROR=m
CONFIG_DM_FLAKEY=m
CONFIG_BLK_DEV_DM_BBR=m


oh and, yes, I did run modprobe dm-mirror.
