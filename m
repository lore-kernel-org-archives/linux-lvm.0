Received: from [10.34.131.133] (dhcp131-133.brq.redhat.com [10.34.131.133])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9O9Z7J9014404
	for <linux-lvm@redhat.com>; Thu, 24 Oct 2013 05:35:08 -0400
Message-ID: <5268E9CA.60100@redhat.com>
Date: Thu, 24 Oct 2013 11:35:06 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAFp1kvNSrN+FiVqyzO2OW7FkjtCA3oeo1DQ3D8m2d9ycSCBvsw@mail.gmail.com>
	<5267FCC6.6060605@tekcomms.com>
In-Reply-To: <5267FCC6.6060605@tekcomms.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvs complains of missing PVs that are not missing
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

Dne 23.10.2013 18:43, Joe Harvell napsal(a):
>> Hi Joe,
>>
>> I am having similar issues in that I have a LVM2 raid1 mirror between a
>> local disk and a iSCSI disk and once I remove the iSCSI disk and add it
>> back, the mirror stays broken. I traced the cause of that to be LVM2 still
>> complains about a PV missing even though the same PV has been added back.
>>
>> I wonder if you have resolved your issue and what did you do.
>> Thanks a lot.
>> Shi
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> Shi,
>
> This is not yet resolved.  I'm still waiting for Peter Rajnoha to follow up
> after I provided him the information he requested.  He said he might be able
> to look at it more closely later this week. In the mean time, I work around
> this issue by activating the VG with --partial.  I can access my data, but I
> can't make any LVM config changes.
>
>

If the missing PV is reattached to your system - you need to

vgextend --restoremissing   /dev/path_to_PV


Since once the PV is detected as missing - metadata are update on present PVs,
and the missing PV is marked as MISSING.
When such PV reappear - you need to run the command to re-synchronize metadata.

Zdenek
