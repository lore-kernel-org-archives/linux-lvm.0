Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l18KbQY2009101
	for <linux-lvm@redhat.com>; Thu, 8 Feb 2007 15:37:26 -0500
Received: from smtp8-g19.free.fr (smtp8-g19.free.fr [212.27.42.65])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l18KbLd3028877
	for <linux-lvm@redhat.com>; Thu, 8 Feb 2007 15:37:21 -0500
Received: from [192.168.0.1] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp8-g19.free.fr (Postfix) with ESMTP id 7BFE055CB
	for <linux-lvm@redhat.com>; Thu,  8 Feb 2007 21:37:20 +0100 (CET)
Message-ID: <45CB89CE.6080208@free.fr>
Date: Thu, 08 Feb 2007 21:36:30 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] replacing a failling disk on a mirrred VG.
References: <45C62BB0.6090004@free.fr>
	<abae97f2062bff4699caa277e2faea30@redhat.com>
In-Reply-To: <abae97f2062bff4699caa277e2faea30@redhat.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jonathan E Brassow a �crit :
> This one should be pretty easy...
> 
> Effectively, you want to keep the primary mirror devices, so do:
> lvconvert -m0 <vg/lv>
> to down convert them to linear devices.
> 
> Then remove PV1 (vgreduce), add a new disk to your system, add it to 
> your vg (vgextend), and finally, up-convert the linear devices to 
> mirrors again:
> lvconvert -m1 <vg/lv>
> 
>  brassow
> 
> On Feb 4, 2007, at 12:53 PM, Georges Giralt wrote:
> 
>> Hi !
>> I run A Fedora Core 6 box with
>> lvm> version
>>   LVM version:     2.02.17 (2006-12-14)
>>   Library version: 1.02.13 (2006-11-28)
>>   Driver version:  4.10.0
>> lvm>
>> on a 2.6.19 kernel.
>> My VG comprises 3PV  onto which I've spread 4 mirrored LVs.
>> PV 0 : LV1 mirror copy 0, LV2 mirror copy 0, lv3 mirror copy 0 and lv4 
>> mirror copy 0
>> PV 1 : LV1 mirror copy 1, LV2 mirror log, LV3 mirror log and LV4 
>> mirror copy 1
>> PV2 : LV1 mirror log, LV2 mirror copy 1 , LV3 mirror copy 1 and LV4 
>> mirror log.
>> I plan to replace (Smart signals a future failure) the PV #1.
>> Question : What is the best route to do this ? And is it feasible ?
>> Thanks a lot in advance for your answer !
Hi Brassov !
Your method was like a walk in a park.
Thanks !

-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
