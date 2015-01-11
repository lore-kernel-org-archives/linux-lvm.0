Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0BDCdcr006274
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 08:12:39 -0500
Received: from nm2-vm9.access.bullet.mail.bf1.yahoo.com
	(nm2-vm9.access.bullet.mail.bf1.yahoo.com [216.109.114.82])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0BDCc6X030591
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 08:12:39 -0500
Message-ID: <1420981957.78693.YahooMailBasic@web181502.mail.ne1.yahoo.com>
Date: Sun, 11 Jan 2015 05:12:37 -0800
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <2368A3FCF9F7214298E53C823B0A48EC042ED0A3@AMSPEX01CL02.citrite.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] deleted LV recovery: understanding metadata format
	and determining LV extents
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

you're right. the PV,XXXX is to enumerate where the extents start and would be more interesting if you had multiple PV in the VG and interleaved the LV across them or otherwise had multiple disjoint elements for a LV that had been grown over time.

Interesting that LVM leaves a an extent at the front unused. I wonder why. metadata and such I thought was stored outside the extent area.
