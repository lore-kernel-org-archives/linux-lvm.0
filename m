Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3BGIW9H005977
	for <linux-lvm@redhat.com>; Fri, 11 Apr 2008 12:18:32 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3BGILxY023769
	for <linux-lvm@redhat.com>; Fri, 11 Apr 2008 12:18:22 -0400
Date: Fri, 11 Apr 2008 18:18:20 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM mirroring questions...
Message-ID: <20080411161817.GA5028@percy.comedia.it>
References: <69649d440804080414qba1bb21waa98de61c11876f8@mail.gmail.com>
	<Pine.LNX.4.44.0804080716300.23698-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0804080716300.23698-100000@bmsred.bmsi.com>
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
To: linux-lvm@redhat.com

On Tue, Apr 08, 2008 at 07:25:05AM -0400, Stuart D. Gathman wrote:
>On Tue, 8 Apr 2008, Jess Bromley wrote:
>
>> Also does the fact that software RAID doesn't use a disk log mean that
>> LVM is actually better/faster than RAID at correctly recovering from
>> crashes that leave the mirrored disks out of sync?
>
>The md driver doesn't track which blocks are out of sync.  It recovers
>from a crash by copying the entire partition.  On recent versions, it
>tracks how far it has gotten on the resync in the md superblock, so that it
>doesn't have to start from scratch on a reboot.

this is not entirely correct.
md has a bitmap feature that is used to track which blocks are out of
sync.

>The md driver keeps its superblock at the *end* of the partition.  This
>means that you can mount any filesystem/pv as the raw partition.
again, newer version of md allow to put the superblock at the beginning
of the device (or 4k from the beginning)

>This requires that LVM give md devices preference when scanning for
>PVs to work correctly :-)

this should be the default in lvm.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
