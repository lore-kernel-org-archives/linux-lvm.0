From: "James B. Byrne " <ByrneJB@Harte-Lyne.ca>
MIME-Version: 1.0
Message-ID: <3CFB90AB.26047.B60EA5E@localhost>
In-reply-to: <3CFBBB09.9070703@birddog.com>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Re: Red Hat 7.3 lvm 1.03
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
Date: Mon Jun  3 14:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Kirby C. Bohling" <kbohling@birddog.com>, linux-lvm@sistina.com

On 3 Jun 2002 at 13:52, Kirby C. Bohling wrote:

> bash> stat /dev/data/develop
> 
>    File: "/dev/data/develop"
>    Size: 0               Blocks: 0          IO Block: 4096   Block
> Device Device: 309h/777d       Inode: 16521       Links: 1     Device
> type: 3a,3 Access: (0660/brw-rw----)  Uid: (    0/    root)   Gid: (  
>  6/    disk) Access: Fri Apr 12 17:56:53 2002 Modify: Fri Apr 12
> 17:56:53 2002 Change: Fri Apr 12 17:56:53 2002
> 
> Which would confirm that root= must be in hex, 3a (hex) = 58
> (decimal). It has to be 4 digits long so in this case it would be
> "root=3a03".  The Device Type: is where the 3a03 comes from...
> 
>  Hope this helps.

Oh yes, it helps a great deal.  Thank you very much.  This is what I 
get from /proc/lvm/VGs/vg00/LVs/lv01.  "lv01" is the name I gave to 
the root lv, but having a little more experience now I may change it 
to simply "root" or "rootfs" as this makes things a lot more clear 
when looking at the device entries.

My entry for lv01 (not currently mounted) says this:

# cat lv01
name:         /dev/vg00/lv01
size:         12288000
access:       3
status:       1
number:       0
open:         0
allocation:   0
device:       58:00

So using your example then this would work out to a major:minor 
number (in hex) of 3a:00, this then would go into my grub.conf 
thusly (as I understand your instructions):

title Red Hat Linux (2.4.18-4) lvm root file system
        root (hd0,0)
        kernel /vmlinuz-2.4.18-4 ro root=3a00 ramdisk_size=8192
        initrd /initrd-lvm-2.4.18-4.gz

instead of:

title Red Hat Linux (2.4.18-4) lvm root file system
        root (hd0,0)
        kernel /vmlinuz-2.4.18-4 ro ramdisk_size=8192 
root=/dev/vg00/lv01
        initrd /initrd-lvm-2.4.18-4.gz

Have I got this right now?

Regards,
Jim---     e-mail is NOT a secure channel 
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3
