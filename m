Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA5CE7C014
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 14:29:21 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38DB87F7DA
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 14:29:15 +0000 (UTC)
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
References: <ccfceced-9471-ebff-d2ed-1669b82013ad@strike.wu.ac.at>
Message-ID: <6c5cd2a4-1d47-98f5-d108-06ea567e03d5@strike.wu.ac.at>
Date: Mon, 23 Oct 2017 16:29:12 +0200
MIME-Version: 1.0
In-Reply-To: <ccfceced-9471-ebff-d2ed-1669b82013ad@strike.wu.ac.at>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unable to remove snapshot of raid1 leg
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 10/23/2017 04:19 PM, Alexander 'Leo' Bergolth wrote:
> One experiment was to create a snapshot of one leg of the mirror and try
> to mount the snapshot. This worked fine but unfortunately I cannot
> remove the snapshot now!
> 
> lvm wants to remove the origin too:
> -------------------- 8< --------------------
> # lvremove vg_test/snap_leg_0
> Do you really want to remove active origin logical volume vg_test/testlv_rimage_0 with 1 snapshot(s)? [y/n]: n
>   Logical volume vg_test/testlv_rimage_0 not removed.
> -------------------- 8< --------------------
> (I have added the full history of a test setup below.)

The output of lvremove -vvv is available at:

http://leo.kloburg.at/tmp/lvm-remove-raid1-leg-snapshot/lvremove-vvv.txt

I am using lvm2-2.02.171-8.el7.x86_64.

--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
