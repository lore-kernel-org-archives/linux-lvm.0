Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6UKjCUT022960
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 16:45:12 -0400
Received: from mail.profihost.ag (mail.profihost.ag [85.158.179.208])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6UKj8Dh023583
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 16:45:09 -0400
Message-ID: <5016F258.9060206@profihost.ag>
Date: Mon, 30 Jul 2012 22:45:12 +0200
From: Stefan Priebe <s.priebe@profihost.ag>
MIME-Version: 1.0
References: <5016DD33.3050000@profihost.ag>
	<alpine.LRH.2.02.1207301618430.23442@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.02.1207301618430.23442@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to online resize pv?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Am 30.07.2012 22:25, schrieb Stuart D Gathman:
> On Jul 30, Stefan Priebe transmitted in part:
>
>> Number  Start   End     Size    File system  Name       Flags
>> 1      1049kB  2097kB  1049kB               GRUB_BOOT  bios_grub
>> 2      2097kB  32,2GB  32,2GB               Linux LVM  lvm
>>
>> If i delete 2 and recreate it starting at the same sector i can't
>> reread the part. table.
>>
>> Is there a way todo online resizing?
>
> Only when no partition is open.  That is one reason why LVM is an
> improvement over partition tables.  You don't have to use a partition
> table, just use the entire device as a PV.

that was my idea too but grub2 then refuses to install onto /dev/vda. It 
says it cannot find a filesystem on hd0 which is /dev/vda.

Stefan
