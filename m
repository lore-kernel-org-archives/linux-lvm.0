Message-ID: <3BA70838.8060902@st-peter.stw.uni-erlangen.de>
Date: Tue, 18 Sep 2001 10:39:20 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RAWIO Patch with 2.4?
References: <NBBBJHKIOKPKOGOEPEDPOEGKDNAA.stuart@bh90210.net>
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

http://lists.sistina.com/mailman/listinfo/linux-lvm
on the bottom there is a part for subscribers

go edit your profile

IT3 Stuart B. Tener, USNR-R wrote:

>List members:
>
>	How do I leave the mailing list and unsubscribe?
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
>Tuesday, September 18, 2001 1:28 AM
>
>-----Original Message-----
>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of Patrick Caulfield
>Sent: Tuesday, September 18, 2001 12:53 AM
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] RAWIO Patch with 2.4?
>
>On Mon, Sep 17, 2001 at 04:51:11PM -0500, Brian Bailey wrote:
>
>>When attempting to run make to create the 1.0 patch for my server, I
>>continually receive the message that I haven't applied the rawio patch.
>>However, this is a 2.4.3-6 kernel via Redhat 7.1.  My understanding is
>>rawio is built-in to the kernel post-2.4.
>>
>>In a failed attempt, I actually applied the patch and was still
>>unsuccessful.  Any suggestions?
>>
>
>I would guess that the configure script didn't find your kernel correctly and
>thinks you still have 2.2. Make sure you point it at the right sources using
>eg:
>
>./configure --with-kernel_dir=/usr/src/mykernel
>
>(watch for the hyphen and underscore!)
>
>Then re-run make in the PATCHES directory.
>
>You can check that configure has found the right kernel by examining the
>Makefile in the PATCHES directory - it should have the following three variables
>set:
>
>KERNEL_DIR=
>LVM_VERSION=
>KERNEL_VERSION=
>
>patrick
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
