From: George Karaolides <george@karaolides.com>
Subject: Re: [linux-lvm] Root fs on LV on software RAID - SUCCESS
In-Reply-To: <3C5D5140.8070505@wanadoo.fr>
Message-Id: <Pine.LNX.4.40.0202041908360.6980-100000@phobos.internal.parmastocks.com>
MIME-Version: 1.0
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
Date: Mon Feb  4 11:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello Francis,

Thanks for your reply.  You are, however, referring to hardware RAID; I
was referring to Linux software RAID.

I did check the archives of this mailing list for the past four or five
months.

There are a lot of threads about LVM on RAID (and vice-versa, though I
don't understand why anyone would want to do that...)  But I didn't find a
discussion about how to have the root fs on LVM on software RAID.

Anyway, I have eventually succeeded in building a system (Debian woody,
kernel 2.4.17) with root fs on LVM on software RAID-1.  Just to make
things interesting, I used reiserfs throughout; this is a proof-of-concept
system.

A root-on-LVM-on-software-RAID-HOWTO is not written up anywhere I could
find it.  Even for just root-on-RAID, the current HOWTO's are out of date
and don't work with kernel 2.4.  So I'll write up my setup in an informal
HOWTO which I'll put up on my website.  Watch this space, as they say.

Best regards,

|      George Karaolides       8, Costakis Pantelides St.,         |
|      tel:   +357 99 68 08 86                  Strovolos,         |
|      email: george@karaolides.com       Nicosia CY 2057,         |
|      web:   www.karaolides.com      Republic  of Cyprus          |


On Sun, 3 Feb 2002, Francis SOUYRI wrote:

> Hello Georges,
>
>     Yes it is possible. I have a hardware raid 5 system and two systems
> without raid where all the filesystem are on lv's (also /boot, I used a
> patched lilo). You can find some informations in the LVM mail archive.
>
> Best regards.
>
> Francis
>
