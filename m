Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1OJG4EB019124
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:16:04 -0500
Received: from aspen.rjl.com (aspen.rjl.com [66.35.48.14])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1OJFrN2000504
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:15:53 -0500
Received: from stardust.rjl.com (173-16-199-31.client.mchsi.com
	[173.16.199.31])
	by aspen.rjl.com (vPostMaster) with ESMTP id 6CA431D022C
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 11:16:21 -0800 (PST)
Message-ID: <4D66AE68.6030406@rjl.com>
Date: Thu, 24 Feb 2011 11:15:52 -0800
From: Nataraj <incoming-centos@rjl.com>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>
	<4D668A57.3000306@abpni.co.uk>
In-Reply-To: <4D668A57.3000306@abpni.co.uk>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

On 02/24/2011 08:41 AM, Jonathan Tripathy wrote:
>
> On 24/02/11 15:20, Jonathan Tripathy wrote:
>>
>> On 24/02/11 15:13, Stuart D. Gathman wrote:
>>> On Thu, 24 Feb 2011, Jonathan Tripathy wrote:
>>>
>>>>> Yes. To be more pedantic, the COW has copies of the original contents
>>>>> of blocks written to the origin since the snapshot.  That is why you
>>>>> need to clear it to achieve your stated purpose.  The origin blocks
>>>>> are written normally to the *-real volume (you can see these in
>>>>> the /dev/mapper directory).
>>>> But didn't you say that there is only one copy of the files stored
>>>> physically
>>>> on disk?
>>> Yes.  When you make the snapshot, there is only one copy, and the
>>> COW table
>>> is empty.  AS YOU WRITE to the origin, each chunk written is saved to
>>> *-cow first before being written to *-real.
>> Got ya. So data that is being written to the origin, while the
>> snapshot exists, is the data that may leak, as it's saved to the COW
>> first, then copied over to real.
>>
>> Hopefully an expert will let me know weather its safe to zero the COW
>> after I=EF=BF=BDve finished with the snapshot.
>>
>>
> Oh, I forgot to mention. My LVM sits on top of linux software RAID1.
> Does that complicate things at all?
>

One other thing that wasn't mentioned here.... As far as I understand,
if these are lvms on the host and the snapshots are being taken on the
host, there is no guaranteed integrity of the filesystems unless you
shutdown the guest while the snapshot is taken.

It's too bad they don't implement a system call that could do something
like sync filesystem and sleep until I tell you to continue.  This would
be perfect for snapshot backups of virtual hosts.

Nataraj
