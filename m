From: Denie Andriessen <D.Andriessen@pink.nl>
Subject: Re: [linux-lvm] PV-Move fails, now at 127 Pe's...
Message-Id: <00ca01c1c6df$493018a0$f707a182@gimmie.tudelft.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.33.0203061156070.5102-100000@blok14b.gimmie.tudelft.nl>
    <018601c1c575$2bef40b0$f707a182@gimmie.tudelft.nl>
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
Date: Fri Mar  8 14:19:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

So,

Found the 1.0.4.-pre1.tar.bz2, compiled, installed
(Hey, the fix to the 'cast' problem was already in there, although an old
version of the file was also!)
Was: Unable to clear last PE
>Well, you hit the cast problem I reported a fix for on linux-lvm shortly
>after the LVM 1.0.3 release.

Now:
- it *IS* possible to do the vgscan
- it *IS* possible to turn the volume active again
- it *IS* possible to do PV move again, and it does NOT fail on PE 127
anymore
- ALL data was still there !
- Everything is up and running !
- I am very very very happy !!!

Thanks a LOT, keep up the amazing work !!

Very kind regards,
Denie Andriessen

----- Original Message -----
<LOTS CUT OUT>

Hi,

So now the volume is inactive, I can't change it, although it notices
there is an inactive volume on the disks...

hdb1 and hdc1 both have 127 blocks on there now, and hdg1 has 2*127 block
removed. I can't access the data anymore now... Any suggestions on how to
get the volume back online, so the data can be accessed ???

-------------
vgscan -- only found 20391 of 20518 LEs for LV /dev/volume/data (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't
get data of volume group "volume" from physical volume(s)
-------------

On Tue, Mar 05, 2002 at 02:50:19AM +0100, Denie Andriessen wrote:
> Hi,
>
> Could it be the:  "known misalignment issue we had in the 0.9.1 Beta
series"
> (after reading through lots of messages)
> https://mail.sistina.com/pipermail/linux-lvm/2002-February/010724.html

Yes, that's my guess.

>
> Is an upgrade 'dangerous' ? (risk of loosing data)

Well, the way to go is:

- pvmove /dev/hdf2 # move your data back to /dev/hdf1
- vgreduce test12 /dev/hdf2
- update to LVM 1.0.3 (or wait for 1.0.4 which will be released soon)
- pvcreate /dev/hdf2
- vgextend test12 /dev/hdf2
- pvmove /dev/hdf1

>
> Cheers,
> Denie
>
