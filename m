Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4D8btwU032683
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 04:37:55 -0400
Received: from mail.lauwerscollege.nl (a80-127-173-76.adsl.xs4all.nl
	[80.127.173.76])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4D8brIZ014072
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 04:37:53 -0400
Received: from [192.168.1.100] (f14030.upc-f.chello.nl [80.56.14.30])
	(authenticated bits=0)
	by mail.lauwerscollege.nl (8.13.8/8.13.8) with ESMTP id l4D8algp004790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 10:36:48 +0200
Message-ID: <4646CDB6.9030006@lauwerscollege.nl>
Date: Sun, 13 May 2007 10:35:02 +0200
From: Jan Kuipers <jrkuipers@lauwerscollege.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Fixing up missing format1 size
References: <464635EE.4020001@lauwerscollege.nl>
In-Reply-To: <464635EE.4020001@lauwerscollege.nl>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Jan Kuipers schreef:
> Hello,
>
> When I execute vgscan  -v, the output contains this message:
>
> Fixing up missing format1 size (19,53 GB) for PV /dev/cciss/c0d0p2
>
> I something wrong with the PV? Can it be fixed?
>
> FYI: the PV contains the root filesystem of Dom0 of a xen server. The 
> server works fine.
>
> Found nothing sofar on this issue.
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
I "solved" this by creating (and deleting afterwards) a small LV in the 
VG to which the regarding PV is coupled. The notice stays away now.

-- 
Jan Kuipers
Systeembeheer Lauwers College
