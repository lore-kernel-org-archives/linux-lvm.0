Message-ID: <3BA27F3F.7050400@st-peter.stw.uni-erlangen.de>
Date: Sat, 15 Sep 2001 00:05:51 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Lock Patch
References: <NBBBJHKIOKPKOGOEPEDPCEFKDNAA.stuart@bh90210.net>
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
content-type: text/plain; format="flowed"
To: linux-lvm@sistina.com

Hi

IT3 Stuart B. Tener, USNR-R wrote:

>Svetljo:
>
>        Are you saying that typing, "make" in the "PATCHES" directory will cause a patch to be generated specifically for my kernel? What name will it be given?
>
thats right ,in case you don't use  ./configure --kernel-dir it will use 
/usr/src/linux wich is a symbolik link to our kernel

 linux-2.4.8
it will name it lvm-1.0.1-rc2" here comes our kernel version".patch
it's the same as the one mentioned in the /usr/src/linux/Makefile in our 
case /usr/src/linux-2.4.8/Makefile
so  it's lvm-1.0.1-rc2-linux-2.4.8-12mdk.patch
but you have first run ./configure in the previous dir, then chdir to 
PATCHES ,and "make " should make the patch

>The documentation says to add a dash dash kernel-dir= or something or other after the "./configure" command, are you saying it is better to use "./configure" absent that appended statement?
>         Where do I untar the LVM source? Does it matter where I do so? May I do it in /tmp?
>
no it doesn't metter, you can put it where ever you wont,
in case your /tmp is not cleaned @ every reboot no problems , but it's 
probably a very good idea not to delete it 

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
>Friday, September 14, 2001 2:10 PM
>
>-----Original Message-----
>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of svetljo
>Sent: Friday, September 14, 2001 11:18 AM
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] Lock Patch
>
>Hi
>thats in case we are tolking about linux-2.4.1-VFS-lock.patch,
>linux-2.4.2-VFS-lock.patch, linux-2.4.4-VFS-lock.patch
>and linux-2.4.9-VFS-lock.patch which are in LVM/1.0x/PATCHES
>
>there is no such speciefic patch , you should create it yourself
>have you folowed what i told you, you should then have it
>
>from the beginig
>untar the lvm-code lvm-1.0.1-rc2.tar.bz2: tar xjvf lvm-1.0.1-rc2.tar.bz2
>you have now directory LVM and in it 1.0.1-rc2
>cd LVM/1.0.1-rc2
>configure the sources for your system: ./configure
>go to PATCHES and prepare the patch for your kernel: make
>you should have now the patch for your kernel
>apply the patch
>
>recompile the kernel or modules
>and compile the tools - go back to LVM/1.0.1-rc2 and type make
>and then install them : make install
>
>
>IT3 Stuart B. Tener, USNR-R wrote:
>
>>Svetljo:
>>
>>      Where does one get the patch you refer to? Can you provide a link for it?
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
>>Friday, September 14, 2001 9:26 AM
>>
>>-----Original Message-----
>>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of svetljo
>>Sent: Friday, September 14, 2001 4:55 AM
>>To: linux-lvm@sistina.com
>>Subject: Re: [linux-lvm] Lock Patch
>>
>>one question
>>are we talking about LVM/PATCHES/linux-2.4.x-VFS-lock-patch
>>if thats so i don't think it's that good idea to try  both patches
>>
>>simply run  $LVM_ROOT./configure ; cd PATCHES ; make ; and aply the patch
>>
>>linux-lvm-1.0.1rc2-2.4.8-12mdk.mdk
>>
>>but in case we are not tolking about this patch
>>what are we talking about , which lock.patch
>>
>>
>>Heinz J . Mauelshagen wrote:
>>
>>>Stuart,
>>>
>>>Patrick gave you a helpfull hint, so there's no reason for your rude reaction.
>>>Doing what he recommended is a matter of little time as well.
>>>
>>>Ask the Mandrake LVM maintainer if that's more preferable for you.
>>>
>>>Regards,
>>>Heinz    -- The LVM Guy --
>>>
>>>On Fri, Sep 14, 2001 at 04:10:08AM -0700, IT3 Stuart B. Tener, USNR-R wrote:
>>>
>>>>Mr. Caulfield:
>>>>
>>>>    Well thank you for that most helpful suggestion, but silly me, I consider my time more valuable. I shall wait for someone to post a proper answer, rather than one, which is both obvious and inefficient.
>>>>
>>>>
>>>>Very Respectfully,
>>>>
>>>>Stuart Blake Tener, IT3, USNR-R, N3GWG
>>>>Beverly Hills, California
>>>>VTU 1904G (Volunteer Training Unit)
>>>>stuart@bh90210.net
>>>>west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043
>>>>east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859
>>>>
>>>>Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's free!)
>>>>
>>>>JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.
>>>>
>>>>Friday, September 14, 2001 4:05 AM
>>>>
>>>>-----Original Message-----
>>>>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of Patrick Caulfield
>>>>Sent: Friday, September 14, 2001 1:55 AM
>>>>To: linux-lvm@sistina.com
>>>>Subject: Re: [linux-lvm] Lock Patch
>>>>
>>>>On Thu, Sep 13, 2001 at 11:00:47PM -0700, IT3 Stuart B. Tener, USNR-R wrote:
>>>>
>>>>>List members:
>>>>>
>>>>>    I am curious; if I am running 2.4.8-12mdk (Mandrake 8,0), which lock patch do I use the 2.4.4 version or the 2.4.9 version?
>>>>>
>>>>>
>>>>I would try the 2.4.4 one. If that doesn't apply then try the 2.4.9.
>>>>
>>>>patrick
>>>>
>>>>
>>>>_______________________________________________
>>>>linux-lvm mailing list
>>>>linux-lvm@sistina.com
>>>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>>>?????????????????????????????????????{??[?????x%??e?{??[?????)???&??i?????l????)???&?f??f??X??)???b??????y?m???0s??3??m????
>>>>
>>??+-?v?r?????=?-??h??????
>>
>>>*** Software bugs are stupid.
>>>  Nevertheless it needs not so stupid people to solve them ***
>>>
>>>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>>>
>>>Heinz Mauelshagen                                 Sistina Software Inc.
>>>Senior Consultant/Developer                       Am Sonnenhang 11
>>>                                                56242 Marienrachdorf
>>>                                                Germany
>>>Mauelshagen@Sistina.com                           +49 2626 141200
>>>                                                     FAX 924446
>>>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>>>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@sistina.com
>>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>>
>>
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
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
