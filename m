Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5EFM8DW001081
	for <linux-lvm@redhat.com>; Fri, 14 Jun 2013 11:22:08 -0400
Received: from vm08-mail01.alteeve.ca (mail.alteeve.ca [65.39.153.71])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5EFM7L5027202
	for <linux-lvm@redhat.com>; Fri, 14 Jun 2013 11:22:07 -0400
Message-ID: <51BB351E.4020707@alteeve.ca>
Date: Fri, 14 Jun 2013 11:22:06 -0400
From: Digimer <lists@alteeve.ca>
MIME-Version: 1.0
References: <16dd71d1.f00b.13f3e5336d3.Coremail.magazine.lihuiba@163.com>
In-Reply-To: <16dd71d1.f00b.13f3e5336d3.Coremail.magazine.lihuiba@163.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM high availability
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: lihuiba <magazine.lihuiba@163.com>

On 06/13/2013 12:16 PM, lihuiba wrote:
> Please consider the following case:
> there are multiple storage servers each configured as LVM on top of a RAID,
> and the servers are connected by DRBD to synchronize the RAIDs.
>
> The question is
> 1) can I safely active a read-only volume on all of the servers?

Depends on your file system. GFS2 and OCFS2 is fine. Most all others are 
not. In either case, you can't mount a Secondary DRBD resource no matter 
what.

> 2) can I safely active a read-write volume on a randomly chosen server?

You need a cluster-aware files system like GFS2 and, in the context of 
LVM, you need clustered VGs and LVs which requires clvmd to be running.

> 3) how about thin pool and volumes?

I've not played with these.

-- 
Digimer
Papers and Projects: https://alteeve.ca/w/
What if the cure for cancer is trapped in the mind of a person without 
access to education?
