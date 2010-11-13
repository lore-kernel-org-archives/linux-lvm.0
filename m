Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oADNMsEE017172
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 18:22:54 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oADNMf87029921
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 18:22:42 -0500
Date: Sat, 13 Nov 2010 17:22:38 -0600
From: Ray Morris <support@bettercgi.com>
References: <AANLkTimiX+2WZw5V8P0HjPvEXP6TAerJmFHq63Ktg2fD@mail.gmail.com>
In-Reply-To: <AANLkTimiX+2WZw5V8P0HjPvEXP6TAerJmFHq63Ktg2fD@mail.gmail.com>
	(from swestrup@gmail.com on Sat Nov 13 15:45:36 2010)
Message-Id: <1289690558.17929.36@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Need help with a particular use-case for pvmove.
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: swestrup@gmail.com, LVM general discussion and development <linux-lvm@redhat.com>

> However pvmove tells me that I cannot do this with a missing drive. I
> can't figure out why this should be. Logically I shouldn't need access
> to the volume groups or logical volumes
...
> All I want to do is move physical extents from one physical volume to
> another. Both of those volumes are present and accessible. Why should
> uninvolved missing volumes be an issue, and is there any way around
> it?

   All of the PVs in a VG have a copy of the metadata that you are  
wanting
to change, the description of which extent is stored where.  If you  
chnage
it while some PVs are missing, there will then be two inconsistent  
versions
of the metadata for VG, with diffeent PVs disagreeing on where the  
extents
are.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 11/13/2010 03:45:36 PM, Stirling Westrup wrote:
> I have a 4-slot storage array with all slots filled and each of the
> four drives having a single LVM2 partition. These pv's are all
> collected together into a single volume group called 'Storage' and
> containing a single logical volume called 'Data'. This setup has been
> working fine until now, but I've almost run out of storage on the
> array. Plus, one of the drives is showing signs of imminent failure,
> and I'd like to replace it without data loss.
> 
> I got a new 2T drive to replace the near-failure 1T drive and thought
> that I could just unplug one of the good 1T drives, plug in the new 2T
> drive and do a 'pvmove' from the failing drive to the new drive. I
> don't have any way to plug all 5 drives in at once, as my server is
> PATA and my only SATA slots are in the array.
> 
> However pvmove tells me that I cannot do this with a missing drive. I
> can't figure out why this should be. Logically I shouldn't need access
> to the volume groups or logical volumes if I'm not starting the
> drive-mapper or mounting the filesystem built in the logical volume.
> I'm only using LVM because I thought it would give me the ability to
> swap out drives in just the way I am now trying.
> 
> All I want to do is move physical extents from one physical volume to
> another. Both of those volumes are present and accessible. Why should
> uninvolved missing volumes be an issue, and is there any way around
> it?  pmmove suggests running "vgreduce --removemissing" but the
> documentation for vgreduce seems to say that I'd need to 1) use
> --force and 2) it would likely result in data loss.
> 
> Is there anything I can do, short of borrowing another storage array
> somewhere, just so I can have an extra slot to do this move? My other
> option is to put the new drive into a USB case, but the server only
> supports USB1, so moving a terrabyte will take over a week.
> 
> Any help would be appreciated, thanks.
> --
> Stirling Westrup
> Programmer, Entrepreneur.
> https://www.linkedin.com/e/fpf/77228
> http://www.linkedin.com/in/swestrup
> http://technaut.livejournal.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
