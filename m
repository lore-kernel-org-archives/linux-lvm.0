Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8C7rag8029991
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 03:53:37 -0400
Received: from www.bettercgi.com ([74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8C7rWCd011220
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 03:53:32 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id DC5942146F
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 02:32:01 -0500 (CDT)
Date: Mon, 12 Sep 2011 02:33:45 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110912023345.476db018@bettercgi.com>
In-Reply-To: <4E6D5600.4060008@tlinx.org>
References: <4E6D5600.4060008@tlinx.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] more vg problems or oddities...not using dmsetup
 remove seems to be bad?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

>> tried to remove an unmounted active snapshot.
>> 
>> lvremove said it wouldn't remove an active snapshot.
>> 
>> Tried -an -- can't change active snapshot.

> Use lvremove -f 

What's directly in the LV? A partition perhaps? A raid block?
If it says that it can't be removed because it's in active use,
busy, it's probably telling you the truth. I've had this happen 
a couple of times. In one case, it held a virtual machine with 
a partition I had mapped using kpartx, so I had to use kpartx
to unmap that partition. I think the other time the LV was itself
a PV, or else it was shared using gnbd.

--force means, in my opinion at least, "Yes, I know what I'm doing.
I understand why the system is saying I better not do this, but
I want to force it to happen anyway". When it's used to mean "I don't 
understand what's going on, I don't know why this is a bad idea, 
but do it anyway", that sounds to me like a recipe for problems.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Sun, 11 Sep 2011 17:44:48 -0700
"Linda A. Walsh" <lvm@tlinx.org> wrote:

> 
> 
> tried to remove an unmounted active snapshot.
> 
> lvremove said it wouldn't remove an active snapshot.
> 
> Tried -an -- can't change active snapshot.
> 
> 
> Tried turning off monitoring --monitor -n
> It gave no message
> tried removing again...can't remove active snap
> 
> tried --ignoremonitoring
> 
> no message but still can't remove
> 
> tried -- merging it...
> 
> Said it couldn't merge with open origin,
> then merging with origin on next activation...
> 
> Now still can't remove, but says "
>   Can't remove merging snapshot logical volume
> "Home-2011.09.03-00.28.36" ...
> 
> decided to try dmsetup remove --
> 
> it couldn't remove it either -- resource/device busy...
> 
> So now I'm concerned...is it going to try to merge back any changes
> it recorded by reversing them?
> 
> i.e. put the original volume back the way it was when the snapshot
> started?
> 
> Says it couldn't do it on open volume -- does that mean it won't
> start this until I reboot,
> then it will take a long time to become active?
> 
> seems like the dmsetup remove of the parts was the safest way to
> kill off an active snapshot...but this feels contorted.
> 
> I'm wondering if I really want this 'merge' it wants to do...and if
> not, how do I abort
> it?
> 
> Thanks!
> 
> (hoping system stays up until I get this sorted out!)...
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
