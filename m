From: "USS Chris Callegari" <mazzystr@hotmail.com>
Mime-Version: 1.0
Message-ID: <BAY1-F16Z3xFSu9AwmN00011e0c@hotmail.com>
Subject: [linux-lvm] Re: problem building LVM2 for 2.6 (&2.4)  kernel
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
Date: Wed Aug 27 08:51:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


>>On Fri, Jul 18, 2003 at 05:02:29PM -0400, Robert P. J. Day wrote:
>>2.6.0-test1-ac2 version and selected device mapper and v4 ioctl
>
>>I've not tried this kernel, but assuming it contains BLKGETSIZE64
>>you'll need to compile LVM2 against newer glibc kernel headers
>>(e.g. update the package for your linux distribution or symlink 
>>/usr/include/linux to include/linux in your -ac tree)
>>
>Yes excellent - this worked for me with the 2.4.20 kernel
>ln -sf /usr/src/linux/include/linux /usr/include/linux
>and lvm2 tools will now compile without the "device/dev-io.c:215: 
>`BLKGETSIZE64'"
>error.
>Thanks very much, now back to seeing if LVM2 will help me recover my 2 
>remaining
>LV from a a 4xLV VG.
>
>Melinda :)


i was having the same issue.  linking to the source of a higher kernel 
version didnt work for me.  even worse, the driver for my qlogic qla2340 
isnt supported with higher kernel versions so recompiling is out of the 
question.

i edited the $PATHTOSOURCE/LVM2.2.00.06/lib/device/dev-io.h file.  I placed 
a "begin comment" at line215 and an "end comment" at the end of line219.

the program compiled without a hickup.

take care,
-Chris

_________________________________________________________________
Get MSN 8 and enjoy automatic e-mail virus protection.    
http://join.msn.com/?page=features/virus
