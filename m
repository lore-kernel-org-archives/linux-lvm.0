Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8JHc24Y016634
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 13:38:02 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8JHbu1v004801
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 13:37:56 -0400
Received: by eya28 with SMTP id 28so2415394eya.33
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 10:37:56 -0700 (PDT)
Sender: Gijs Boer <blizzeye@gmail.com>
Message-ID: <4E777DED.4090302@bsnw.nl>
Date: Mon, 19 Sep 2011 19:37:49 +0200
From: Gijs <info@bsnw.nl>
MIME-Version: 1.0
References: <4E75F91D.4000601@bsnw.nl>
	<8f3368df-7c8b-4741-b859-d10e3eb56a24@email.android.com>
In-Reply-To: <8f3368df-7c8b-4741-b859-d10e3eb56a24@email.android.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM pretends it has more space than it actually has
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

Thank you for your response, however I don't quite understand what you 
mean by activating them in reverse order. Activating the PV before the 
raid system should be impossible right? And shouldn't activating them in 
the right order solve the problem? Or am I missing something here?

On 19-9-2011 3:23, adultsitesoftware@gmail.com wrote:
> The  PV is 1MB smaller than the device it's on due to the metadata.
>
> The symptoms you are presenting is exactly what would happen if  someone had previously set up the RAID and LVM in the typical fashion, with LVM atop RAID, then you tried to activate them in reverse order.
>
> If.you value your data, backup the block devices before proceeding.
>
> Gijs<info@bsnw.nl>  wrote:
>
>> Dear List,
>>
>> After I ran into some trouble with my raid setup, I managed to get it
>> online again, but somehow LVM won't activate the physical volume that
>> was on it. Well, to be exact, it will activate the PV, but not all the
>> LVs on it. It activates two of the three LVs.
>>
>> When I type in "lvchange -a y /dev/raid-5/data" to activate the
>> remaining LV, it returns the following errors:
>> device-mapper: resume ioctl failed: Invalid argument Unable to resume
>> raid--5-data (253:2)
>>
>> Checking dmesg, it says the following:
>> device-mapper: table: 253:2: md127 too small for target:
>> start=5897914368, len=1908400128, dev_size=7806312448
>>
>> I pretty much tried everything and as a last resort I typed in the
>> following:
>> pvresize -v --setphysicalvolumesize 3996831973376B /dev/md127
>> Where 3996831973376 is the exact amount of bytes available on the raid
>> array. However, this gave me the following info:
>> Using physical volume(s) on command line
>> Archiving volume group "raid-5" metadata (seqno 21).
>> /dev/md127: Pretending size is 7806312448 not 7806314496 sectors.
>> Resizing physical volume /dev/md127 from 952919 to 952918 extents.
>> /dev/md127: cannot resize to 952918 extents as later ones are
>> allocated.
>> 0 physical volume(s) resized / 1 physical volume(s) not resized
>>
>> Now I wonder why LVM wants to pretend it has more space than it
>> actually
>> has. Because when I subtract those sectors from each other, and I
>> calculate how much bytes are in those "pretended sectors", it turns out
>>
>> that that's the exact amount that is missing (1MB).
>>
>> I'm running Fedora 15 from a rescue USB-stick at the moment, but the
>> system itself was formatted/configured under Fedora 14. Could that be
>> the cause of the problem? If not, what other options do I have to fix
>> this? (without loosing the data on the volume)
>>
>> Kind regards,
>>
>> Gijs
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
