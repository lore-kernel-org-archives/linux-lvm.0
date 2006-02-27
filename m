Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1RBrn132057
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 06:53:49 -0500
Received: from mta07-winn.ispmail.ntl.com (mta07-winn.ispmail.ntl.com
	[81.103.221.47])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1RBrkkQ007968
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 06:53:47 -0500
Received: from aamta10-winn.ispmail.ntl.com ([81.103.221.35])
	by mta07-winn.ispmail.ntl.com with ESMTP id
	<20060227115341.KYCZ15056.mta07-winn.ispmail.ntl.com@aamta10-winn.ispmail.ntl.com>
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 11:53:41 +0000
Received: from [192.168.11.10] (really [62.253.210.226])
	by aamta10-winn.ispmail.ntl.com with ESMTP id
	<20060227115341.SDIG22495.aamta10-winn.ispmail.ntl.com@[192.168.11.10]>
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 11:53:41 +0000
Message-ID: <4402E842.9070509@watford53.freeserve.co.uk>
Date: Mon, 27 Feb 2006 11:53:38 +0000
From: Jim Ford <jaford@watford53.freeserve.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Disk size reporting.
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
To: linux-lvm@redhat.com

I think I've extended a logical volume correctly, but DF shows no change.

lvs output:
  LV     VG     Attr   LSize   Origin Snap%  Move Copy%
  root   Ubuntu -wi-ao  25.13G
  swap_1 Ubuntu -wi-ao 656.00M

df output:
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/Ubuntu-root
                      18715076   2909852  14854544  17% /
tmpfs                   112264         0    112264   0% /dev/shm
tmpfs                   112264     12588     99676  12% 
/lib/modules/2.6.12-10-386/volatile
/dev/hda1               233335     19166    201721   9% /boot

Have I extended my Ubuntu volume correctly, please?

<sigh> Life was _so_ much simpler without lvm and udev! </sigh>

Jim Ford
