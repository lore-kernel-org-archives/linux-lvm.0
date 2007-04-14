Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3EG735U027695
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 12:07:03 -0400
Received: from extmail.dtnet.de (extmail.dtnet.de [87.193.12.202])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3EG71DW005094
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 12:07:02 -0400
Message-ID: <4620F6F1.8020906@dtnet.de>
Date: Sat, 14 Apr 2007 17:44:49 +0200
From: Daniel Schwager <daniel.schwager@dtnet.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Limitation: Snapshots does not work
	in	cluster	enviroment ?
References: <4620D7E3.9090609@dtnet.de>	<20070414145250.GI26983@agk.fab.redhat.com>	<4620E73F.50100@dtnet.de>
	<20070414152407.GK26983@agk.fab.redhat.com>
In-Reply-To: <20070414152407.GK26983@agk.fab.redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Alasdair G Kergon schrieb:
>> So, i want to use snapshot1 on server1, snapshot2 on server2. The 
>> original LV (where the snapshot is created from) is not in use (not mounted on any 
>> server)
>>     
..
> I think the userspace LVM code could be tweaked to support this
> configuration.  Until then, you'll need to activate the snapshots
> manually using dmsetup directly.
>   
This would be fine.
>
> Userspace changes we'd need for the tools (dmsetup) to support this:
>   Permit a snapshot to be activated without its corresponding origin.
>   - requires a snapshot exclusive lock (already supported)
>   - requires an origin lock that prevents any node having origin active
> (implementation needs more thought but it should be possible)
>
>   
So, thank you very much for your detailed explanation. Would
an implementaion change on "dmsetup" also solve the "Limitation of 32 
snapshots" ?
Or is there a another possibility to fix/workaround this topic ?

regards

Danny
