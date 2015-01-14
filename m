Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0EAIFNq028430
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2015 05:18:15 -0500
Received: from mail.shockmedia.nl (mail.shockmedia.nl [31.7.4.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0EAICvl026072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2015 05:18:13 -0500
Received: from office.shockmedia.nl ([31.7.3.253] helo=[192.168.8.179])
	by mail.shockmedia.nl with esmtpa (Exim 4.82)
	(envelope-from <bram@shockmedia.nl>) id 1YBL1f-00047t-Ph
	for linux-lvm@redhat.com; Wed, 14 Jan 2015 11:18:11 +0100
Message-ID: <54B64262.2030509@shockmedia.nl>
Date: Wed, 14 Jan 2015 11:18:10 +0100
From: Bram Klein Gunnewiek <bram@shockmedia.nl>
MIME-Version: 1.0
References: <54B619AE.6020704@shockmedia.nl> <54B62A0C.9080800@redhat.com>
In-Reply-To: <54B62A0C.9080800@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] determining snapshot overhead
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

Thanks for your reply. I tested it out and it does not seem to work 
(lvm2 version used is 2.02.98-6ubuntu2):

lvcreate -n testvolume3 -L 1G vg
lvcreate -n testvolume3_snapshot -s /dev/vg/testvolume3 -l100%ORIGIN
dd if=/dev/zero of=/dev/vg/testvolume3 bs=1G count=1

After this the snapshot is invalid:

testvolume3_snapshot vg swi-I-s--   1.00g      testvolume3 100.00

I checked out the lvm2 source code and found the methods cow_max_extents 
and _cow_max_size  in snapshot_manip.c. Do these methods calculate the 
exact max size of the snapshot meta data?

On 01/14/2015 09:34 AM, Zdenek Kabelac wrote:
> Dne 14.1.2015 v 08:24 Bram Klein Gunnewiek napsal(a):
>> Hello,
>>
>> I am trying to create snapshots of thick volumes that can't break 
>> because they
>> overflow (thin volumes are not an option right now). I can't find 
>> information
>> on how to calculate (in advance) the metadata overhead of a snapshot 
>> when all
>> blocks in the origin volume are changed (e.g. the snapshot is 100% 
>> full). Is
>> there a way to do this?
>
>
> Recent versions of lvm2  (let's say >= 111) are able to determine this 
> size automatically - just use: 'lvcreate -s -l100%ORIGIN vg/origin'
>
> Regards
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
