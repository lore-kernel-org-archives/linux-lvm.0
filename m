Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAFAO7r18279
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 05:24:07 -0500
Received: from mail.o2w.nl (postfix@mail.o2w.nl [213.227.141.209])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAFAO10i001970
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 05:24:01 -0500
Date: Mon, 15 Nov 2004 11:24:00 +0100
From: Jelle Herold <wires@o2w.nl>
Subject: Re: [linux-lvm] recover lost VG (VG data differs between PVs)
Message-ID: <20041115102400.GA19918@hotwire.nl>
References: <20041114225853.GB20425@hotwire.nl>
	<20041114232126.GH24229@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041114232126.GH24229@agk.surrey.redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Alasdair,

On Sun, Nov 14, 2004 at 11:21:26PM +0000, Alasdair G Kergon wrote:
> >  VG data differs between PVs /dev/hde and /dev/hdf3
> >  Volume group "datavg" doesn't exist
>  
> So hde should be in the VG at the moment, but not hdf3?

precisely.

> Add a filter to lvm.conf so lvm only looks at hde.  Run vgscan and see
> check if things look OK eg vgcfgbackup and read the text backup file.
> If things *are* OK like that, then pvremove hdf3, remove the filter &
> vgscan.

Wow! *phew* that did the job! THANKS A LOT!!

Just a question out of curiosity, what does "VG data differs..." mean,
and why does filtering hdf3 help (I thought vgreduce removed that PV
from the VG)?

well, again, thanks a zillion
Jelle.
