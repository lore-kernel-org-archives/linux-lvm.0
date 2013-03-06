Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r269xmPL030807
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 04:59:48 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.9])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r269xhfl028766
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 04:59:46 -0500
Message-ID: <5137137B.5010800@pse-consulting.de>
Date: Wed, 06 Mar 2013 10:59:23 +0100
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
References: <513090CA.8050904@pse-consulting.de>
	<aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
	<5136F2F1.3020202@pse-consulting.de>
	<5136F738.1010707@hoster-ok.com>
	<5137091A.4070300@pse-consulting.de>
	<51370DDB.5010002@hoster-ok.com>
In-Reply-To: <51370DDB.5010002@hoster-ok.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG
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
To: Vladislav Bogdanov <bubble@hoster-ok.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Am 06.03.13 10:35, schrieb Vladislav Bogdanov:
> 06.03.2013 12:15, Andreas Pflug wrote:
>> I made sure it's not active on other nodes: lvchange -an vg/locktest ;
>> lvchange -aly vg/locktest
>>> And do you run clvmd from that build tree as well?
>>>
>>> Also, can you please try attached patch (on top of that one you have)? I
>>> polished conversion a bit more, denying -an if volume is ex-locked
>>> somewhere and other fixes to logic.
>> I tried that additional patch. I'm running this test versions on my test
>> node only (including clvmd), the other nodes are still running clvmd
>> 2.2.95 (I guess this shouldn't matter since all are inactive). Same result:
> I believe this matters, because error you see is received from a remote
> node. Is node with ID 7400a8c0 local?
Yes, that's the test node.
Hm, not funny if I have to upgrade all nodes on the production system... 
I'm a little surprised that remote inactive nodes need to be aware of 
that force-exclusive stuff.
>
> I'm running corosync 1.4.2 (debian wheezy).
> Which cluster manager interface does clvmd detect? corosync or openais?
> You should use former, openais one is(was) using LCK service which is
> very unstable.
It's using openais. I'm not too happy about the stability, so maybe I'd 
switch to corosync now.
Could this be a reason for the x-lock failure as well?


Regards,
Andreas
