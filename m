Message-ID: <3BA12894.8080301@st-peter.stw.uni-erlangen.de>
Date: Thu, 13 Sep 2001 23:43:48 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPKEELDNAA.stuart@bh90210.net>
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

Hi
it should be working regarding the tools you are using
can you send the error message
and try
ls /lib/modules
it should give you list of kernel versions you have installed
my case
ls /lib/modules
2.4.10-pre4-xfs 2.4.9-ac7 .....
and lvmcreate_initrd -nomod 2.4.10-pre4-xfs


i'm using linux-2.4.10-pre4-xfs and linux-2.4.9-ac7 with lvm-1.0.1 cvs 
version
but it should be working also with the old tools

and there is no problem with the mandrake kernel and the new version of lvm

IT3 Stuart B. Tener, USNR-R wrote:

>Svetljo:
>
>	It does not work. It gives me some funky messages when I try it. However, I must point out I am using LVM V 0.9.2-whatever. Are you using a new version? I have been told that the newer 1.0.1 version does not or will not work properly with Mandrake for some reason of their policy about versions or something, got me.
>
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
>Thursday, September 13, 2001 1:29 PM
>
>-----Original Message-----
>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of svetljo
>Sent: Thursday, September 13, 2001 10:04 AM
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] LVM
>
>Hi
>it should be
>
>lvmcreate_initrd --nomod 2.4.8-12mdk
>and it should create /boot/initrd-lvm-2.4.8-12mdk.gz -- the lvm-initrd
>
>IT3 Stuart B. Tener, USNR-R wrote:
>
>>Mr. Edgecombe:
>>
>>      Ah, I understand. Yes, I am trying to LVMize my root partition.
>>
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
>>Thursday, September 13, 2001 9:49 AM
>>
>>-----Original Message-----
>>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of Jason Edgecombe
>>Sent: Thursday, September 13, 2001 6:01 AM
>>To: linux-lvm@sistina.com
>>Subject: Re: [linux-lvm] LVM
>>
>>you MUST run lvmcreate_initrd and use the initrd it creates if you run
>>an LVM root fs.
>>
>>It doesn't matter if LVM is in the kernel or as a module. If your root
>>is not in LVM, then I don't think that you have to use initrd.
>>
>>Sincerely,
>>Jason Edgecombe
>>
>>
>>"IT3 Stuart B. Tener, USNR-R" wrote:
>>
>>>       So for LVM, you do need to use the lvmcreate_initrd program or not? I am still not clear on that.
>>>
>>>       If I need to make an lvmcreate_initrd, does not that mean it cannot be in the kernel?
>>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
>
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
