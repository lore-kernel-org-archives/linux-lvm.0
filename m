Date: Thu, 6 Sep 2001 19:52:51 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Root on LV
Message-ID: <20010906195251.A20643@colombina.comedia.it>
References: <OF44ABFE07.4419EBD8-ONC1256ABF.004C8662@ibcnet.hu> <3B978B57.8000208@st-peter.stw.uni-erlangen.de> <20010906093729.R32553@turbolinux.com> <3B97A5DB.8000203@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B97A5DB.8000203@st-peter.stw.uni-erlangen.de>; from galia@st-peter.stw.uni-erlangen.de on Thu, Sep 06, 2001 at 06:35:39PM +0200
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

On Thu, Sep 06, 2001 at 06:35:39PM +0200, svetljo wrote:
> Andreas Dilger wrote:
> >Yes, you are wrong.  LILO+patch can get a kernel from a logical volume.
> does this mean that i can have my kernel on LV of any type ( can i have 
> it on striped one)
> i think i have read some time ago that lilo can boot from linear RAID or 
> RAID1 but not from RAID-0
NO!!!!
lilo uses your pc bios to boot, it cannot do anything fancy,
it just reads from a disk into memory then jumps there.

in order to boot kernel lilo needs to store a mapfile on
the /boot fs, the disk offset of this file is stored in
lilo 1-st stage loader a 512 byte program, and you cannot read
a striped lv from a 512 byte proggie yet.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
