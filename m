Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9EIGVr07475
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 14:16:31 -0400
Received: from ddg.com (mail.ddg.com [66.93.83.131])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9EIGOFi018706
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 14:16:25 -0400
Received: from [192.168.1.7] (account awd HELO [192.168.1.253])
	by ddg.com (CommuniGate Pro SMTP 4.2.4)
	with ESMTP-TLS id 2309614 for linux-lvm@redhat.com;
	Thu, 14 Oct 2004 13:16:23 -0500
Mime-Version: 1.0 (Apple Message framework v619)
In-Reply-To: <BAY17-F41JPv00J6gX2000169b9@hotmail.com>
References: <BAY17-F41JPv00J6gX2000169b9@hotmail.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-7--788502525
Message-Id: <26B6D679-1E0D-11D9-806D-000A9566A350@DDG.com>
From: "Andrew W. Donoho" <awd@DDG.com>
Subject: Re: [linux-lvm] Creating snapshot on / hangs machine
Date: Thu, 14 Oct 2004 13:16:21 -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-7--788502525
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed


On Oct 14, 2004, at 11:31, Kai Leibrandt wrote:
> As soon as I create a snapshot on / however, the machine hangs, 
> although X still works (well, the mouse still moves), it is no longer 
> possible to open a new shell, switch consoles, or even <CTRL>C the 
> lvcreate.
>
> I have tried this with ext2 as well as with xfs, including doing 
> xfs_freeze before taking the snapshot, so I don't think it's a filesys 
> related matter.
>
> Is there anything I am missing here? Is it even supported to do / 
> snapshots?


Kai,

	I reported a similar problem starting with my root partition when I 
added a second drive. After a bit of skullduggery, I believe that LVM 
activities on the root partition particularly stress the memory system. 
Or, at least, when I slowed the memory system down on my x86-64 
machine, I no longer get crashes like you describe above.

	What convinced me that this might be a problem was when I tried 
compiling a kernel to turn on preemptive scheduling and gcc quit about 
halfway through. The build system listed a comment that when gcc quits 
there is probably a memory problem. After I slowed down the memory 
system, I was able to do a continuous "clean and compile" over night 
with a 3.0+ load average. I have not had any other crashes since then.

Andrew

P.S. I just made these changes two days ago. I was just beginning to 
feel comfortable with my newfound stability. I hope this helps you.

____________________________________
Andrew W. Donoho
awd@DDG.com, PGP Key ID: 0x81D0F250
+1 (512) 453-6652 (o), +1 (512) 750-7596 (m)



--Apple-Mail-7--788502525
Content-Transfer-Encoding: 7bit
Content-Type: text/enriched;
	charset=US-ASCII



On Oct 14, 2004, at 11:31, Kai Leibrandt wrote:

<excerpt>As soon as I create a snapshot on / however, the machine
hangs, although X still works (well, the mouse still moves), it is no
longer possible to open a new shell, switch consoles, or even <<CTRL>C
the lvcreate.


I have tried this with ext2 as well as with xfs, including doing
xfs_freeze before taking the snapshot, so I don't think it's a filesys
related matter.


Is there anything I am missing here? Is it even supported to do /
snapshots?

</excerpt>


Kai,


	I reported a similar problem starting with my root partition when I
added a second drive. After a bit of skullduggery, I believe that LVM
activities on the root partition particularly stress the memory
system. Or, at least, when I slowed the memory system down on my
x86-64 machine, I no longer get crashes like you describe above. 


	What convinced me that this might be a problem was when I tried
compiling a kernel to turn on preemptive scheduling and gcc quit about
halfway through. The build system listed a comment that when gcc quits
there is probably a memory problem. After I slowed down the memory
system, I was able to do a continuous "clean and compile" over night
with a 3.0+ load average. I have not had any other crashes since then.


Andrew


P.S. I just made these changes two days ago. I was just beginning to
feel comfortable with my newfound stability. I hope this helps you.


<fontfamily><param>Helvetica</param>____________________________________

Andrew W. Donoho

awd@DDG.com, PGP Key ID: 0x81D0F250

+1 (512) 453-6652 (o), +1 (512) 750-7596 (m)


</fontfamily>


--Apple-Mail-7--788502525--
