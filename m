Received: from [192.168.1.104] (vpn-13-177.rdu.redhat.com [10.11.13.177])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m8TESQIn006441
	for <linux-lvm@redhat.com>; Mon, 29 Sep 2008 10:28:27 -0400
Message-Id: <620D4470-458A-4FD4-B79E-AFF17E1852B1@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <521877a70809260729y58a40b09re99fae1282714149@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] mirror legs order and priority (2)
Date: Mon, 29 Sep 2008 09:28:09 -0500
References: <521877a70809260729y58a40b09re99fae1282714149@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

When you 'down-convert' a mirror, you should be able to specify which  
leg you want pulled.

# Change 2-way mirror to linear - specifying the device to be removed
prompt> lvconvert -m0 vg/lv /dev/sdb

  brassow

On Sep 26, 2008, at 9:29 AM, daniele wrote:

> Greetings everyone,
> I have recently changed one of the mirrored-legs-hard-drives and  
> substituted it with a faster, bigger HD.
> Now does it matter which leg is the first one?
> I mean the home_mimage_0, right now is not on the fastest, and  
> newer(thus more reliable), hard drive. Does it matter? If so, is  
> there a way to quick switch it?
> Anyway when I added the new HD to the mirror-legs, the first leg was  
> chosen to be on an old disk regardless of the order in which I  
> provided "/dev/mirror_disk1   /dev/mirror_disk2   /dev/mirror_log"  
> to lvcovert -m1.
> Also when I do lvconvert a mirrored LV to an m0 linear one, how can  
> I choose which of the legs has to become the linear LV? So far it  
> seems that with "lvconvert -m0 vg00/home" the 'first' leg, is  
> automatically chosen to be the one(which is home_mimage_0). (That  
> might not be what one wants at times, and pvmoving the linear LV  
> after the lvconversion would be really a waste of resources and disk  
> efforts).
>
> Thanks for any help or info on all this,
> Best regards, Daniele.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
