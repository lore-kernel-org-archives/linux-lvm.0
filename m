Message-ID: <36673.63.104.62.66.1026163002.squirrel@deesfamily.com>
Subject: Re: [linux-lvm] df reporting incorrect size?
From: "Randy Dees" <randy@deesfamily.com>
In-Reply-To: <3D29FD25.5050902@jumpline.com>
References: <3D29FD25.5050902@jumpline.com>
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
Date: Mon Jul  8 16:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

3G = approx 5% of 59G filesystem, or the reserved blocks on a standard
ext2fs filesystem.

They're right there where you expect to find them if you use a unix
filesystem.



<quote who="Ben Snyder">
> I'm a linux-lvm newbie (some limited use of IBM's LVM in AIX), and some
> use of Veritas in Solaris.  So I'm doing some testing, hoping to find
> out that lvm will serve my needs and that of my employer.
>
> I've done all of my fdisks to change partition type (0x8e), vgscans,
> pvcreates, vgcreates, lvcreates, mke2fs on the lv etc, (used nice
> generic names for my testing, like vg and lv), mounted it up and get the
>  following:
>
>
> mount /dev/vg/lv /test
> df -h /test
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/spheravg/spheralv
>                               59G   20k   56G   0% /test
>
>
> WTF?!?!  Where'd that 3G go?  Does LVM mess with things so that the OS
> cant read volumes correctly?  Or is there another issue that I might be
> running into?
>
> Thanks in advance for feedback/assistance/HELP.
>
> Also, on another note, how difficult is it going to be for me to add
> another ~63G to this LV from another physical device?  The whole reason
> we're looking at LVM is mainly to perform this function (one HYUGE
> filesystem over multiple devices).
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
