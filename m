Message-ID: <3CFBBB09.9070703@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: linux-lvm digest, Vol 1 #602 - 14 msgs
References: <3CFB7E61.1848.B19791A@localhost>
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
Date: Mon Jun  3 13:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com, ByrneJB@Harte-Lyne.ca

bash> cat /proc/lvm/VGs/data/LVs/develop


name:         /dev/data/develop
size:         20971520
access:       3
status:       1
number:       3
open:         1
allocation:   2
device:       58:03

(My VG is data, my LV is develop), the last line has the device number on it.


The other place to look is:

bash> ls -la /dev/data/develop

brw-rw----    1 root     disk      58,   3 Apr 12 17:56 develop

58,3 is (major, minor).  The trick is figuring out which ones are decimal, and 
which ones are hex.  I believe the ls -la are decimal, but when you put it in 
for root= it has to be in hex.

In this case, I believe 58 is the major, and 3 is the minor.
(I could be completely wrong on that decimal/hex thing, I just remember that 
being an issue for me in the past when looking at root= on the command line once 
in the past).

Ahhh, looking a bit more:

bash> stat /dev/data/develop

   File: "/dev/data/develop"
   Size: 0               Blocks: 0          IO Block: 4096   Block Device
Device: 309h/777d       Inode: 16521       Links: 1     Device type: 3a,3
Access: (0660/brw-rw----)  Uid: (    0/    root)   Gid: (    6/    disk)
Access: Fri Apr 12 17:56:53 2002
Modify: Fri Apr 12 17:56:53 2002
Change: Fri Apr 12 17:56:53 2002

Which would confirm that root= must be in hex, 3a (hex) = 58 (decimal).  It has 
to be 4 digits long so in this case it would be "root=3a03".  The Device Type: 
is where the 3a03 comes from...

	Hope this helps.


		Kirby


James B. Byrne wrote:
> On Thu, 30 May 2002 19:45:33 +0200
> Thierry DE CARVALHO <thierry.decarvalho@online.fr> wrote:
> 
> 
>>Try with grub (here /dev/vg00/lvol1 is the root fs):
>>
>>title=GNU/Linux Debian 2.2 (potato)
>>kernel (hd0,1)/vmlinuz-2.2.19 root=3a00 ramdisk_size=8192 vga=10
>>#                                   ^^^^ <major><minor> of the lv
>>#                                   device
>>in hex
>>initrd (hd0,1)/initrd-lvm-2.2.19.gz
> 
> 
> I am afraid that this does not make a lot of sense to me.  Where 
> does one get the major/minor numbers for the logical volume?
> 
> Regards,
> Jim
> ---     e-mail is NOT a secure channel 
> James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
> Harte & Lyne Limited          http://www.harte-lyne.ca
> 9 Brockley Drive              vox: +1 905 561 1241
> Hamilton, Ontario             fax: +1 905 561 0757
> Canada  L8E 3C3
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
