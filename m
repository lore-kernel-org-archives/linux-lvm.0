Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42FHKe3027861
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:17:20 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m42FHA3G010809
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:17:10 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m42FH5Pj010618
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:17:05 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m42FH5cC030952
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:17:05 -0400
Date: Fri, 2 May 2008 11:17:05 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <481B299E.7040509@redhat.com>
Message-ID: <Pine.LNX.4.44.0805021111170.30896-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2 May 2008, Bryn M. Reeves wrote:

> Am I missing something here? vgchange --partial seems like it will do
> what you want (man 8 lvm):

It does part of what I want.  It would at least allow a system to boot
from a partial VG containing the root fs.  It does not allow any
metadata changes while VG is partial - not even reducing missing PV.
If a PV is temporarily missing, and you using the pvcreate -u option,
then the original PV comes back as well, you have fireworks.
Also, it doesn't ensure partially missing LVs are readonly (including
where a snapshot is on a missing PV).

In any case, the --partial might be good for initrd.  Although a newbie
admin would be terribly confused by the "no metadatachanges" restriction.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
