Message-ID: <3B9E2A5D.4010208@st-peter.stw.uni-erlangen.de>
Date: Tue, 11 Sep 2001 17:14:37 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPOEDKDNAA.stuart@bh90210.net> <3B9DFDC5.1020306@st-peter.stw.uni-erlangen.de> <20010911161654.C20767@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

does this mean that when you are creating PV's VG's LV's could be created
 with some option in the old format
or we have to use pvversion from lvm-1.0 to convert the PV's to the old 
version
is it neccesary to convert the VG's and LV's and are there any tools
doesn't lvm-1.0.1rc2 defaults to the new version when you create PV's 
VG's LV's

the question is
can we access VG's and LV's created with lvm-1.0.1rc2 with vanila kernel 
with lvm-0.9.1beta2
Heinz J . Mauelshagen wrote:

>Well,
>
>LVM 1.0.1-rc2 supports the old ondisk format and you can get it from
>ftp.sistina.com.
>
>Regards,
>Heinz    -- The LVM Guy --
>
>
>On Tue, Sep 11, 2001 at 02:04:21PM +0200, svetljo wrote:
>
>>Hi
>>
>>>I am using version 2.4.8-12mdk (mandrake) of the kernel. Mandrake 8.1 is going to be coming soon, and when it does come forth, I plan to upgrade. Having LVM running will make the upgrade much less painful!
>>>
>>I think you can have troubles with upgrading to MDK-8.1 if you use 
>> lvm-1.0.1 or anything after lvm-0.91beta8
>>as far i know they are still using  the integrated in the kernel 
>>lvm-0.91beta2 and they don't wont to upgrade to lvm-1.0 or 1.0.1  so 
>>when you boot from the CD the kernel will not  see the exiting logical 
>>volumes
>>but i think i have read somewhere that lvm-1.0.1 supports both the old 
>>and new phisical volumes
>>
>>my advice befor copying anything to the LV ( i mean all the partitions 
>>you mean to upgrade : / , /usr  ...
>>go through all the documentation and man pages and try to find out 
>>whether it's posible to create VG and LV's in the old format ( pre 
>>lvm-0.9.1beta8) but i think it's not possible
>>
>>or wait until MDK-8.1 come and then install lvm-1.0.1 
>>
>>>	As we speak, I am downloading this file. But, can you tell me, are there any major caveats to using this version in the link below?
>>>
>>>
>>>Very Respectfully, 
>>>
>>>Stuart Blake Tener, IT3, USNR-R, N3GWG 
>>>Beverly Hills, California
>>>VTU 1904G (Volunteer Training Unit) 
>>>stuart@bh90210.net 
>>>west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043 
>>>east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859 
>>>
>>>Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's free!) 
>>>
>>>JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL. 
>>>
>>>Tuesday, September 11, 2001 4:00 AM
>>>
>>>-----Original Message-----
>>>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of Jos� Luis Domingo L�pez
>>>Sent: Tuesday, September 11, 2001 5:20 AM
>>>To: linux-lvm@sistina.com
>>>Subject: Re: [linux-lvm] LVM
>>>
>>>On Monday, 10 September 2001, at 19:35:13 -0700,
>>>IT3 Stuart B. Tener, USNR-R wrote:
>>>
>>>>Dear Sir:
>>>>
>>>>     I HAVE READ (and DID READ) PRIOR TO ASKING MY QUESTIONS, (when I noted I downloaded it, I figured everyone would realize I had read it as well!).
>>>>
>>>>All those whom are telling me to read the How-To, PLEASE, GO READ IT YOURSELF! SPECIFICALLY: section 7.2, paragraph 2. There is no such directory located on the Sistina FTP server. Where is this patch?
>>>>
>>>Your are right, links on the HOWTO don't point to the right location. To
>>>get current sources of LVM download:
>>>ftp://ftp.sistina.com/pub/LVM/1.0/lvm_1.0.1-rc2.tar.gz
>>>
>>>It works for recent kernels (even 2.4.9) and the documentation included
>>>explains how to create a patch specifically suited for your current Linux
>>>source tree.
>>>
>>>--
>>>Jos� Luis Domingo L�pez
>>>Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
>>>
>>>jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
>>>jdomingo AT internautas DOT   org  => Spam at your own risk
>>>
>>>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@sistina.com
>>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>>
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
>
>*** Software bugs are stupid.
>    Nevertheless it needs not so stupid people to solve them ***
>
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>Heinz Mauelshagen                                 Sistina Software Inc.
>Senior Consultant/Developer                       Am Sonnenhang 11
>                                                  56242 Marienrachdorf
>                                                  Germany
>Mauelshagen@Sistina.com                           +49 2626 141200
>                                                       FAX 924446
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
