From: Stefan Weigel <sw@global-linxs.de>
Message-ID: <7937632.20021020161850@global-linxs.de>
Subject: Re[2]: [linux-lvm] Re: problem with lvm on root-fs
In-Reply-To: <20021020103456.GC26167@percy.comedia.it>
References: <200210170859.03682.sw@global-linxs.de>
 <20021018095829.GA687@percy.comedia.it> <200210181241.28210.sw@global-linxs.de>
 <200210181505.11782.sw@global-linxs.de>
 <20021020103456.GC26167@percy.comedia.it>
MIME-Version: 1.0
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
Date: Sun Oct 20 09:20:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Luca Berra <linux-lvm@sistina.com>

Sunday, October 20, 2002, 12:34:57 PM, you wrote:

LB> On Fri, Oct 18, 2002 at 03:05:11PM +0200, Stefan Weigel wrote:
>>Hi Luca!
>>I should be happy now but there's still a problem left. First: now I can boot 
>>from my lvm-root-fs (yeeehhaaa). My problem: one line in /etc/lilo.conf 
>>(ramdisk=16384 instead of ramdisk=8192).
>>But if I now want to run lilo I get this message:
>>
>>Fatal: Sorry, dont know how to handle device 0x3a05
>>
LB> this could be caused by an old lilo version.

LB> LVM support was added to mainstream lilo in version 22.

LB> upgrade to latest version from
LB> ftp://metalab.unc.edu/pub/Linux/system/boot/lilo

LB> L.


Yes, this could be the problem. But on the other hand it's a SuSE
Linux Enterprise version. And SuSE is very common with LVM. So I will
be very surprised if their packages wouldn't work together. But I will
give this a try..I will report if this problem is caused by an old
lilo version.

best regards

Stefan

-- 

__________________________________________

 stefan weigel
 administration

 global linxs gmbh
 knowledge interaction
 romanstrasse 16
 80639 munich - germany
 www.global-linxs.com

 tel.: +49(0)89. 189 336- 61
 fax.: +49(0)89. 189 336- 99
 email: sw@global-linxs.com

__________________________________________
