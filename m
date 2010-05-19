Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGvsfZ025798
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:57:54 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JGvi0J022483
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:57:45 -0400
Message-ID: <4BF41884.4080000@alteeve.com>
Date: Wed, 19 May 2010 12:57:40 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <059801caf769$fc848350$f58d89f0$@com>	<4BF40A8B.2000201@alteeve.com>
	<20100519162601.GA18162@us.ibm.com>	<05c901caf771$a3161920$e9424b60$@com>
	<Pine.LNX.4.64.1005191246520.28122@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1005191246520.28122@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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

On 10-05-19 12:51 PM, Stuart D. Gathman wrote:
> On Wed, 19 May 2010, kevin wrote:
>
>>> If I were you, I would not bother with partition(s). I will add the
>>> whole disk to LVM.
>>
>> I intend for the entire disk to be used -- so I should just skip the fdisk
>> step?
>
> Yes, just do the pvcreate directly on /dev/sdc (instead of /dev/sdc1).
>
> I would only recommend this if the drive is permanently attached to your
> server.  If there is any possibility of it getting moved to another system,
> especially another OS, it is likely to appear "unformatted" and the other
> OS will offer to create a partition table, etc, destroying the data.
> The partition table, although otherwise useless for LVM (and a pain when
> trying to align PPs to some lower lever boundary), does serve the purpose
> of telling other PC operating systems that there is something there.

There ya go, I learn something new every day. :)

-- 
Digimer
E-Mail:         linux@alteeve.com
AN!Whitepapers: http://alteeve.com
Node Assassin:  http://nodeassassin.org
