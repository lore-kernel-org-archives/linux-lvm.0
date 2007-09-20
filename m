Received: from [10.32.4.9] (vpn-4-9.str.redhat.com [10.32.4.9])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l8KKQtoO017551
	for <linux-lvm@redhat.com>; Thu, 20 Sep 2007 22:26:55 +0200
Message-ID: <46F2D78F.5020705@redhat.com>
Date: Thu, 20 Sep 2007 22:26:55 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] exception when snapshot size is less than the volume
	size
References: <258405.7001.qm@web33603.mail.mud.yahoo.com>
In-Reply-To: <258405.7001.qm@web33603.mail.mud.yahoo.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

this is an old snapshot bug, already fixed in all
recent kernels - see http://bugzilla.kernel.org/show_bug.cgi?id=7040

Plese could you try to apply patch mentioned in this bugzilla ?
also here
http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.18.y.git;a=commitdiff;h=2b64e22fdbc35b4a0e7c1cbda590daaced401c35;hp=6e28fa8b0390dcbb883994f3c634c1f56fe4f93a

(or simply use latest stable 2.6.18.8 kernel)

Milan
--
mbroz@redhat.com

Sagar Borikar wrote:
> In my NAS box, I observed strange thing yesterday. I had the snapshot
> size (32MB) less than volume size was (10 GB) You can say I was trying
> to do failure analysis of my box. The LVM HOwto for snapshot says
> "
> **
> 
> 	
> If the snapshot logical volume becomes full it will be dropped (become
> unusable) so it is vitally important to allocate enough space. The
> amount of space necessary is dependent on the usage of the snapshot, so
> there is no set recipe to follow for this. If the snapshot size equals
> the origin size, it will never overflow.
> 
> "
> But my box was crashed in this scenario.
> Was wondering why didn't it disable the snapshots. 
> The underlying processor is MIPS and linux kernel version is 2.6.18.
> After delving little bit in the sources I found that break is occurring
> while blowing away the snapshot facility -- so it`s not surprising that
> snapshots do not work anymore. Just before the error,
> kcopyd_client_destroy is called -- so that`s it for kcopyd jobs -- hence
> snapshots. The snapshot faciltiy is gone at that point, with or without
> the BUG_ON. The error actually occurs while freeing the exception tables
> in the slab cache.
> 
> Any pointers if this has been resolved?
> I am working with lvm version 2.02.28.  and device mapper version 1.02.22
