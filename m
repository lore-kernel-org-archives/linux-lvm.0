Message-ID: <3BA0B638.3030508@st-peter.stw.uni-erlangen.de>
Date: Thu, 13 Sep 2001 15:35:52 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPAEEJDNAA.stuart@bh90210.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


IT3 Stuart B. Tener, USNR-R wrote:

>Svetljo:
>
>	So for LVM, you do need to use the lvmcreate_initrd program or not? I am still not clear on that.
>
>	If I need to make an lvmcreate_initrd, does not that mean it cannot be in the kernel?
>
there is no trouble if you compile in FS and LVM and so on
but you need lvmcreate_initrd vor creating the ramdisk which contain the 
binaries needed to activate the VG's
you can use lvmcreate_initrd --nomod [ your kernel ] to create the 
initrd without modules

>
>Very Respectfully, 
>
>Stuart Blake Tener, IT3, USNR-R, N3GWG 
>Beverly Hills, California
>VTU 1904G (Volunteer Training Unit) 
>stuart@bh90210.net 
>west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043 
>east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859 
>
>Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's free!) 
>
>JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL. 
>
>Thursday, September 13, 2001 3:20 AM
>
>-----Original Message-----
>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of svetljo
>Sent: Thursday, September 13, 2001 12:49 AM
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] LVM
>
>>
>>LVM Listmembers:
>>
>>      The how-to is not clear on certain issues:
>>
>>(a) should ReiserFS support be compiled into the kernel or be a module?
>>(b) Should LVM support be compiled into the kernel or be a module?
>>(c) If you use LVM support as a module or in the kernel how does this effect the need or configuration of the initrd?
>>
>it's better to have them compiled in ,
>
>>Someone told me I don't need initrd, if its built in the kernel, no?
>>
>it's not needed for software RAID, IBM's EVMS (still alpha status) and
>is on the to-do list of lvm
>( i have read this in the previous messages)
>but as of today you need initrd for the binaries for activating the VG's
>and LV's
>
>>
>>Very Respectfully,
>>
>>Stuart Blake Tener, IT3, USNR-R, N3GWG
>>Beverly Hills, California
>>VTU 1904G (Volunteer Training Unit)
>>stuart@bh90210.net
>>west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043
>>east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859
>>
>>Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's free!)
>>
>>JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.
>>
>>Wednesday, September 12, 2001 4:26 PM
>>
>>-----Original Message-----
>>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of Andreas Dilger
>>Sent: Wednesday, September 12, 2001 4:21 PM
>>To: linux-lvm@sistina.com
>>Subject: Re: [linux-lvm] LVM
>>
>>On Sep 12, 2001  15:41 -0700, IT3 Stuart B. Tener, USNR-R wrote:
>>
>>>     I am curious what version of lilo in fact supports ReiserFS tails. I am running Mandrake 8.0, and using the lilo supplied therewith, and have been booting a / partition as ReiserFS (with tails I believe, how do I check?).
>>>
>>At least version 21.6+ support reiserfs tails (maybe earlier, I don't know).
>>You should be able to verify with "strings /sbin/lilo | grep -i reiserfs".
>>What it does is unpack the tail on any kernel/initrd files so that LILO
>>can map the blocks directly.  In a way, it is strange that this is needed,
>>since I thought tails only applied to files < 64kB or similar...
>>
>>Cheers, Andreas
>>--
>>Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>>                \  would they cancel out, leaving him still hungry?"
>>http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>
