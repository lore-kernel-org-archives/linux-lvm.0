Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k46HBbPf016951
	for <linux-lvm@redhat.com>; Sat, 6 May 2006 13:11:37 -0400
Received: from rs19.luxsci.com (rs19.luxsci.com [65.61.136.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k46HBVL5012042
	for <linux-lvm@redhat.com>; Sat, 6 May 2006 13:11:31 -0400
Received: from dsl-201-138-174-140.prod-infinitum.com.mx
	(dsl-201-138-174-140.prod-infinitum.com.mx [201.138.174.140]
	(may be forged)) (authenticated bits=0)
	by rs19.luxsci.com (8.13.6/8.13.6) with ESMTP id k46HBN4x011124
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Sat, 6 May 2006 12:11:25 -0500
Subject: Re: [linux-lvm] Two Plorilant servers (Redhat) trying to access a
	HP MSA1000
From: Edgar Luna <eald@linuxuanl.org>
In-Reply-To: <20060506082551.GA10926@percy.comedia.it>
References: <1146768607.10908.21.camel@ip6-localhost>
	<20060506082551.GA10926@percy.comedia.it>
Date: Sat, 06 May 2006 12:11:21 -0500
Message-Id: <1146935481.9842.17.camel@ip6-localhost>
Mime-Version: 1.0
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

On Sat, 2006-05-06 at 10:25 +0200, Luca Berra wrote:
> On Thu, May 04, 2006 at 01:50:06PM -0500, Edgar Luna wrote:
> >I have two servers with RedHat EL3 connected to an HP MSA1000. What I
> >want with this servers write/read the disks from the MSA1000.
> >
> >I know that LVM is unaware of simultaneous access to one device, so I
> >tried to divide the storage of MSA1000 in two units (created via the ACU
> >application), that are seen by the RedHat servers as /dev/sda
> >and /dev/sdb. Then I created a Physical Volume for each one a Logical
> >Group and finally a Logical Volume for each of this.
> 
> could you clarify what your problem is?
> 
Actually I have the *doubt* about the LVM capabilities. I know that LVM
can't control when trying to access the data simultaneously from many
servers. So I did this workaround of making two units in the MSA1000,
and making that each server access one of this units. But I want to
*know* if this will works, as far as I can see in this moment is working
but I want to know if what I did is wrong.

> no, you cannot, besides that, why did you buy an intellignet storage if
> you only wanted a disk shelf?
> 
Well, I didn't, but I guess they did that so they can change disks if
something wrong, and add more space later. Anyway I only was asked to
make the two proliant servers runs linux and write on the MSA1000 at the
same time. Then I realize that with LVM both servers can't access to the
same filesystem, so both can't use the whole space in the MSA1000. And
my problem begun, how to make this two Proliant server to write/read to
MSA1000.

Thanks.
