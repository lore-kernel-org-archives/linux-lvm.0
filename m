Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iA8KFTbM030934
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 20:15:29 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CRFvF-0006Q3-4I
	for linux-lvm@redhat.com; Mon, 08 Nov 2004 20:15:29 +0000
Date: Mon, 8 Nov 2004 20:15:29 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Creating PV over a /dev/mapper device
Message-ID: <20041108201529.GN2717@agk.surrey.redhat.com>
References: <tk9so0di0jsl44dagc1dl8at6e9ld4r1be@4ax.com>
	<20041107192450.GF2717@agk.surrey.redhat.com>
	<3e4to0lgsvjoe6mqijohlh8558vbbb9uhj@4ax.com>
	<20041108142811.GH2717@agk.surrey.redhat.com>
	<e5kvo0tad7ubm03ffp22b022u301lddis2@4ax.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5kvo0tad7ubm03ffp22b022u301lddis2@4ax.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 08, 2004 at 09:09:02PM +0100, Roman Medina-Heigl Hernandez wrote:
> But don't worry. It appears I'm using an old version of lvm (I
> downgraded to solve the "Internal error: unknown device-mapper task
> 16" problem).
 
> jupiter:/etc/lvm# lvm version
>   LVM version:     2.00.06 (2003-08-20)
>   Library version: 1.00.05-ioctl-cvs (2003-09-01)
>   Driver version:  4.1.0
> jupiter:/etc/lvm# 
 
Don't *downgrade* to versions - they'll have even more known bugs in them!
Upgrade your packages (lvm2 + device-mapper) instead.

Alasdair
-- 
agk@redhat.com
