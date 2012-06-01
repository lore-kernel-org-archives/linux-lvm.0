Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q512iugk020319
	for <linux-lvm@redhat.com>; Thu, 31 May 2012 22:44:56 -0400
Received: from sneak2.sneakemail.com (sneak2.sneakemail.com [38.113.6.65])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q512is92027299
	for <linux-lvm@redhat.com>; Thu, 31 May 2012 22:44:55 -0400
Date: Fri, 1 Jun 2012 02:44:52 +0000
Message-ID: <10052-1338518692-322662@sneakemail.com>
MIME-Version: 1.0
From: c8wpsungrk@snkmail.com
Subject: [linux-lvm] Revert snapshot (lvconvert --merge) without removing
	snapshot
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

Is there any way to revert to a snapshot (i.e. merge a snapshot into origin like what lvconvert --merge does) without removing the snapshot?

I want to take a snapshot of a volume so I can do some experiments (without fear).  If the experiments fail, I want to revert to the snapshot, but frequently I want to retry the experiments in a different way, so I don't want the snapshot to be removed because I may want to revert to it again later.

Is there anyway to do this in lvm2?  If not, please consider this a feature request.

    thanks,
    Peter Canning
