Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m51DooIM005333
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 09:50:50 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.228])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m51DocAQ001657
	for <linux-lvm@redhat.com>; Sun, 1 Jun 2008 09:50:38 -0400
Received: by rv-out-0506.google.com with SMTP id f6so621842rvb.51
	for <linux-lvm@redhat.com>; Sun, 01 Jun 2008 06:50:37 -0700 (PDT)
Message-ID: <4842A922.6040102@gmail.com>
Date: Sun, 01 Jun 2008 08:50:26 -0500
From: Wendy Cheng <s.wendy.cheng@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
References: <20080529231213.GY19431@lug-owl.de>	<A78DB34D00374344A0AB65B6523C05DC0304E8E1@marsden.win.datacash.com>	<20080531070328.GD19431@lug-owl.de>
	<484221A5.8040605@gmail.com> <20080601070726.GK19431@lug-owl.de>
In-Reply-To: <20080601070726.GK19431@lug-owl.de>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Maximilian Wilhelm <max@rfc2324.org>, linux clustering <linux-cluster@redhat.com>

Jan-Benedict Glaw wrote:
> On Sat, 2008-05-31 23:12:21 -0500, Wendy Cheng <s.wendy.cheng@gmail.com> wrote:
>   
>> Jan-Benedict Glaw wrote:
>>     
>>> On Fri, 2008-05-30 09:03:35 +0100, Gerrard Geldenhuis <Gerrard.Geldenhuis@datacash.com> wrote:
>>>       
>>>> On Behalf Of Jan-Benedict Glaw
>>>>         
>>>>> I'm just thinking about using my friend's overly empty harddisks for a
>>>>> common large filesystem by merging them all together into a single,
>>>>> large storage pool accessible by everybody.
>>>>>           
>>> [...]
>>>  
>>>       
>>>>> It would be nice to see if anybody of you did the same before (merging
>>>>> the free space from a lot computers into one commonly used large
>>>>> filesystem), if it was successful and what techniques
>>>>> (LVM/NBD/DM/MD/iSCSI/Tahoe/Freenet/Other P2P/...) you used to get there,
>>>>> and how well that worked out in the end.
>>>>>           
>>>> Maybe have a look at GFS.
>>>>         
>>> GFS (or GFS2 fwiw) imposes a single, shared storage as its backend. At
>>> least I get that from reading the documentation. This would result in
>>> merging all the single disks via NBD/LVM to one machine first and
>>> export that merged volume back via NBD/iSCSI to the nodes. In case the
>>> actual data is local to a client, it would still be first send to the
>>> central machine (running LVM) and loaded back from there. Not as
>>> distributed as I hoped, or are there other configuration possibilities
>>> to not go that route?
>>>       
>>                         However, with its symmetric architecture, 
>> nothing can prevent it running on top of a group of iscsi disks (with 
>> GFS node as initiator), as long as each node can see and access these 
>> disks. It doesn't care where the iscsi targets live, nor how many there 
>> are.
>>     
>
> So I'd configure each machine's empty disk/partition as an iSCSI
> target and let them show up an every "client" machine and run that
> setup. How good will GFS deal with temporary (or total) outage of
> single targets? Eg. 24h disconnects with ADSL connectivity etc.?
>
>   
High availability will not work well in this particular setup - it is 
more about data and storage sharing between GFS nodes.

Note that GFS normally runs on top of CLVM (clustered lvm, in case you 
don't know about it). You might want to check current (Linux) CLVM raid 
level support to see whether it fits your needs. 
 

-- Wendy
