Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oABIdkmb025373
	for <linux-lvm@redhat.com>; Thu, 11 Nov 2010 13:39:46 -0500
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oABIdV7P032139
	for <linux-lvm@redhat.com>; Thu, 11 Nov 2010 13:39:31 -0500
Received: by gwb20 with SMTP id 20so69230gwb.33
	for <linux-lvm@redhat.com>; Thu, 11 Nov 2010 10:39:31 -0800 (PST)
Message-ID: <4CDC3860.7000203@gmail.com>
Date: Thu, 11 Nov 2010 13:39:28 -0500
From: Mauricio Tavares <raubvogel@gmail.com>
MIME-Version: 1.0
References: <4CDAAE84.5060806@gmail.com>	<Pine.LNX.4.64.1011101235510.1807@bmsred.bmsi.com>	<4CDB01F8.6090202@gmail.com>
	<Pine.LNX.4.64.1011111140550.12331@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1011111140550.12331@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bad disk?
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
To: linux-lvm@redhat.com

On 11/11/2010 11:46 AM, Stuart D. Gathman wrote:
> On Wed, 10 Nov 2010, Mauricio Tavares wrote:
>
>>> Tell us exactly what you mean by "put a LVM on it".  Did you run
>>> pvcreate?  vgcreate?  lvcreate? You might find the output of "pvs"
>>> enlightening.  That will tell us what PVs you have created.
>>> And list /dev/mapper so we know what dm-0 is, and include the output of
>>> "lvs".
>>>
>> 	Let me put this way, I thought I did. I mean, after creating the
>> partition, setting it to LVM (8e), then running
>>
>> pvcreate /dev/sdc1
>> vgcreate export /dev/sdc1
>> lvcreate -L 400G --name vms export
>>
>> I used mkfs.ext4 to create partition (on /dev/mapper/export-vms) and off I
>> went. Do you think I missed a step?
>
> Great.  Now include output of "lvs"

raub@strangepork:~$ sudo lvs export
   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
   LV   VG     Attr   LSize   Origin Snap%  Move Log Copy%  Convert
   vms  export -wi-a- 400.00g
raub@strangepork:~$

> BTW, if you really suspect a disk error, test for it directly.
> E.g., you can run
>
> # dd if=/dev/sdc1 of=/dev/null bs=256k
>
> to read through the partition or
>
> # smartctl -t long /dev/sdc
>
> To initiate a long self test of the disk (need smartmontools installed).
>
> A brand new disk that flunks self test is indeed defective.
>
> However, for real physical I/O errors, there would be errors logged
> in /var/log/messages referencing sdc (as opposed to dm-0), so I still
> think it is a logical error.
>
