Message-ID: <3BB220C3.2C96C183@divsol.com>
Date: Wed, 26 Sep 2001 12:38:59 -0600
From: Jim Cromie <jcromie@divsol.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 1.0.1-rc2 lvcreate segfaults, pvcreate, vgcreate ok
References: <Pine.LNX.4.33.0109261252450.23800-100000@ct41987-a.jfrvil1.in.home.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

John Marquart wrote:

> I think you are running into a problem i had.   look in the archives for
> mails from/to jomarqua@indiana.edu - but i think the problem is your
> inline functions that lvcreate uses.
>
> There is a patch that was recommended to me - should fix your problem i
> think - it is at:
>
> http://incandescent.mp3revolution.net/lvm/inline_fix.diff
>
> -j

yup, that did it.

after flailing with patch rejects against unknown sources,
backed up and re-did  tar xvfz

then the patch applied w/o rejects,
compiled w/o errors,

and lvcreate worked !


[root@groucho 1.0.1-rc2]# lvcreate -L1500 -nVL_test VG_test
lvcreate -- doing automatic backup of "VG_test"
lvcreate -- logical volume "/dev/VG_test/VL_test" successfully created

[root@groucho 1.0.1-rc2]# lvscan
lvscan -- ACTIVE            "/dev/VG_test/VL_test" [1.46 GB]
lvscan -- 1 logical volumes with 1.46 GB total in 1 volume group
lvscan -- 1 active logical volumes

[root@groucho 1.0.1-rc2]# lvdisplay /dev/VG_test/VL_test
--- Logical volume ---
LV Name                /dev/VG_test/VL_test
VG Name                VG_test
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                1.46 GB
Current LE             375
Allocated LE           375
Allocation             next free
Read ahead sectors     120
Block device           58:0
