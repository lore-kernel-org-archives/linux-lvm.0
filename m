Message-ID: <2654.24.123.20.245.1052430349.squirrel@www.randyperkins.com>
Subject: Re: [linux-lvm] hard drive crash info please
From: "Randy Perkins" <randyperkins@randyperkins.com>
In-Reply-To: <3EBA9EAC.3070006@free.fr>
References: <1052416232.17357.32.camel@randy.randyperkins.com>
        <3EBA9EAC.3070006@free.fr>
MIME-Version: 1.0
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
Date: Thu May  8 16:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: emmanuel.varagnat@free.fr

> Randy Perkins wrote:
>> hello,
>> 	I have a lvm setup of 5 PV (disks), 1 VG,  and 1 LV.  one of the
>> drives
>> just started clicking, and is not recognizable by the bios. Now when i
>> boot up my volume group is not recognized.
>
> I did have the same problem a long time ago. So I started to write a
> tool that would try to recover some the data from the remaining data
> available. I lost the first disk of set of 3 disk...
> This is quite finished.
> It uses the capability of LVM2 to deal with 'partial' VG.
> It only works with ext2/ext3 filesystems and require another (temporary)
>  disk where recovered data will be written.
>
> The URL is at : http://coredump.free.fr/linux/e2retrieve.php
>
> I also did a floppy disk with the essential (kernel 2.4.19 with LVM2
> patch, LVM2 tools, Busybox and e2retrieve).
>
> -=( manu )=-
>

hello,

thanks for the reply.
I went to the link you provided but there is no download available.
did you mean to say earlier "this is not quite finished".
is the download available for e2retrieve ??

I am going to have to study the man pages concerning lvm.
I basically studied it enough to get my volume working,
and since then I havent had to mess with it.

thanks again

randy
