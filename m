Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7QLdDsu002826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 17:39:13 -0400
Received: from nexus.subspacefield.org (nexus.subspacefield.org
	[64.156.192.208])
	(using TLSv1 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9819E81229
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 21:39:12 +0000 (UTC)
Date: Fri, 26 Aug 2016 14:30:55 -0700
From: travis+ml-linux-lvm@subspacefield.org
Message-ID: <20160826213055.GT1534@subspacefield.org>
References: <20160826042022.GS1534@subspacefield.org>
	<20160826104629.GA11968@hex>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160826104629.GA11968@hex>
Subject: Re: [linux-lvm] automatic repartitioning of devices in
 /etc/lvm/cache/.cache?
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
Cc: linux-lvm-request@redhat.com

On Fri, Aug 26, 2016 at 11:46:30AM +0100, Bryn M. Reeves wrote:
> Use audit, systemap, or even blktrace to constantly monitor the devices and
> report when something is writing to the MBR area.

Thanks!

> There have been several common proprietary applications that have been found
> to at times cause this type of problem (proprietary RDBMS, volume and cluster
> managers in particular).
> 
> Otherwise you can search through the mailing list archives - there have
> been a few threads discussing similar problems.
> 
> > Is there any way that being listed there could be a side effect, or be
> > a cause, of disk partition corruption in those devices?
> 
> Only if some external (non-lvm2) component were reading that file and
> acting on the contents. Nothing in lvm2 itself even knows how to write
> a GPT partition table.

Good to know.  Is it possible that whatever restored a GPT (bizarrely,
to the partition not the disk) also restored an LVM header and that
the device ended up in the LVM cache via some automatic periodic
process, or a boot-time process?

Second question: What is that cache for, exactly?
-- 
http://www.subspacefield.org/~travis/ | if spammer then john@subspacefield.org
"Computer crime, the glamor crime of the 1970s, will become in the
1980s one of the greatest sources of preventable business loss."
John M. Carroll, "Computer Security", first edition cover flap, 1977
