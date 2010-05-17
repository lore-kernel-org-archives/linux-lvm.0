Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4HLUYoc031910
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 17:30:34 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4HLUOBY026323
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 17:30:24 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o4HLUNDx029202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 17:30:23 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o4HLUN04003084
	for <linux-lvm@redhat.com>; Mon, 17 May 2010 17:30:23 -0400
Date: Mon, 17 May 2010 17:30:23 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20100517211459.GA7269@us.ibm.com>
Message-ID: <Pine.LNX.4.64.1005171721260.2347@bmsred.bmsi.com>
References: <AANLkTina1csDn1EAcwXOYM41r7G3TOZBSAo1lVk0tU5N@mail.gmail.com>
	<20100517211459.GA7269@us.ibm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] shrink VG and PV
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

Captain Hindsight here with more advice!  :-)

On Mon, 17 May 2010, Malahal Naineni wrote:

> 	Q: /dev/md1: too many metadata areas for pvresize
> 
> 	That's meant to be saying you chose to place a second copy of
> 	the metadata at the end of the device and if you want to
> 	increase the size of the data area you have to shift that
> 	metadata first and there is no code that does that.

Having 1 metadata erase per PV generally provides sufficient redundancy
under the assumption that PVs are atomic - you lose an entire PV, or
you don't lose it at all.  A 2nd metadata area is only useful when trying
to recover data from a partially destroyed PV - and it is the only PV
in the VG.  

A better solution to that scenario is to regularly backup /etc/lvm (or whatever
dir your distro puts metadata backups in) to someplace outside the single PV
VG.  For instance, I favor keeping an /etc/lvm backup on /boot (which is of
necessity a non-LVM filesystem until grub has robust LVM support).  I've
thought about making /etc/lvm a symlink to /boot/lvm, but haven't studied the
idea for unintended consequences.

If you have regular system backups, then you can get a copy of /etc/lvm from
one of those, and won't need the 2nd metadata area.

Conclusion: always use only one metadata area per PV (but on multiple PVs
when available).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
