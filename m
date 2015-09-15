Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8FN3P0L012868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 19:03:25 -0400
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mx1.redhat.com (Postfix) with ESMTPS id EDE43C0B919E
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 23:03:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8FN3OQc008200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 16:03:24 -0700 (PDT)
Message-ID: <55F8A3BB.2020408@windriver.com>
Date: Tue, 15 Sep 2015 17:03:23 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <55F70C58.5010205@windriver.com>
In-Reply-To: <55F70C58.5010205@windriver.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Any way to speed up activation of volumes with
	snapshots?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 09/14/2015 12:05 PM, Chris Friesen wrote:
> Hi,
>
> I'm running a 3.10 kernel with LVM 2.02.95.
>
> I'm running into a problem where activating snapshots can take quite a long
> time, roughly one minute per 25GB of delta between the snapshot and the origin
> volume.  (See below for my test procedure.)

As a side question, currently we have a script which runs "vgchange -ay <vg>", 
which will activate the VG.

This script appears to activate the LVs within the VG serially rather than in 
parallel.  Does it do any processing to determine in which order to activate the 
LVs?

The reason I ask is that we have an overall timeout on the activate phase, after 
which we'll put any un-activated LVs into an error state.  It would be a shame 
to try to activate a snapshotted LV first, and then timeout without activating 
any of the non-snapshotted LVs.

Chris
