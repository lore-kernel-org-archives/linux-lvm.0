Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r26BKXcm012989
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 06:20:33 -0500
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r26BKUDN002058
	for <linux-lvm@redhat.com>; Wed, 6 Mar 2013 06:20:31 -0500
Message-ID: <5137267A.7040000@hoster-ok.com>
Date: Wed, 06 Mar 2013 14:20:26 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <513090CA.8050904@pse-consulting.de>
	<aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
	<5136F2F1.3020202@pse-consulting.de>
	<5136F738.1010707@hoster-ok.com>
	<5137091A.4070300@pse-consulting.de>
	<51370DDB.5010002@hoster-ok.com>
	<5137137B.5010800@pse-consulting.de>
In-Reply-To: <5137137B.5010800@pse-consulting.de>
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
Content-Type: text/plain; charset="us-ascii"
To: Andreas Pflug <pgadmin@pse-consulting.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

06.03.2013 12:59, Andreas Pflug wrote:
> Am 06.03.13 10:35, schrieb Vladislav Bogdanov:
>> 06.03.2013 12:15, Andreas Pflug wrote:
>>> I made sure it's not active on other nodes: lvchange -an vg/locktest ;
>>> lvchange -aly vg/locktest
>>>> And do you run clvmd from that build tree as well?
>>>>
>>>> Also, can you please try attached patch (on top of that one you
>>>> have)? I
>>>> polished conversion a bit more, denying -an if volume is ex-locked
>>>> somewhere and other fixes to logic.
>>> I tried that additional patch. I'm running this test versions on my test
>>> node only (including clvmd), the other nodes are still running clvmd
>>> 2.2.95 (I guess this shouldn't matter since all are inactive). Same
>>> result:
>> I believe this matters, because error you see is received from a remote
>> node. Is node with ID 7400a8c0 local?
> Yes, that's the test node.

But you receive "Invalid argument" error from the cluster layer, so is
should go from a local clvmd if you are correct about node IDs. You may
run clvmd in a debugging mode as well to catch what goes wrong.

> Hm, not funny if I have to upgrade all nodes on the production system...
> I'm a little surprised that remote inactive nodes need to be aware of
> that force-exclusive stuff.

You probably should try to test that on a test cluster first (as I do)
although I'm almost sure it works correctly in setup I described.

>>
>> I'm running corosync 1.4.2 (debian wheezy).
>> Which cluster manager interface does clvmd detect? corosync or openais?
>> You should use former, openais one is(was) using LCK service which is
>> very unstable.
> It's using openais. I'm not too happy about the stability, so maybe I'd
> switch to corosync now.

That could be the problem btw. I did neither test nor look at openais
module implementation in clvmd, because I had plenty problems with it
(actually with LCK under it) in the past, so I even forced to use
corosync (CPG) + dlm instead of detected openais (CPG+LCK) for older
systems (look at -I switch of clvmd).

And, openais is deprecated upstream, so I do not see any reason to use
it. Even gfs_controld (which is probably the only well-known user of
openais services) actually does not strictly require it, at least I was
able to port it to pure CPG+DLM with dlm4 on top of corosync2, which is
not compatible with openais plugins.

Also you may need quorum patch found in this list, it does its job well.

> Could this be a reason for the x-lock failure as well?

Can you please reword?

Vladislav
