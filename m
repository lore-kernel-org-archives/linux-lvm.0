Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i640mx024426
	for <linux-lvm@redhat.com>; Sat, 3 Jul 2004 20:48:59 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i640mue1030238
	for <linux-lvm@redhat.com>; Sat, 3 Jul 2004 20:48:57 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.myself.gen.nz (Postfix) with ESMTP id 8D267403E1
	for <linux-lvm@redhat.com>; Sun,  4 Jul 2004 12:51:14 +1200 (NZST)
Received: from mail.myself.gen.nz ([127.0.0.1])
	by localhost (guardian.cyber.god [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 25907-04 for <linux-lvm@redhat.com>;
	Sun,  4 Jul 2004 12:51:12 +1200 (NZST)
Received: from fosi (fosi.cyber.god [192.168.1.2])
	by mail.myself.gen.nz (Postfix) with ESMTP id 14D3B403E0
	for <linux-lvm@redhat.com>; Sun,  4 Jul 2004 12:51:12 +1200 (NZST)
From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] pvmove - Can't expand LV: Mirror
	supportmissingfromkernel?
Date: Sun, 4 Jul 2004 12:49:06 +1200
Message-ID: <000101c46160$b5cb22c0$0201a8c0@fosi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040703164638.GF32058@agk.surrey.redhat.com>
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

Alasdair G Kergon wrote:
> 
> On Sat, Jul 03, 2004 at 02:30:45PM +1200, Steve Wray wrote:
> > Indeed and this is what I have in the .config for a kernel which can't 
> > do a pvmove;
>  
> > CONFIG_DM_MIRROR=m
> 
> > oh and, yes, I did run modprobe dm-mirror.
> 
> What does 'dmsetup targets' return?

# dmsetup targets
Unknown command
Usage:

dmsetup [--version] [-v|--verbose [-v|--verbose ...]]
        [-r|--readonly] [-j|--major <major>] [-m|--minor <minor>]
[snip]

So I got an updated version of dmsetup and now I get;
# dmsetup targets
mirror           v1.0.1
striped          v1.0.1
linear           v1.0.1
error            v1.0.1

but pvmove -tv /dev/hdf4 still fails with;

  ABORTING: Temporary mirror activation failed.

> Does it include 'mirror' in the output list?

does now
:)

> (And confirm what versions you're using: run 'lvm version')

# lvm version
  LVM version:     2.00.08 (2003-11-14)
  Library version: 1.00.07-ioctl (2003-11-21)
  Driver version:  4.1.0
