Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0NMp0Oi003696
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 17:51:00 -0500
Received: from australis.nwra.com (australis.nwra.com [66.92.245.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0NMobbf002006
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 17:50:38 -0500
Message-ID: <3982.69.9.10.34.1201128633.squirrel@mail.nwra.com>
In-Reply-To: <Pine.LNX.4.44.0801231733500.25169-100000@bmsred.bmsi.com>
References: <Pine.LNX.4.44.0801231733500.25169-100000@bmsred.bmsi.com>
Date: Wed, 23 Jan 2008 15:50:33 -0700 (MST)
Subject: Re: [linux-lvm] Recovering LVM Volume
From: "Jim Secan" <jim@nwra.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Many thanks, and I think this how-to list (corrected as necessary) would
be a very good addition to the FAQ specifically for this situation.  Lots
of people find that they have disks under LVM by default and don't have a
clue what they've got until their server goes belly up.

Turns out I do have a non-LVM system, and that has made the nut.  Thanks
again.

Jim

Stuart D. Gathman wrote:
> On Wed, 23 Jan 2008, Jim Secan wrote:
>
>> The issue is trying to mount a drive that was the primary internal HD
>> for
>> a system with a failed motherboard.  The disk was built using FC3, and
>> has
>> a a /boot partition and one under LVM control.  When I try to mount this
>> disk as a USB drive from a CentOS system, I can't mount the
>> LVM-controlled
>> partition because it has the same LVM volume/group name as the disk in
>> the
>> CentOS system.
> ...
>> 2.  Rename the volume on the USB HD.  This requires me to power down the
>> CentOS system, open the box, disconnect the internal HD, boot to the
>> installation CD in rescue mode, use lvm commands to rename the USB HD,
>> and
>> then put everything back together again.  This sounds overly
>> complicated,
>> but necessary.
>>
>> So, have I understood all this correctly?  Are these the only two ways
>> in
>> which this problem can be surmounted, and if so which is the safest.
>> I'm
>> thinking that I want to rename the internal HD to something other than
>> the
>> default setting anyway, but I really don't like the idea that I might
>> miss
>> changing the name in some important file or script that will bite me
>> later.
>
> 3. Plug the USB HD into any available system with a different/no internal
> VG name and rename.  Stick a LiveCD into one of your LTSP thin clients
> for instance.
>
> 4. Rename the USB HD using the UUID:
>    # vgrename -v [VGUUID] newvgname
>
>    From the man page:
>    "vgrename Zvlifi-Ep3t-e0Ng-U42h-o0ye-KHu1-nl7Ns4 VolGroup00_tmp"
>    changes the name of the Volume Group with UUID
>    Zvlifi-Ep3t-e0Ng-U42h-o0ye-KHu1-nl7Ns4 to "VolGroup00_tmp".
>
> --
> 	      Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
> 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
