Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2C6qqBg024125
	for <linux-lvm@redhat.com>; Tue, 12 Mar 2013 02:52:52 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.10])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2C6qoti023576
	for <linux-lvm@redhat.com>; Tue, 12 Mar 2013 02:52:51 -0400
Message-ID: <513ED0BB.2000804@pse-consulting.de>
Date: Tue, 12 Mar 2013 07:52:43 +0100
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
References: <513090CA.8050904@pse-consulting.de>
	<aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
	<5136F2F1.3020202@pse-consulting.de>
	<5136F738.1010707@hoster-ok.com>
	<5137091A.4070300@pse-consulting.de>
	<51370DDB.5010002@hoster-ok.com>
	<5137137B.5010800@pse-consulting.de>
	<5137267A.7040000@hoster-ok.com>
	<513733C0.2020207@pse-consulting.de>
	<5137447B.7030906@hoster-ok.com>
In-Reply-To: <5137447B.7030906@hoster-ok.com>
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

Am 06.03.13 14:28, schrieb Vladislav Bogdanov:
> 06.03.2013 15:17, Andreas Pflug wrote:
>> Am 06.03.13 12:20, schrieb Vladislav Bogdanov:
>>>>> I'm running corosync 1.4.2 (debian wheezy).
>>>>> Which cluster manager interface does clvmd detect? corosync or openais?
>>>>> You should use former, openais one is(was) using LCK service which is
>>>>> very unstable.
>>>> It's using openais. I'm not too happy about the stability, so maybe I'd
>>>> switch to corosync now.
>>> That could be the problem btw. I did neither test nor look at openais
>>> module implementation in clvmd, because I had plenty problems with it
>>> (actually with LCK under it) in the past, so I even forced to use
>>> corosync (CPG) + dlm instead of detected openais (CPG+LCK) for older
>>> systems (look at -I switch of clvmd).
>>>
>>> And, openais is deprecated upstream, so I do not see any reason to use
>>> it. Even gfs_controld (which is probably the only well-known user of
>>> openais services) actually does not strictly require it, at least I was
>>> able to port it to pure CPG+DLM with dlm4 on top of corosync2, which is
>>> not compatible with openais plugins.
>>>
>>> Also you may need quorum patch found in this list, it does its job well.
>>>
>>>> Could this be a reason for the x-lock failure as well?
>> You just answered the quirky question :-)
>>
>> Unfortunately, corosync/dlm don't work for me as expected. When starting
>> clvmd -I corosync (with dlm kernel module loaded), creating the dlm
>> lockspace "clvmd" fails, with
>>
>> dlm: no local IP address has been set
>> dlm: cannot start dlm lowcomms -107
>>
> You need to have dlm_controld running on all nodes.
> And that is not trivial with corosync1. You need to either use cman or
> use deprecated dlm_controld.pcmk which was removed from a cluster (cman)
> package after 3.0.17. Latter does not work well without heavy patching
> (http://www.mail-archive.com/pacemaker@oss.clusterlabs.org/msg09959.html
> ,
> http://www.mail-archive.com/pacemaker@oss.clusterlabs.org/msg11123.html
> and
> http://oss.clusterlabs.org/pipermail/pacemaker/2012-February/013073.html).
> Even after that there are some problems with it.
>
> Latest versions (4.x) of dlm (it was split from cman) work fine with
> corosync2 and pacemaker 1.1.6+. But I doubt it can ever be compiled with
> corosync1. Yes, it cannot, because it requires quorum which appeared in
> corosync2.
>
> You may look at thread
> http://oss.clusterlabs.org/pipermail/pacemaker/2012-October/015826.html
> for some info.
>
> That's all why I moved to corosync2. You can search through pacemaker
> list archives for dlm-related messages from me to get full picture.
>
> You may also look at slides I presented at LVEE winter 2013:
> http://lvee.org/uploads/image_upload/file/267/Linux_Clusters_at_LVEE_2013.pdf

Thanks for the pointers, seems there's no way around reorganizing all 
clustering stuff.

Regards,
Andreas
