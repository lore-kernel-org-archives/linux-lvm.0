Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p35KA4jV031212
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 16:10:04 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p35K9xPu027946
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 16:10:00 -0400
Message-ID: <4D9B7715.7090509@abpni.co.uk>
Date: Tue, 05 Apr 2011 21:09:57 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk> <4D65124C.1070505@abpni.co.uk>
	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>
	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>
	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>
	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>
	<4D667743.3010102@abpni.co.uk>
In-Reply-To: <4D667743.3010102@abpni.co.uk>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



On 24/02/2011 15:20, Jonathan Tripathy wrote:
>
> On 24/02/11 15:13, Stuart D. Gathman wrote:
>> On Thu, 24 Feb 2011, Jonathan Tripathy wrote:
>>
>>>> Yes. To be more pedantic, the COW has copies of the original contents
>>>> of blocks written to the origin since the snapshot.  That is why you
>>>> need to clear it to achieve your stated purpose.  The origin blocks
>>>> are written normally to the *-real volume (you can see these in
>>>> the /dev/mapper directory).
>>> But didn't you say that there is only one copy of the files stored=20
>>> physically
>>> on disk?
>> Yes.  When you make the snapshot, there is only one copy, and the COW=20
>> table
>> is empty.  AS YOU WRITE to the origin, each chunk written is saved to
>> *-cow first before being written to *-real.
> Got ya. So data that is being written to the origin, while the=20
> snapshot exists, is the data that may leak, as it's saved to the COW=20
> first, then copied over to real.
>
> Hopefully an expert will let me know weather its safe to zero the COW=20
> after I=EF=BF=BDve finished with the snapshot.
Are any "experts" available to help me answer the above question? I feel=20
that this is a really important issue for those of us in the hosting=20
industry.

Just to sum up my question: when a customer leaves our service, we zero=20
their drive before removing the LV. This hopefully ensures that there is=20
no data "leakage" when we create a new LV for a new customer. However,=20
we need to take into consideration about what happens when we create=20
snapshots of LVs to perform backups (using rsync).

Any help would be appreciated.
