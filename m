Message-ID: <3F9EC8AA.7080603@xs4all.nl>
From: Gert van der Knokke <gertk@xs4all.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Drive gone bad, now what?
References: <20031021171817.GA28462@mail.parplies.de> <3F985B2D.5060008@xs4all.nl> <16280.27367.874758.610758@gargle.gargle.HOWL> <3F98B691.7090902@webhackande.se> <3F9989C9.1070909@xs4all.nl> <16285.12868.20878.180441@gargle.gargle.HOWL> <3F9DB7D8.5080502@xs4all.nl> <20031028081933.GA1629@tykepenguin.com>
In-Reply-To: <20031028081933.GA1629@tykepenguin.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Oct 28 13:52:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Patrick Caulfield wrote:

>>>      
>>>
>>No, what we're looking for is an 'expandable as needed' filesystem and 
>>this is what LVM pretends to be.
>>    
>>
>
>No. LVM does in no way "pretend to be a file system". It's an expandable block
>device. What the filesystem does with that block device is up to it. 
>  
>
Ok, this is a 'slight' mixup between what we need and what LVM provides.

>If a disk fails and you're not using RAID then you restore from backups.
>
>  
>
Where on earth do you backup 300 Gb on ? On tapes ? For the price of a 
tape device including tapes which can handle this amount of data you can 
buy a lot of harddisks...

This is a very common problem nowadays with ultralarge drives becoming 
available dirt cheap but reliability of these drives is to say 'not so good'

We are searching for a way to store large amounts of data reliable and 
affordable on a system running as mass storage/archive for a small group 
of users. Starting point will be around 300 to 400 Gb but in the near 
future 1 Tb (and more...) The users must simply be able to 'store and 
forget' on this system.
Traffic is fairly low but occasionally large amounts have to be 
'restored or copied' to local (smaller) systems to be taken out on the road.

Raid5 is ok for fixed size systems, but a simple mirroring system would 
be the most expandable with various size drives (in pairs ofcourse)
Maybe even two servers at different locations (then upgrading would mean 
buying 4 drives at a time..)

Now we have to find a reliable resizable/expandable filesystem (or 
resizable/expandable block device system) on this hardware.

Gert
