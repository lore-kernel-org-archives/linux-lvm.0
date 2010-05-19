Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGkovH024407
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:46:50 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JGkejf025750
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:46:41 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o4JGkXdW028999
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:46:40 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o4JGkVTA028212
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:46:31 -0400
Date: Wed, 19 May 2010 12:46:31 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <059801caf769$fc848350$f58d89f0$@com>
Message-ID: <Pine.LNX.4.64.1005191236180.28122@bmsred.bmsi.com>
References: <059801caf769$fc848350$f58d89f0$@com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 19 May 2010, kevin wrote:

> a disk to logical volumes? I want to ensure that the existing data on the
> logical volume isn't compromised and have never done this before.
> 
> If theres something I should be aware of or if my process is incorrect,
> please let me know. Any help is extremely appreciated J 

While others have given you the procedure, I'll be the killjoy and point
out that the reliability of the VG as a whole goes down with additional
drives - unless you incorporate some kind of RAID.  For instance, if the
uptime ratio of a single drive is .99999 (5 sigmas), the uptime
of the system with two such drives is .99998.  

This is not so bad with just 2 drives (even 2 sigmas gives you .99^2 == .98),
but is something to keep in mind before adding the 3rd.   I prefer software
RAID1, it provides a lot of flexibility including "cloning" a drive by simply
removing it and is simple.  Other configurations will provide better
performance.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
