Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pAF7wNpV030147
	for <linux-lvm@redhat.com>; Tue, 15 Nov 2011 02:58:23 -0500
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAF7wLWO015404
	for <linux-lvm@redhat.com>; Tue, 15 Nov 2011 02:58:22 -0500
Received: from bubble-sam.sam-solutions.net (r01-ge0-SH.prague.vds-ok.com
	[88.86.98.3] (may be forged)) (authenticated as <bubble>)
	by h01.hoster-ok.com (8.14.3/8.14.3/HOSTER-OK) with ESMTP id
	pAF7wI9m000804
	(using TLSv1/SSLv3 with cipher DHE-RSA-AES256-SHA (256 bits) verified
	NO) for <linux-lvm@redhat.com>; Tue, 15 Nov 2011 08:58:19 +0100
Message-ID: <4EC21B9A.4080702@hoster-ok.com>
Date: Tue, 15 Nov 2011 10:58:18 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <3D44B3DCE57399449CC1391C2AD6EC4C16EA8D76@ORSMSX101.amr.corp.intel.com>
	<4EBB93F0.8070901@hoster-ok.com>
	<3D44B3DCE57399449CC1391C2AD6EC4C16EB33A8@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <3D44B3DCE57399449CC1391C2AD6EC4C16EB33A8@ORSMSX101.amr.corp.intel.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

10.11.2011 19:16, Riches Jr, Robert M wrote:
> Thank you, Vladislav, for the suggestion.  That could potentially
> help in cases where the nodes are CPU-bound, likely independent of
> whether they are I/O-bound.

Except filtering unneeded block devices. This greatly helps in IO-bound
setups.

> 
> Thanks,
> 
> Robert Riches
> 
> -----Original Message----- From: linux-lvm-bounces@redhat.com
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Vladislav
> Bogdanov Sent: Thursday, November 10, 2011 1:06 AM To:
> linux-lvm@redhat.com Subject: Re: [linux-lvm] cLVM commands often
> taking a long time to execute
> 
> 09.11.2011 03:06, Riches Jr, Robert M wrote:
>> I'm running into some odd behavior from clustered LVM commands on a
>>  3-node pacemaker-based cluster.  When other processes on the nodes
>> are doing somewhat heavy sequential I/O traffic, LVM commands such
>> as lvs, pvs, vgs, lvdisplay, pvdisplay, and vgdisplay have widely
>> variable, often very long execution times.  The same LVM command
>> done repetitively will have execution times varying from less than
>> a second to 10-15 seconds, more rarely up to around 60 seconds.
>> Other read-heavy commands such as find, wc, and sum have much less
>>  variability and much shorter tails in the distribution of their
>> execution times.
>> 
>> Is it known what causes the cLVM commands to be so slow at times?
>> 
>> Perchance, are there known ways to get cLVM commands to be less
>> slow?
> 
> I use chrt -r 99 for them. And I also run clvmd the same way. But
> this is much more about CPU load then IO load. Also, please make sure
> that you correctly filter unneeded block devices from being
> PV-suspects (filter clause in lvm.conf).
> 
> Best, Vladislav
> 
> _______________________________________________ linux-lvm mailing
> list linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm read the LVM HOW-TO
> at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________ linux-lvm mailing
> list linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm read the LVM HOW-TO
> at http://tldp.org/HOWTO/LVM-HOWTO/
