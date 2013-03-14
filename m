Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2ELvnDU008118
	for <linux-lvm@redhat.com>; Thu, 14 Mar 2013 17:57:49 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.10])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2ELvlf2031164
	for <linux-lvm@redhat.com>; Thu, 14 Mar 2013 17:57:48 -0400
Message-ID: <514247D5.8000605@pse-consulting.de>
Date: Thu, 14 Mar 2013 22:57:41 +0100
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
	<514097C8.4030602@pse-consulting.de>
	<5140AF20.7060406@hoster-ok.com>
	<5140B968.4030800@pse-consulting.de>
	<5140C5E2.8050203@hoster-ok.com>
In-Reply-To: <5140C5E2.8050203@hoster-ok.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG [SOLVED]
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

On 03/13/13 19:30, Vladislav Bogdanov wrote:
>
>> Is there a way to find out if a LV is locked exclusively? lvs displaying
>> -e-- instead of -a-- would be nice. Seems not even lvdisplay knows about
>> exclusive locking.
> That would break other tools which rely on their output. F.e. cluster
> resource agents of libvirt (yes, it runs lvm tools rather then using
> API, which is not yet complete btw). As I also need to obtain this
> information, I think about writing simple tool (f.e. clvm_tool) which
> would display needed info.
>
> As a workaround you can run lvchange -aly without force parameter. If it
> succeeds, the volume is locked in a shared mode, otherwise it is locked
> exclusively.

Hm, thats one ugly workaround...
How about a clvmd option, something like -l to list all locks and exit.

Regards,
Andreas
