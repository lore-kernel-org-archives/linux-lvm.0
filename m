From: lembark@wrkhors.com
Subject: Re: [linux-lvm] why do striping and mirroring in LVM?
Message-ID: <22100000.1025145872@duke>
In-Reply-To: <OF3B31F066.8A4165E6-ON48256BE5.000AAA65@legend.com.cn>
References: <OF3B31F066.8A4165E6-ON48256BE5.000AAA65@legend.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Wed Jun 26 21:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


-- lilha@legend.com.cn on 06/27/02 10:35:18 +0800

> 
> 
> i know that lvm support striping now and LVM2 will support mirroring
> directly later this year.
> but i'm puzzled that why lvm do that?
> 
> i think the main Goals of LVM are
>      1.Implement a very flexible virtual disk subsystem to handle disk
> storage.
>      2.Online allocation and relocation of storage.
>      3.Online extension and reduction of storage.
> And disk redundancy is the goals of  hardware. or software.RAID.
> 
> i think software.RAID+LVM is good idea,and that's enough.
> why LVM focus on the striping and mirroring?
> i don't think it's a good idea to do a big and full software.
> 

RAID is about fault tolerance. Striping is a performance
issue. Mirroring on LVM or via RAID is about fault tolerance
and maybe performance. 

So... For blind speed you probably want striping, but risk
blowing everyting if any one disk fails. Fix is to use some
sort of RAID/Mirroring to deal with the failures.

You might also want the fault tolerance just for the sake of
not loosing important information if one drive croaks. If 
you are already using LVM and don't want to go through the 
hassle of setting up sorftware RAID (and don't have a few
hundred dollars availble for hardware) then mirroring in LVM
is a nice, clean way to protect yourself using tools you 
already have (and know how to use)(and know how to configure)
(and know how install)(and know how to compile).

Depending on how it's implemented, LVM mirroring can also be
a performance enhancment. For example, HP's LVM system
alternates between the mirrors for writes, allowing the other
drive to catch up. On heavily used systems this will usually
help I/O performance by alternating the load -- it ends up
looking like a form of striping.

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
