MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Jul 2017 21:54:11 +0200
From: Matthias Leopold <matthias.leopold@meduniwien.ac.at>
In-Reply-To: <4577d764-d6bb-723f-086a-20c004e68a36@redhat.com>
References: <55f9c8eb-41df-8b3b-c790-e81fbcef0a73@meduniwien.ac.at>
	<4577d764-d6bb-723f-086a-20c004e68a36@redhat.com>
Message-ID: <72d0a5a83cd40c84ba641ae0d1452e4c@meduniwien.ac.at>
Subject: Re: [linux-lvm] convert LV to physical device _in_place_?
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
Cc: zkabelac@redhat.com

Am 2017-07-13 17:25, schrieb Zdenek Kabelac:
> Dne 13.7.2017 v 15:25 Matthias Leopold napsal(a):
>> hi,
>> 
>> i'm fiddling around with LVM backed KVM raw disks, that i want to use 
>> _directly_ in oVirt virtualization (as "Direct LUN"). i would like to 
>> avoid "importing", dd, etc. if possible. in the KVM origin system 
>> exists a mapping of one iSCSI whole device (no partitions) to one PV 
>> to one VG to one LV per KVM disk. i can now present these iSCSI 
>> devices to the oVirt hosts, where i can only use them as "Direct LUN" 
>> without the LVM layer (i guess). so all i would need is to remove the 
>> LVM metadata from the iSCSI device preserving the "content" of the LV. 
>> pvremove seems to be too "intrusive" for this... i know this sounds 
>> rather naive and i didn't find any recipes for it. everybody talks 
>> about dd to a new device, which of course works (i tried it), but is 
>> exactly what i want to avoid when migrating very large disks (TB). i 
>> hope someone understands my concern and maybe has a solution
>> 
> 
> 
> Hi
> 
> Yep, it really sounds a bit naive :)
> 
> PV has 'header' so the real 'data' are shifted by  PV header+lvm2 
> metadata.
> and also LV does not need to be sequential.
> 
> However if you have been having a single 'segment' LV and and you 
> calculate
> proper skipping offset (typically 1MB) you can try to use such device
> directly without lvm2 with a loop device mapping -  see losetup
> --offset option - but you would need to use this everytime you want to
> access such storage - so there is not a single magic 'flip' which
> would make an LV to appear like
> regular device.
> 
> Regards
> 
> Zdenek

Hi Zdenek,

thanks for explaining. I practically knew it was impossible when i wrote 
it, but sometimes i get carried away by fixed ideas and need someone 
"authoritative" to tell me the obvious (with maybe a little technical 
background)... you did the job ;-)

Regards

matthias
