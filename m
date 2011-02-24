Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1O7YQHU004492
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 02:34:27 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1O7YDbm027618
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 02:34:14 -0500
Message-ID: <4D6609E4.10800@abpni.co.uk>
Date: Thu, 24 Feb 2011 07:33:56 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>
	<1298466573.19562.147.camel@ubuntu>	<4D65124C.1070505@abpni.co.uk>
	<1298470564.19562.150.camel@ubuntu>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>
	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>
	<4D65A8F5.8040606@abpni.co.uk>
	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>
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


On 24/02/11 02:00, Stuart D. Gathman wrote:
> On Thu, 24 Feb 2011, Jonathan Tripathy wrote:
>
>>>>> So I'm guessing then, that when a snapshot is created for an origin,
>>>>> then
>>>>> there are 2 physical copies of the data on disk? (Albeit only one is
>>>>> accessible at the regular filesystem level)
>>>> NO, NO, NO.  There is still only *one* physical copy of the data
>>>> after creating a snapshot.  You have simply created a "branch point"
>>>> which can now diverge as each branch is written to.
>>>>
>>> Then why was it suggested that I should zero my new customer LVs upon
>>> creation? Please remember that my snapshots will not be written to
>>>
>> However the origin will be written to as it will be in use...
> There were 3 cases of what you might be asking.  One of the 3 cases was:
> If you are taking snapshots for backup, then it was suggested to zero the *-cow
> (which will have any blocks written to the origin since the snapshot was taken)
> before deleting the snapshot.  However, I wasn't sure if this was safe to while
> the origin is mounted, since writes to the origin consult the *-cow to see
> whether origin blocks need to be copied before begin overwritten.
But I want to keep this data. As the data written to the origin while a 
respective snapshot is in use would be data during normal operation of a 
customer VPS.

All I want to do is make sure that my use of snapshot for backup 
purposes (to rsync the snapshot to a remote server) doesn't leave loose 
data lying anywhere on physical disk.
