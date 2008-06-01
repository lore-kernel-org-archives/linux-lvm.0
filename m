Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m51L9PGB006850
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 17:09:25 -0400
Received: from smtp-out003.kontent.com (smtp-out003.kontent.com [81.88.40.217])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m51L99b0002504
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 17:09:10 -0400
Message-ID: <48430FED.1080306@theendofthetunnel.de>
Date: Sun, 01 Jun 2008 23:09:01 +0200
From: Hannes Dorbath <light@theendofthetunnel.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
References: <20080529231213.GY19431@lug-owl.de>
In-Reply-To: <20080529231213.GY19431@lug-owl.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com, Maximilian Wilhelm <max@rfc2324.org>

Jan-Benedict Glaw wrote:
> However I still fail to find a good approach. One initial idea was to
> export all physical volumes (partitions or full disks) vie NBD, join
> them all on a single machine into one VG/LV, create a filesystem and
> re-export that via NFS/SMB/...  However, all data would need to go
> through the net twice. While speed isn't the most important thing here
> (but storage is!), that's way suboptimal.

GlusterFS with Unify translator is exactly what you are asking for.

http://www.gluster.org/docs/index.php/GlusterFS


-- 
Best regards,
Hannes Dorbath
