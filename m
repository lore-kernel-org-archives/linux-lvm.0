Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5JGN7023916
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 12:23:07 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.185])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5JGN5e1020057
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 12:23:06 -0400
Received: from [212.227.126.161] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1BbicT-0007Dv-00
	for linux-lvm@redhat.com; Sat, 19 Jun 2004 18:23:05 +0200
Received: from [217.230.161.203] (helo=pd9e6a1cb.dip0.t-ipconnect.de)
	by mrelayng.kundenserver.de with asmtp (TLSv1:RC4-MD5:128)
	(Exim 3.35 #1) id 1BbicS-0007Uv-00
	for linux-lvm@redhat.com; Sat, 19 Jun 2004 18:23:05 +0200
From: Hauke Laging <mailinglisten@hauke-laging.de>
Subject: Re: [linux-lvm] vgcfgbackup: backup of several VGs into one file fails
Date: Sat, 19 Jun 2004 18:23:00 +0200
References: <200406191345.32913.mailinglisten@hauke-laging.de>
	<20040619160327.GC6302@agk.surrey.redhat.com>
In-Reply-To: <20040619160327.GC6302@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200406191823.00730.mailinglisten@hauke-laging.de>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Am Samstag, 19. Juni 2004 18:03 schrieb Alasdair G Kergon:

> LVM2 text metadata files can only only hold a single VG at the moment.
> vgcfgbackup should enforce that, but doesn't - I'll fix it.

And the man page should be fixed, too:

[VolumeGroupName...] -> [VolumeGroupName]


Hauke
