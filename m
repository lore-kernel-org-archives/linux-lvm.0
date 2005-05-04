Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j44CShkk032680
	for <linux-lvm@redhat.com>; Wed, 4 May 2005 13:28:43 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DTIzb-000265-0Y
	for linux-lvm@redhat.com; Wed, 04 May 2005 13:28:43 +0100
Date: Wed, 4 May 2005 13:28:42 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] "Close failed: Bad file descriptor" messages on
	pvcreate
Message-ID: <20050504122842.GH9049@agk.surrey.redhat.com>
References: <50C05B7AA7D6924FB5E384EF14BC647B676981@inba1mx2.corp.emc.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50C05B7AA7D6924FB5E384EF14BC647B676981@inba1mx2.corp.emc.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 04, 2005 at 10:49:00AM +0100, Sreedharan_Vinod@emc.com wrote:
> > When I do pvcreate, I get deluged with "pvcreate  /dev/sdf: close failed:
> > Bad file descriptor" messages.

> > On the same system, pvcreate another device succeeds.

What architecture is this?

It sounds similar to a known bug that is fixed in the RHEL4 Update 1 package.

Alasdair
-- 
agk@redhat.com
