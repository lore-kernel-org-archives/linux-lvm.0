Date: Thu, 6 Sep 2001 08:44:18 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)
Message-ID: <20010906084418.B18176@colombina.comedia.it>
References: <B45465FD9C23D21193E90000F8D0F3DF404FF5@mailsrv.linkvest.com> <3B95E36E.6070703@st-peter.stw.uni-erlangen.de> <20010905120549.H32553@turbolinux.com> <3B966C63.7080309@st-peter.stw.uni-erlangen.de> <20010905123211.J32553@turbolinux.com> <3B96757E.9010201@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B96757E.9010201@st-peter.stw.uni-erlangen.de>; from galia@st-peter.stw.uni-erlangen.de on Wed, Sep 05, 2001 at 08:57:02PM +0200
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 05, 2001 at 08:57:02PM +0200, svetljo wrote:
> Andreas Dilger wrote:
> >If you had one that previously worked, then start with that one and
> >work forwards until it stops working (maybe dividing the kernel version
> >numbers in half for each try to narrow it down quicker).
...
> i tried with 2.4.9-ac5 lvm-1.0 and vanila 2.4.9 lvm-1.0.1rc1
> with all these kernels it seemd that the LVM is working but i couldn't 
> format the LV with reiserfs and ext2

i have an older kernel 2.4.4-ac11 and it works beautifully.
i will try to upgrade this weekend and will let you know.
besides 2.4.9-ac does not even boot on my hardware.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
