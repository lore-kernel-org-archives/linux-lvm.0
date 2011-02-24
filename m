Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1O0epbD023977
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 19:40:51 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1O0eaVw008520
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 19:40:37 -0500
Message-ID: <4D65A8F5.8040606@abpni.co.uk>
Date: Thu, 24 Feb 2011 00:40:21 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>
	<4D65A839.50107@abpni.co.uk>
In-Reply-To: <4D65A839.50107@abpni.co.uk>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On 24/02/11 00:37, Jonathan Tripathy wrote:
>
> On 24/02/11 00:32, Stuart D. Gathman wrote:
>> On Thu, 24 Feb 2011, Jonathan Tripathy wrote:
>>
>>> So I'm guessing then, that when a snapshot is created for an origin, 
>>> then
>>> there are 2 physical copies of the data on disk? (Albeit only one is
>>> accessible at the regular filesystem level)
>> NO, NO, NO.  There is still only *one* physical copy of the data
>> after creating a snapshot.  You have simply created a "branch point"
>> which can now diverge as each branch is written to.
>>
> Then why was it suggested that I should zero my new customer LVs upon 
> creation? Please remember that my snapshots will not be written to
>
However the origin will be written to as it will be in use...
