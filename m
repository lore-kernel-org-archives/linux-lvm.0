Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iA7JOobM003381
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2004 19:24:50 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CQseg-0005RL-2L
	for linux-lvm@redhat.com; Sun, 07 Nov 2004 19:24:50 +0000
Date: Sun, 7 Nov 2004 19:24:50 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Creating PV over a /dev/mapper device
Message-ID: <20041107192450.GF2717@agk.surrey.redhat.com>
References: <tk9so0di0jsl44dagc1dl8at6e9ld4r1be@4ax.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tk9so0di0jsl44dagc1dl8at6e9ld4r1be@4ax.com>
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

On Sun, Nov 07, 2004 at 03:01:10PM +0100, Roman Medina-Heigl Hernandez wrote:
> When trying to create PV, I got the following error:
> jupiter:/# pvcreate /dev/mapper/crypt10
>   /dev/mapper/crypt10: Couldn't find device.
 
By default LVM2 won't let you turn mapped devices into PVs,
or if you're not careful you could get things horribly tangled up.
(e.g. create pv2 on lv1 in vg1, then add pv2 to vg1...)

> I know how to temporaly fix the problem by adding the device to
> /etc/lvm/.cache. 
Don't edit that file: the tools are free to regenerate it whenever
they wish.

> filter = [ "a|/dev/mapper/crypt.*|" ]
> scan = [ "/dev/mapper" "/dev" ]
 
As long as you understand how to avoid recursion like the example
above, you can edit the 'types =' line to include "device-mapper".
[The 16 or whatever after it is for historic reasons - nothing 
currently uses it.]

Alasdair
-- 
agk@redhat.com
