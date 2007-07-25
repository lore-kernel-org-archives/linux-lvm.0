Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6PGt8g8015144
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2007 12:55:08 -0400
Received: from smtp4-g19.free.fr (smtp4-g19.free.fr [212.27.42.30])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6PGt6K7031649
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2007 12:55:06 -0400
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id DFD966F23F
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2007 18:55:05 +0200 (CEST)
Received: from [192.168.0.1] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp4-g19.free.fr (Postfix) with ESMTP id B7CE56EBEB
	for <linux-lvm@redhat.com>; Wed, 25 Jul 2007 18:55:05 +0200 (CEST)
Message-ID: <46A78069.8040604@free.fr>
Date: Wed, 25 Jul 2007 18:55:05 +0200
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange messages on my Fedora Box
References: <46A775F6.6000307@free.fr> <46A77C39.90000@redhat.com>
In-Reply-To: <46A77C39.90000@redhat.com>
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

Milan Broz a �crit :
> Georges Giralt wrote:
>> Hi !
>> The context :
>> Fedora Core 7 on an X86-64  AMD Athlon 64x2 box.
>> lvm> version
>>    LVM version:     2.02.24 (2007-03-19)
>>    Library version: 1.02.17 (2007-01-29)
>>    Driver version:  4.11.0
>> lvm>
>> Kernel : 2.6.22.1-27.fc7
>> 3 X 160 Gb disks with 4 primary partitions
>> the 3 last partitions in each disks make 3 VG : vgF32, vgF64 and vg-Ext.
>> I use LVM mirroring.
> 
> Mirror staus string is broken in 2.6.22 stable kernel, I hope that fix will be
> part of next stable update.
> 
> patch exist for some time here
> http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/dm-raid1-fix-status.patch
> 
> 
>> The vgF32 vg hold a FC7 32 bits version, vgF64 the FC7 64 bits version 
>> (the one I use now) and vg-Ext the home and various data.
>> Today, i ran lvs and get the following message.
>> I've nothing in the system message file nor in the dmesg ring.
>> /bott is an md made with the 2 first partitions of the 2 first disks and 
>> is fine.
>> Questions :
>> Is it serious ? What should I do ? How to recover ?
> 
> If you boot to 2.6.21 kernel, it should work ok, 2.6.23-rc1 has this fix too.
> It is only reporting problem for mirrored volumes (in this case).
> (But it is breaking pvmove functionallity too.)
> 
> Milan
> --
> mbroz@redhat.com
Thanks Milan !
I _do_ prefer that.
I'll wait until the code is fixed.
regards
-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
