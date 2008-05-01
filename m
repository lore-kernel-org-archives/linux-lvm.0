Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41KVAuS018026
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:31:10 -0400
Received: from vms048pub.verizon.net (vms048pub.verizon.net [206.46.252.48])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41KUwK6030586
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:30:59 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms048.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0700LJ3IB2EM90@vms048.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 01 May 2008 15:30:38 -0500 (CDT)
Date: Thu, 01 May 2008 16:30:38 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <20080501202534.GU18935@agk.fab.redhat.com>
Message-id: <481A286E.80309@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4818F2FC.5050907@verizon.net> <20080501154800.GA5941@us.ibm.com>
	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
	<481A08A7.5010305@verizon.net> <481A0E28.5030108@Media-Brokers.com>
	<481A1C09.7070508@verizon.net> <481A1D32.6020705@Media-Brokers.com>
	<481A1FAF.5050303@verizon.net> <481A221D.80209@Media-Brokers.com>
	<481A262C.7080908@verizon.net>
	<20080501202534.GU18935@agk.fab.redhat.com>
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

Alasdair G Kergon wrote:
> On Thu, May 01, 2008 at 04:21:00PM -0400, Gerry Reno wrote:
>   
>> At least in the case where the snapshot is read-only (LVM1 default, LVM2 
>> by config?), if the snapshot is lost, invalid, not removed from VG prior 
>> to reboot, when LVM comes back up it should see this and immediately 
>> know that it can just vgreduce VG --removemissing for the old snapshot.  
>> In the case of rw (no LVM1, LVM2 default), it should be a user choice 
>> and LVM should prompt the user at boot as to whether to remove this old 
>> snapshot so it can attempt to activate the VG.  Unless the user knows 
>> that there were non-backup related lvm mods written during the snapshot 
>> (eg: pvmove) then the user will just answer yes and the system should 
>> boot.  This is how LVM should operate in this scenario.
>>     
>  
> If you want your system to do that, update your initrd/initscripts
> accordingly to run the appropriate lvm2 commands to do that!
>
> Alasdair
>   

I can certainly do that. But I think this applies in the general case 
and should be included as standard behavior in LVM. This is a much more 
robust means of dealing with this scenario that having LVM just refuse 
to mount the volume when the only issue is a bad snapshot.


Gerry
