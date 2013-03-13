Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2DIV5UY019388
	for <linux-lvm@redhat.com>; Wed, 13 Mar 2013 14:31:05 -0400
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2DIV23R020187
	for <linux-lvm@redhat.com>; Wed, 13 Mar 2013 14:31:03 -0400
Message-ID: <5140C5E2.8050203@hoster-ok.com>
Date: Wed, 13 Mar 2013 21:30:58 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
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
In-Reply-To: <5140B968.4030800@pse-consulting.de>
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
Content-Type: text/plain; charset="us-ascii"
To: Andreas Pflug <pgadmin@pse-consulting.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

13.03.2013 20:37, Andreas Pflug wrote:
> Am 13.03.13 17:53, schrieb Vladislav Bogdanov:
>>
>> #metadata/lv_manip.c:4137     Clearing start of logical volume "testvol2"
>> #device/dev-cache.c:599       /dev/san2/testvol2: stat failed: No such
>> file or directory
>> #metadata/lv_manip.c:4140   /dev/san2/testvol2: not found: device not
>> cleared
>> #metadata/lv_manip.c:4620   Aborting. Failed to wipe start of new LV.
>> Yep, I know about this, I reworked that patch a lot, and now it does
>> every thing I wanted without regressions.
>> I will try to post updated version in the next few days when I manage to
>> apply it to a git tree.
> 
> Is there a way to find out if a LV is locked exclusively? lvs displaying
> -e-- instead of -a-- would be nice. Seems not even lvdisplay knows about
> exclusive locking.

That would break other tools which rely on their output. F.e. cluster
resource agents of libvirt (yes, it runs lvm tools rather then using
API, which is not yet complete btw). As I also need to obtain this
information, I think about writing simple tool (f.e. clvm_tool) which
would display needed info.

As a workaround you can run lvchange -aly without force parameter. If it
succeeds, the volume is locked in a shared mode, otherwise it is locked
exclusively.

> 
> Regards,
> Andreas
