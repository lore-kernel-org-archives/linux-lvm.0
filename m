Message-Id: <200312311613.hBVGDNr16271@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20031231121144.9792.qmail@web13507.mail.yahoo.com> (message from
	Stuart Felenstein on Wed, 31 Dec 2003 04:11:44 -0800 (PST))
Subject: Re: [linux-lvm] Totally confused
References: <20031231121144.9792.qmail@web13507.mail.yahoo.com>
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
Date: Wed Dec 31 10:11:02 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Stuart Felenstein wrote:

>I thought I understood LVM and set it up correctly on
>my /dev/hda3.  Somethings is wrong though.  Here is
>the output from lvdisplay:

>LV Name              /dev/Volume00/videos
>VG Name              Volume00
>LV Write Access      read/write
>LV Status            available
>LV#                  1
>#open                1
>LV Size              68.67 GB
>Current LE           17579
>Allocated LE         17579
>Allocation           next free
>Read ahead sectors   1024
>Block device         58:0 

Output from other LVM display utilities might be useful.
The -v option will provide more information from many
LVM commands.

>After the LV was created I did
>mkfs ext3 -m 0 -T largefile /dev/Volume00/videos

You probably meant "mkfs.ext3" rather than "mkfs ext3".

>Oddities (to me), I try to cd /dev/Volume00/videos - I
>get a no directory.  cd to /dev/Volume00 is
>acccessible and can be written to.  
>I assumed that i was going to have a videos partition
>with 68.67 GB available.  It looks like I have about
>10 megs or something like that as 5 minutes of mpgeg
>gave me a "device out of space".

The output from "mount" and "df -k" might be helpful.

>This is lvm 1.08 , straight from kernel 2.4.23
>builtin.

>Am I just not doing something correct here?

Could you go into more detail about the commands
(such as lvcreate) and options you used?

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
