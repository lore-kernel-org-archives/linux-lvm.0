Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l92AC8R5022021
	for <linux-lvm@redhat.com>; Tue, 2 Oct 2007 06:12:08 -0400
Received: from smtp.unilim.fr (mail.unilim.fr [164.81.1.45])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l92ABxoT006243
	for <linux-lvm@redhat.com>; Tue, 2 Oct 2007 06:12:00 -0400
Received: from root.ensil.unilim.fr (root.ensil.unilim.fr [193.50.177.246])
	by smtp.unilim.fr (8.13.1/8.13.1) with ESMTP id l92ABkGB020180
	for <linux-lvm@redhat.com>; Tue, 2 Oct 2007 12:11:46 +0200
Received: from [127.0.0.1] (cluster1.ensil.unilim.fr [193.50.177.250])
	by root.ensil.unilim.fr (8.14.1/8.13.4) with ESMTP id l92ADTP7015548
	for <linux-lvm@redhat.com>; Tue, 2 Oct 2007 12:13:30 +0200 (CEST)
	(envelope-from chomette@ensil.unilim.fr)
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <46FCA97B.9000109@gmail.com>
References: <D1DF25FB-02EE-46BF-92AF-4DB9039BFFB8@ensil.unilim.fr>	<46FBEA1B.7070905@stercomm.com>
	<290F03E9-E521-4E3A-824F-8C4DCBD8341B@ensil.unilim.fr>
	<46FCA97B.9000109@gmail.com>
Message-Id: <4B7CC06B-8F82-4AAB-9643-0ACFF73511EB@ensil.unilim.fr>
From: hubert chomette <chomette@ensil.unilim.fr>
Subject: Re: [linux-lvm] lvm on a share environnement (SAN inside)
Date: Tue, 2 Oct 2007 12:11:43 +0200
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
Content-Type: text/plain; charset="utf-8"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

ok
thank's for the information
I'll try.

regards,

Le 28 sept. 07 � 09:12, David Robinson a �crit :

> hubert chomette wrote:
>> the two machine use the same lun, on this lun, there is one vg  
>> with a logical volume by virtual machine (10 virtual machine).
>> The idea is if one xen is down, the other can launch the virtual  
>> machine ad continu service.
>
> So its a high-availability cluster...
>
>>>> - Is it possible to allow LVM metadata modification by only one  
>>>> server?
>>>> - should I use clvm instead?
>
> The link below describes what can happen.
>
> http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html
>
> It sounds like you should be using CLVM. CLVM extends LVM2 to  
> provide cluster-wide management of Logical Volumes. LVM and CLVM  
> are essentially the same thing, but CLVM is cluster aware, LVM is not.
>
> Alasdair has some presentations which describe CLVM in detail here:
>
> http://people.redhat.com/agk/talks/CLVM-UKUUG2007/
>
>>>> - Is it possible to migrate lvm to clvm without any data lost?
>
> There's no migration involved, you just need to enable cluster  
> locking for the shared volume group.
>
> eg: vgchange -c y VolumeGroupName
>
> --Dave
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
