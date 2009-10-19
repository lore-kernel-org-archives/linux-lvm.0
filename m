Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9JHJO1a032372
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 13:19:24 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9JHJECf011413
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 13:19:14 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n9JHJDGR027055
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 13:19:13 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n9JHJC3r015503
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 13:19:13 -0400
Date: Mon, 19 Oct 2009 13:19:12 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Same file system after drive restore. Why?
In-Reply-To: <a5a956f70910190921i65a10986qd6e560c22cfa5878@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0910191316100.15449@bmsred.bmsi.com>
References: <a5a956f70910190921i65a10986qd6e560c22cfa5878@mail.gmail.com>
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

On Mon, 19 Oct 2009, Lou Arnold wrote:

> I am confused as to where LVM data is stored. Restoring  a disk image
> doesn't seem to restore the original LVM set-up.

A backup of LVM metadata is stored in /etc/lvm (or where configured).
Metadata is also stored on PVs.  Your second drive was probably
a second VG (your details are rather vague), hence there was no PV
to override the lvm backup.

> Even during the kernel start-up, I saw notices of VolGroup00 problems -
> something about reverting to "version 5", although the notices went by too
> fast to record. I should just have seen the original configuration. I'm
> stumped.

There was a version conflict between the /etc/lvm backup and the PV version
of VolGroup00, and it reverted to the PV version.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
