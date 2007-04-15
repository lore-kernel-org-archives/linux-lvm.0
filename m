Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3F7rhU4005434
	for <linux-lvm@redhat.com>; Sun, 15 Apr 2007 03:53:43 -0400
Received: from extmail.dtnet.de (extmail.dtnet.de [87.193.12.202])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3F7rf7j004787
	for <linux-lvm@redhat.com>; Sun, 15 Apr 2007 03:53:41 -0400
Message-ID: <4621D4CF.8080806@dtnet.de>
Date: Sun, 15 Apr 2007 09:31:27 +0200
From: Daniel Schwager <daniel.schwager@dtnet.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Limitation: Snapshots does not
	work	in	cluster	enviroment ?
References: <4620D7E3.9090609@dtnet.de>	<20070414145250.GI26983@agk.fab.redhat.com>	<4620E73F.50100@dtnet.de>	<20070414152407.GK26983@agk.fab.redhat.com>	<4620F6F1.8020906@dtnet.de>
	<20070415041138.GL26983@agk.fab.redhat.com>
In-Reply-To: <20070415041138.GL26983@agk.fab.redhat.com>
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
> On Sat, Apr 14, 2007 at 05:44:49PM +0200, Daniel Schwager wrote:
>   
>> So, thank you very much for your detailed explanation. Would
>> an implementaion change on "dmsetup" also solve the "Limitation of 32 
>> snapshots" ?
>>     
>
> Yes - that is a in-use per-machine limitation, and you'd only
> be using one snapshot on each machine.
>
>   
Do RH or the community want in integrate the changes in dmsetup - is 
there maybe a timeline for this ?
My task is to take n (e.g. n=5)  identical snapshot(snap1-5.LV)  from a 
xen-image (base.LV) and run
5 Xen-VM's (based on snap1-5.LV) on 5 different XEN-Server (phy.HW).

If this could not done with CLVM2, i have to change the concept to use 
GFS/OCFS2.

regards

Danny
