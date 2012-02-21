Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1L9YM5W024321
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 04:34:22 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1L9YKYq018145
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 04:34:21 -0500
Received: by eaah12 with SMTP id h12so2502459eaa.33
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 01:34:20 -0800 (PST)
Message-ID: <4F43651A.1000505@profitbricks.com>
Date: Tue, 21 Feb 2012 10:34:18 +0100
From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
MIME-Version: 1.0
References: <4F3D098F.4010709@profitbricks.com>
	<20120220215911.GJ6331@barkeeper1-xen.linbit>
In-Reply-To: <20120220215911.GJ6331@barkeeper1-xen.linbit>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Allocation Policy for Cloud Computing needed
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 20/02/12 22:59, Lars Ellenberg wrote:
>> Or does someone want to implement this together with me?
> 
> I would certainly be here for discussions.
> 
> Though, as you always will be more flexible with scripts than with
> pre-implemented fixed algorithms, I probably would first check if I can
> solve it with some scripting.
> [completely untested, but you get the idea]
> 
> #!/bin/bash
> export LANG=C LC_ALL=C
> name=$1 vg=$2 size_in_MiB=$3
> PVS=$(vgs --nohead --unit m -o pv_name,pv_free -O -pv_free,pv_name $vg |
> 	awk -v need=$size_in_MiB '{ print $1; sum += $2;
> 	if (sum >= need) exit; }')
> lvcreate -n $name -L ${size_in_MiB}m $vg $PVS
> 
> (similar for lvextend)
> 
> Which basically implements this allocation policy:
> use the pvs with most free space available,
> and no more than necessary.
> 
> If I understand you correctly, that would almost do what you asked for.

Yes, this really helps. I've also thought about allocating the LVs
directly to distinct PVs. Thanks for the confirmation.

> You can get pretty complex in similar scripts, if you really want to...
> consider using
>   pvs -o vg_name,lv_name,pv_name,pvseg_start,pvseg_size,seg_pe_ranges
> and explicitly listing not only the PVS, but even the PE ranges to your
> lvcreate commands...

Thank you very much for your response.

Regards,
Sebastian
