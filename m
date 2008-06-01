Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m514Cgb1013582
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 00:12:42 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.31])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m514CUCG024695
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 00:12:30 -0400
Received: by yw-out-2324.google.com with SMTP id 5so204943ywb.81
	for <linux-lvm@redhat.com>; Sat, 31 May 2008 21:12:30 -0700 (PDT)
Message-ID: <484221A5.8040605@gmail.com>
Date: Sat, 31 May 2008 23:12:21 -0500
From: Wendy Cheng <s.wendy.cheng@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
References: <20080529231213.GY19431@lug-owl.de>	<A78DB34D00374344A0AB65B6523C05DC0304E8E1@marsden.win.datacash.com>
	<20080531070328.GD19431@lug-owl.de>
In-Reply-To: <20080531070328.GD19431@lug-owl.de>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Maximilian Wilhelm <max@rfc2324.org>
Cc: linux clustering <linux-cluster@redhat.com>

Jan-Benedict Glaw wrote:
> On Fri, 2008-05-30 09:03:35 +0100, Gerrard Geldenhuis <Gerrard.Geldenhuis@datacash.com> wrote:
>   
>> On Behalf Of Jan-Benedict Glaw
>>     
>>> I'm just thinking about using my friend's overly empty harddisks for a
>>> common large filesystem by merging them all together into a single,
>>> large storage pool accessible by everybody.
>>>       
> [...]
>   
>>> It would be nice to see if anybody of you did the same before (merging
>>> the free space from a lot computers into one commonly used large
>>> filesystem), if it was successful and what techniques
>>> (LVM/NBD/DM/MD/iSCSI/Tahoe/Freenet/Other P2P/...) you used to get there,
>>> and how well that worked out in the end.
>>>       
>> Maybe have a look at GFS.
>>     
>
> GFS (or GFS2 fwiw) imposes a single, shared storage as its backend. At
> least I get that from reading the documentation. This would result in
> merging all the single disks via NBD/LVM to one machine first and
> export that merged volume back via NBD/iSCSI to the nodes. In case the
> actual data is local to a client, it would still be first send to the
> central machine (running LVM) and loaded back from there. Not as
> distributed as I hoped, or are there other configuration possibilities
> to not go that route?
>   

GFS is certainly developed and well tuned in a SAN environment where the 
shared storage(s) and cluster nodes reside on the very same fibre 
channel switch network. However, with its symmetric architecture, 
nothing can prevent it running on top of a group of iscsi disks (with 
GFS node as initiator), as long as each node can see and access these 
disks. It doesn't care where the iscsi targets live, nor how many there 
are. Of course, whether it can perform well in this environment is 
another story. In short, the notion that GFS requires all disks to be 
merged into one machine first and then export the merged volume back to 
the GFS node is *not* correct.

I actually have a 4-nodes cluster in my house. Two nodes running Linux 
iscsi initiators that have a 2-node GFS cluster setup. Another two nodes 
running a special version of  free-BSD as iscsi targets, each directly 
exports their local disks to the GFS nodes. I have not put too much IO 
loads on the GFS nodes though (since the cluster is mostly used to study 
storage block allocation issues - not for real data and/or application).

cc linxu-cluster

-- Wendy
