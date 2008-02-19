Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1JDpkgx030056
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2008 08:51:46 -0500
Received: from ulx.hu (ulx.tvnet.hu [195.38.96.124])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1JDpFov001316
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2008 08:51:15 -0500
Received: from lucy.ulx.hu (lucy [172.16.0.2])
	by ulx.hu (Postfix) with ESMTP id CB806140341
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2008 14:51:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lucy.ulx.hu (Postfix) with ESMTP id 96E526405D
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2008 14:51:09 +0100 (CET)
Received: from lucy.ulx.hu ([127.0.0.1])
	by localhost (lucy.ulx.hu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfD7J24S94uZ for <linux-lvm@redhat.com>;
	Tue, 19 Feb 2008 14:51:03 +0100 (CET)
Received: from [172.16.1.240] (unknown [172.16.1.240])
	by lucy.ulx.hu (Postfix) with ESMTP id 31F5F6405C
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2008 14:51:03 +0100 (CET)
Message-Id: <64930681-3E2C-43C0-90CD-C90D438F8908@ulx.hu>
From: =?ISO-8859-1?Q?Lajk=F3_Attila?= <Lajko.Attila@ulx.hu>
In-Reply-To: <A97F9A76-A330-4BEF-8D1F-4A96E91D37CE@redhat.com>
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] mirrored LV + cmirror problem
Date: Tue, 19 Feb 2008 14:51:02 +0100
References: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
	<2D7245F3-4FBF-4569-BBA9-22E37E22C58A@redhat.com>
	<F66CC8D7-624C-4090-B0D8-1A0406B384A4@ulx.hu>
	<1D5E8B4E-A142-4276-8D12-5EB64E2AC2E3@redhat.com>
	<31248093.1203252552606.OPEN-XCHANGE.WebMail.ox@lucy.ulx.hu>
	<CB529B09-D602-4B23-AD87-6702B24B2086@redhat.com>
	<9EB92745-951F-4C64-8E66-3EA0999A3A14@ulx.hu>
	<A97F9A76-A330-4BEF-8D1F-4A96E91D37CE@redhat.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

I disconnected the lun from both nodes and it worked, the LV went to =20
linear. Thanks for the help!

One more question, what do you think about this testing scenario: Two-=20
nodes cluster, each node has a local disk which is exported via GNBD =20
to itself and to the other one. I build a cluster-mirrored LV on the =20
GNBD devices, then I kill one of the nodes. In this case, the cmirror =20
should work well? The LV will go to linear mode?

Attila

On Feb 18, 2008, at 7:30 PM, Jonathan Brassow wrote:

> That's the problem.  (C)LVM does not currently have a way to handle =20
> the disappearance of a device from just one machine... it expects a =20
> similar view of devices from all machines in a cluster.  "Locking" =20
> on the second node fails because it doesn't know what to do with the =20
> disk that it sees (that has been removed from the node suffering the =20
> failure).
>
> There is someone working handling orphaned/removed devices that =20
> reappear (which would be similar to this case), but I'm not sure if =20
> they've taken this scenario into account.  I'll let him know about =20
> this.
>
> brassow
>
> On Feb 18, 2008, at 10:48 AM, Lajk=EF=BF=BD Attila wrote:
>
>> Yes, I disconnected the lun via the Vtrak GUI from one of the nodes =20
>> (el4).
>>
>> Attila
>>
>> On Feb 18, 2008, at 5:08 PM, Jonathan Brassow wrote:
>>
>>> How are you performing the failures?  It looks like just one =20
>>> machine is loosing its connection to the device, while the other =20
>>> machines links remain in place.
>>>
>>> brassow
>>>
>>>
