Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6AE12010CC7
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2018 11:33:33 +0000 (UTC)
Received: from egamorf.bogon.ca (egamorf.bogon.ca [149.56.143.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA5F53DE3D
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2018 11:33:21 +0000 (UTC)
Received: from atlas.bogon.ca ([2001:470:b358:0:2c9d:79ff:fe07:eeb0])
	by egamorf.bogon.ca with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <doug@bogon.ca>) id 1fg7BQ-000759-IG
	for linux-lvm@redhat.com; Thu, 19 Jul 2018 11:33:20 +0000
Received: from doug by atlas.bogon.ca with local (Exim 4.90_1)
	(envelope-from <doug@bogon.ca>) id 1fg7BP-0004Nd-1Y
	for linux-lvm@redhat.com; Thu, 19 Jul 2018 07:33:19 -0400
Date: Thu, 19 Jul 2018 07:33:18 -0400
From: Douglas Paul <doug@bogon.ca>
Message-ID: <20180719113318.GG12563@bogon.ca>
References: <3ec4e4af-8109-ca19-2a57-8e8cf6d67737@gmail.com>
	<20180718141506.GD12563@bogon.ca>
	<80dbc3e4-3f7e-ba5d-7f0b-00b809098538@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80dbc3e4-3f7e-ba5d-7f0b-00b809098538@gmail.com>
Subject: Re: [linux-lvm] Got only half the space of RAID10 LV with 4 PVs
 (similar to RAID1 cause LV shows it has 4 'Mirrored volumes')
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

[ Reposting to list for completeness --- the servers seem sick and are
delaying posts by up to 16h ! ]

On Wed, Jul 18, 2018 at 10:41:14PM +0800, runappz wrote:
> Thank you for clarifying it sir. Then� for `-l 8` I expect all 
> `lvolX_rimage_N`s has 4 extents rather than 8:
> 
>  ����� --- Segments ---
>  ����� Logical extents 0 to 7:
>  ������� Type������� raid10
>  ������� Monitoring������� monitored
>  ������� Raid Data LV 0
>  ��������� Logical volume��� lvol5_rimage_0
>  ��������� Logical extents��� 0 to 7
>  ������� Raid Data LV 1
>  ��������� Logical volume��� lvol5_rimage_1
>  ��������� Logical extents��� 0 to 7
>  ����� ...

I believe that those are the logical extents that are involved in those
stripes. All of the logical extents will store some data in each of the
slices.

Try "lvs -a" to see the actual space on disk used by each of the segments.

-- 
Douglas Paul
