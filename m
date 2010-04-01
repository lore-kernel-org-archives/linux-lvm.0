Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o31Dca6t029956
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2010 09:38:36 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o31DcPnm009738
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2010 09:38:25 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o31DcOAL009095
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2010 09:38:24 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o31DcO8b008400
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2010 09:38:24 -0400
Date: Thu, 1 Apr 2010 09:38:24 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4A2CF3C24E05B348A46BAF5A7C4593D406F87546@BTCMVEXC1-PRD.hq.netapp.com>
Message-ID: <Pine.LNX.4.64.1004010934360.8360@bmsred.bmsi.com>
References: <mailman.3140.1269024912.9812.linux-lvm@redhat.com>
	<4A2CF3C24E05B348A46BAF5A7C4593D406F87546@BTCMVEXC1-PRD.hq.netapp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can not use vgimportclone multiple times for the
 attached disk
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

On Thu, 1 Apr 2010, Sarkar, Kaushik wrote:

> After verifying I un-mounted logical volume and remove the volume group.
> Vgremove -f NEWVG 
> 
> But the new disk /dev/sdc2 still attached
> I tried to do vgimportclone again it fails
> # vgimportclone -n NEWVG /dev/sdc2
> Fatal: /dev/sdc2 is not a PV., error: 5

This should be expected since you just removed the volume group.

> I tried to remove the physical volume labeling then tried from the fresh
> but still no luck.
> #Pvremove -f /dev/sdc2
> # rescan-scsi-bus.sh
> # vgimportclone -n NEWVG /dev/sdc2
> Fatal: /dev/sdc2 is not a PV., error: 5

The PV was already removed - hence the "not a PV" error.

> What went wrong? What is the correct step to achieve it.

Nothing went wrong.  What are you trying to do?  

If you want to create a new VG from scratch, then start with
pvcreate /dev/sdc2, then do vgcreate -n NEWVG /dev/sdc2.

If you wanted your old VG back, you've got problems - since you just
deleted it.  If you have a metadata backup, you can install it with
pvcreate.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
