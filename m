Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42FaJwT013569
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:36:19 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m42FaIAc018032
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:36:19 -0400
Message-ID: <481B34F2.3010700@redhat.com>
Date: Fri, 02 May 2008 16:36:18 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
References: <Pine.LNX.4.44.0805021111170.30896-100000@bmsred.bmsi.com>
	<481B33AC.7050102@verizon.net>
In-Reply-To: <481B33AC.7050102@verizon.net>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Gerry Reno wrote:
> Stuart D. Gathman wrote:
>> On Fri, 2 May 2008, Bryn M. Reeves wrote:
>>
>>  
>>> Am I missing something here? vgchange --partial seems like it will do
>>> what you want (man 8 lvm):
>>>     
>>
>> It does part of what I want.  It would at least allow a system to boot
>> from a partial VG containing the root fs.  It does not allow any
>> metadata changes while VG is partial - not even reducing missing PV.
>>   
> Well, what good is this if you cannot fix anything? You are stuck in
> 'broken' mode.
> 
> Regards,
> Gerry

You recover what you can and then either remove the stray PVs from the
volume group via vgreduce --removemissing or replace them with new
devices that you have prepared using pvcreate --uuid --restorefile=.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIGzTy6YSQoMYUY94RAszRAJ9d0xHvZJbktyps+iF1dhTRSM4oKgCfeWz2
WnV7jmyJLWIknLsddgDNpuM=
=vnhu
-----END PGP SIGNATURE-----
