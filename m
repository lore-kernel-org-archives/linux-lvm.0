From: <wayne.berthiaume@emc.com>
Date: Mon, 7 Feb 2011 21:10:44 -0500
Message-ID: <DBB78E3AB582194EA5F75C87D7DBD66F01039F26@MX32A.corp.emc.com>
References: <4D4C0933.80107@redhat.com> <20110204155403.GD1535@redhat.com>
	<4D4C2B3A.3010704@redhat.com>
In-Reply-To: <4D4C2B3A.3010704@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm2: zeroing free space
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
To: linux-lvm@redhat.com
Cc: snitzer@redhat.com

You might be able to detect at least explicit via the VPD page.

Regards,
Wayne.

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Bryn M. Reeves
Sent: Friday, February 04, 2011 11:37 AM
To: LVM general discussion and development
Cc: Mike Snitzer
Subject: Re: [linux-lvm] lvm2: zeroing free space

On 02/04/2011 03:54 PM, Mike Snitzer wrote:
> On Fri, Feb 04 2011 at  9:12am -0500,
> Bryn M. Reeves <bmr@redhat.com> wrote:
> 
>> Hi Folks,
>>
>> Recently had a query from someone using an array supporting thin provisioning
>> with zero page reclaim[1].
>>
>> They wanted a method to write zeros to all the unallocated space in a VG to
>> trigger a reclaim of unused regions in the VG's PVs.
>>
>> My suggestion was to lvcreate a -l100%FREE LV named "filler" and overwrite it
>> from /dev/zero.
>>
>> It seems like this might something a lot of users want as this functionality
>> gets to be more common.
>>
>> I wondered if it could be worth adding a script to automate this or even an
>> option to vgchange (e.g. --zero-free-space)?
>>
>> Didn't have time to try putting anything together yet but it seems such a
>> feature could be useful.
> 
> Do these HDS arrays also support discard?  Would seem to me that issuing
> discards for the free space would be better (more standard) than writing 
> zeros to accomplish the same.
> 
> This variant would be: vgchange --discard-free-space

There are two variants of reclamation currently supported by external storage
products.

The WRITE_SAME/TRIM based explicit discard support is superior when the entire
storage stack supports it and I agree it would be good to support this mode of
reclaim too (superior in that you lose the zero-write overhead and associated
reclaim lag and can get better space utilisation since the host "knows" better
which blocks are unused).

Several vendors (at least HDS/EMC that I know of) also support an implicit
reclaim mode known as zero page/space reclaim in which the storage de-allocates
blocks that are overwritten with zeros.

I suppose the ideal solution would be to detect whether the storage supports one
or the other automatically but I don't know that there is a way to achieve this
right now (TRIM/WRITE_SAME possibly but I think the zero page stuff is entirely
transparent).

Regards,
Bryn.


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
