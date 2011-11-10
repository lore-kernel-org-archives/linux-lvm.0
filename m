Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pAAGGWS0006088
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2011 11:16:32 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAAGGVZG012418
	for <linux-lvm@redhat.com>; Thu, 10 Nov 2011 11:16:31 -0500
From: "Riches Jr, Robert M" <robert.m.riches.jr@intel.com>
Date: Thu, 10 Nov 2011 16:16:29 +0000
Message-ID: <3D44B3DCE57399449CC1391C2AD6EC4C16EB33A8@ORSMSX101.amr.corp.intel.com>
References: <3D44B3DCE57399449CC1391C2AD6EC4C16EA8D76@ORSMSX101.amr.corp.intel.com>
	<4EBB93F0.8070901@hoster-ok.com>
In-Reply-To: <4EBB93F0.8070901@hoster-ok.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] cLVM commands often taking a long time to execute
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thank you, Vladislav, for the suggestion.  That could potentially help in cases where the nodes are CPU-bound, likely independent of whether they are I/O-bound.

Thanks,

Robert Riches

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Vladislav Bogdanov
Sent: Thursday, November 10, 2011 1:06 AM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] cLVM commands often taking a long time to execute

09.11.2011 03:06, Riches Jr, Robert M wrote:
> I'm running into some odd behavior from clustered LVM commands on a 
> 3-node pacemaker-based cluster.  When other processes on the nodes are 
> doing somewhat heavy sequential I/O traffic, LVM commands such as lvs, 
> pvs, vgs, lvdisplay, pvdisplay, and vgdisplay have widely variable, 
> often very long execution times.  The same LVM command done 
> repetitively will have execution times varying from less than a second 
> to 10-15 seconds, more rarely up to around 60 seconds.  Other 
> read-heavy commands such as find, wc, and sum have much less 
> variability and much shorter tails in the distribution of their execution times.
> 
> Is it known what causes the cLVM commands to be so slow at times?
> 
> Perchance, are there known ways to get cLVM commands to be less slow?

I use chrt -r 99 for them. And I also run clvmd the same way. But this is much more about CPU load then IO load.
Also, please make sure that you correctly filter unneeded block devices from being PV-suspects (filter clause in lvm.conf).

Best,
Vladislav

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
