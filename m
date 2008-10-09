Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m99KC69q020935
	for <linux-lvm@redhat.com>; Thu, 9 Oct 2008 16:12:06 -0400
Received: from mailhost.auckland.ac.nz (larry.its.auckland.ac.nz
	[130.216.12.34])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m99KBB91031135
	for <linux-lvm@redhat.com>; Thu, 9 Oct 2008 16:11:11 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailhost.auckland.ac.nz (Postfix) with ESMTP id 0075D196B2
	for <linux-lvm@redhat.com>; Fri, 10 Oct 2008 09:11:06 +1300 (NZDT)
Received: from mailhost.auckland.ac.nz ([127.0.0.1])
	by localhost (larry.its.auckland.ac.nz [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id yEuNsi7S8eqt for <linux-lvm@redhat.com>;
	Fri, 10 Oct 2008 09:11:05 +1300 (NZDT)
Received: from esp104.esc.auckland.ac.nz (esp104.esc.auckland.ac.nz
	[130.216.209.104])
	by mailhost.auckland.ac.nz (Postfix) with ESMTP id DB02F1967B
	for <linux-lvm@redhat.com>; Fri, 10 Oct 2008 09:11:05 +1300 (NZDT)
Received: from localhost.localdomain (esp104 [127.0.0.1])
	by esp104.esc.auckland.ac.nz (Postfix) with ESMTP id 8DB031881F
	for <linux-lvm@redhat.com>; Fri, 10 Oct 2008 09:11:05 +1300 (NZDT)
Message-ID: <1350.128.187.136.18.1223583062.squirrel@mail.esc.auckland.ac.nz>
Date: Fri, 10 Oct 2008 09:11:02 +1300 (NZDT)
Subject: Re: [linux-lvm] Can't create LV in cluster
From: michael.osullivan@auckland.ac.nz
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi brassow,

I have the cluster up and running successfully. I have set up a clustered
volume group that is visible on both cluster nodes. cman, clvmd, rgmanager
is running on both nodes. However, something in the locking is keeping me
from creating a logical volume...

Thanks for any help you can give, Mike

> Date: Tue, 7 Oct 2008 15:28:59 -0500
> From: Jonathan Brassow <jbrassow redhat com>
> Subject: Re: [linux-lvm] Can't create LV in cluster
> To: LVM general discussion and development <linux-lvm redhat com>
> Message-ID: <59555D8D-3947-4EEC-A85D-2FEE0761398B redhat com>
> Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
>
> Do you have the clustering infrastructure set up?  cluster lvm relies
> on that.
>
>   brassow
>
> On Oct 2, 2008, at 1:57 PM, michael osullivan auckland ac nz wrote:
>
>> Hi everyone,
>>
>> I have created a 2-node cluster and (after a little difficulty)
>> created a
>> clustered volume group visible on both nodes. However, I can't
>> create a
>> logical volume on either node. I get the following error:
>>
>> Error locking on node <other node>: Error backing up metadata, can't
>> find
>> VG for group #global
>> Aborting. Failed to activate new LV to wipe the start of it.
>>
>> I have locking_type = 3 and locking_library = liblvm2clusterlock.so.
>> The
>> metadata areas and sequence nos are the same using vgdisplay on both
>> nodes.
>>
>> Can anyone help me create LVs? I am happy to provide any extra info
>> needed.
>>
>> Thanks, Mike
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm redhat com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
