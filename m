Message-ID: <3BA0E6E9.6070108@st-peter.stw.uni-erlangen.de>
Date: Thu, 13 Sep 2001 19:03:37 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPEEELDNAA.stuart@bh90210.net>
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
it should be

lvmcreate_initrd --nomod 2.4.8-12mdk
and it should create /boot/initrd-lvm-2.4.8-12mdk.gz -- the lvm-initrd

IT3 Stuart B. Tener, USNR-R wrote:

>Mr. Edgecombe:
>
>	Ah, I understand. Yes, I am trying to LVMize my root partition.
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
>Thursday, September 13, 2001 9:49 AM
>
>-----Original Message-----
>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of Jason Edgecombe
>Sent: Thursday, September 13, 2001 6:01 AM
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] LVM
>
>you MUST run lvmcreate_initrd and use the initrd it creates if you run
>an LVM root fs.
>
>It doesn't matter if LVM is in the kernel or as a module. If your root
>is not in LVM, then I don't think that you have to use initrd.
>
>Sincerely,
>Jason Edgecombe
>
>
>"IT3 Stuart B. Tener, USNR-R" wrote:
>
>>        So for LVM, you do need to use the lvmcreate_initrd program or not? I am still not clear on that.
>>
>>        If I need to make an lvmcreate_initrd, does not that mean it cannot be in the kernel?
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
