Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAEKVksm029085
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 15:31:46 -0500
Received: from mail-relay.seakr.com (mx2.seakr.com [64.207.50.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAEKUsHh023241
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 15:31:32 -0500
Received: from mx-inside.seakr.com (mx-inside.seakr.com [192.168.100.31])
	by mail-relay.seakr.com (8.12.10/8.12.10) with ESMTP id mAEKQAip026827
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 13:26:12 -0700
Received: from collaborate.seakr.com (collaborate.seakr.com [192.168.100.28])
	by mx-inside.seakr.com (Postfix) with ESMTP id C508644801
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 13:30:51 -0700 (MST)
Message-Id: <491D7D870200009900030FD7@collaborate.seakr.com>
Date: Fri, 14 Nov 2008 13:30:47 -0700
From: "Nick Couchman" <Nick.Couchman@seakr.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Disappearing Volume Group
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I'm having an issue with LVM2 right now that has me a little worried.  I
have a system set up with a few RAID arrays attached via FC.  Because
there are multiple paths, I've configured one of these RAID arrays via
multipathd.  I set it up, configured it with multipath (it shows up
under /dev/dm-18) and then used pvcreate to "mark" it as an LVM2 device.
I then used vgcreate to create a volume group (called "raid50") using
this pv as the only device in the volume group.  This worked quite well
for quite a while, until I deleted a LVM volume in a *different* volume
group and now the raid50 volume group has disappeared.  It gets stranger
because the two volumes that are active on this volume group were
exported with iSCSI and are still available.  The devices entires
in /dev/mapper and links in /dev/raid50 are still there and still appear
to be working.  However, none of the LVM2 commands will show this volume
group or its member volumes.  This has me a little worried as to what
the result is going to be when I reboot the system, restart multipath,
etc.

So, I'm wondering if anyone has any diagnostic or recovery steps they
can walk me through to diagnose why this has happened, what I might be
able to do to recover it (without a reboot - this is a production iSCSI
target server), and whether I'm going to see the volumes next time I
reboot.  Here's some information on versions of software, etc., I have
running:

- rPath Linux (it's actually the Openfiler 2.2 appliance)
- Kernel Version: 2.6.19.7-0.1.x86.i686.cmov
- LVM Version Info:
  LVM version:     2.02.09 (2006-08-17)
  Library version: 1.02.09 (2006-08-15)
  Driver version:  4.10.0
- Multipath Version: 0.4.7

I'd greatly appreciate any hints or advice in the matter.

Thanks,
Nick



This e-mail may contain confidential and privileged material for the sole use of the intended recipient.  If this email is not intended for you, or you are not responsible for the delivery of this message to the intended recipient, please note that this message may contain SEAKR Engineering (SEAKR) Privileged/Proprietary Information.  In such a case, you are strictly prohibited from downloading, photocopying, distributing or otherwise using this message, its contents or attachments in any way.  If you have received this message in error, please notify us immediately by replying to this e-mail and delete the message from your mailbox.  Information contained in this message that does not relate to the business of SEAKR is neither endorsed by nor attributable to SEAKR.
