Message-ID: <3BA2B7B2.9090105@st-peter.stw.uni-erlangen.de>
Date: Sat, 15 Sep 2001 04:06:42 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Lock Patch
References: <NBBBJHKIOKPKOGOEPEDPGEFMDNAA.stuart@bh90210.net>
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

well it's suposed to be known,
almost every program( or every exept the comercial) for linux goes this way
./configure make make install , and when you are instaling binaries from 
rpm they are configured for the most common PC and then compiled with " 
make " installing the rpm = make install
and smth of the kind should be mentioned somewhere , probably in README 
or INSTALL in the lvm dir
 
IT3 Stuart B. Tener, USNR-R wrote:

>Svetljo:
>
>	Ah, that is wonderful to hear. Is there some reason why this is not noted in the How-To? Can we amend the How-To in order to document this information for first time implementers of this product?
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
>Friday, September 14, 2001 5:23 PM
>
>-----Original Message-----
>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of svetljo
>Sent: Friday, September 14, 2001 3:13 PM
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] Lock Patch
>
>i've forgoten
>
>>you saying that typing, "make" in the "PATCHES" directory will cause a patch to be generated specifically for my kernel?
>>
>thats actually the work of ./configure it trys to find out what you
>have, and what you need
>in PATCHES it chooses from all the patches the ones your kernel need ,
>and " make " put them together in one patch for your kernel
>
>>What name will it be given?
>>       The documentation says to add a dash dash kernel-dir= or something or other after the "./configure" command, are you saying it is better to use "./configure" absent that appended statement?
>>        Where do I untar the LVM source? Does it matter where I do so? May I do it in /tmp?
>>
>1
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
