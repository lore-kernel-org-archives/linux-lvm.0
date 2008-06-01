Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m51IR2Kc022923
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 14:27:02 -0400
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m51IQVoV030194
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 14:26:31 -0400
Received: from davidb by mail.davidb.org with local (Exim 4.69 #1 (Debian))
	id 1K2sGB-0003aa-Ke
	for <linux-lvm@redhat.com>; Sun, 01 Jun 2008 11:26:27 -0700
Date: Sun, 1 Jun 2008 11:26:27 -0700
From: David Brown <lvm@davidb.org>
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
Message-ID: <20080601182627.GA13492@old.davidb.org>
References: <20080531070328.GD19431@lug-owl.de>
	<Pine.LNX.4.44.0805312039360.15217-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0805312039360.15217-100000@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, May 31, 2008 at 08:42:09PM -0400, Stuart D. Gathman wrote:

>Any possible scheme combining disks over the network is going to
>send the data over the network twice.  The solution is simple -
>put the low level disk traffic on its own network.  Consider it
>a long distance SCSI bus.  If you think about it, normal NFS disk traffic
>goes over a "network" twice also.  Once over the ethernet, and again
>over the IDE/SCSI/SATA "network".

It seems that in a proper cluster filesystem and a proper cluster volume
manager, each node would hold the volume meta data and only need to access
the drives containing the data it needs.  The data shouldn't have to move
over the network twice, only directly between the node holding the disk and
the node using the data.  That's actually kind of the whole point of a
cluster filesystem.

The hard part is the locking so that these nodes can all update the
filesystem without hopelessly scrambling it.

   <http://en.wikipedia.org/wiki/Shared_disk_file_system>

David
