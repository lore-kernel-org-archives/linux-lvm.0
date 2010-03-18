Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2IFWKC4025064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2010 11:32:21 -0400
Date: Thu, 18 Mar 2010 11:32:20 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20100318153220.GA4418@redhat.com>
References: <4A2CF3C24E05B348A46BAF5A7C4593D406F874F1@BTCMVEXC1-PRD.hq.netapp.com>
	<20100318161544.5aa9eb30.andreas.olsowski@uni.leuphana.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20100318161544.5aa9eb30.andreas.olsowski@uni.leuphana.de>
Subject: Re: [linux-lvm] how to change the volume group name of the attached
	backup
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

On Thu, Mar 18 2010 at 11:15am -0400,
Andreas Olsowski <andreas.olsowski@uni.leuphana.de> wrote:

> > But I cant mount /dev/sdb as it is on LVM. As both are having same VG
> > NAME I can't even mount logical volume.
> try:
> vgextend NAME /dev/sdb

No, please don't.  This advice is incorrect.  vgimportclone is the only
supported lvm tool to make a cloned LUN distinct.
