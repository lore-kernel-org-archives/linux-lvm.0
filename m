Subject: Re: [linux-lvm] why do striping and mirroring in LVM?
Message-ID: <1025158759.3d1aae67de168@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
References: <OF3B31F066.8A4165E6-ON48256BE5.000AAA65@legend.com.cn>
In-Reply-To: <OF3B31F066.8A4165E6-ON48256BE5.000AAA65@legend.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Thu Jun 27 01:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Quoting lilha@legend.com.cn:

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
it's a good idea cause LVM doesn't support mirroring and is not that good at
stripping, and it would be very good if one could use the featchers without
needing other layer ( soft RAID)
> why LVM focus on the striping and mirroring?
i think every other implementation supports them
> i don't think it's a good idea to do a big and full software.
> 
> there are any reasons and advantages to use striping or mirroring LVM
> than
> software.RAID+LVM ?
useing LVM over soft RAID adds extra overhead,  is more CPU intensive

> i think the reason is LVM it does not matter where the disks are at
> all.
> We can do the same with two big external storage towers, not just with
> two
> disks.
> 
> but i think this reason is not enough, can anyone give me some support?
> and how many people use striping or mirroring LVM��not
> software.RAID+LVM��
> 
> 
> TIA for your help and sorry for my poor English.
> 
> 
