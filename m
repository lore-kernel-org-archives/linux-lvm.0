From: Denie Andriessen <denie@blok14b.gimmie.tudelft.nl>
Subject: Re: [linux-lvm] PV-Move fails, now at 127 Pe's...
In-Reply-To: <20020306105407.A21935@sistina.com>
Message-Id: <Pine.LNX.4.33.0203061204270.5102-100000@blok14b.gimmie.tudelft.nl>
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
Date: Wed Mar  6 05:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

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

Denie


On Wed, 6 Mar 2002, Heinz J . Mauelshagen wrote:

> 
> Well, you hit the cast problem I reported a fix for on linux-lvm shortly
> after the LVM 1.0.3 release.
> 
> Sorry for the inconvenience!
> 
> Here's the patch again.
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> > [root@localhost /]# vgdisplay
> > vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > vgscan
> > 
> > [root@localhost /]# vgdisplay -v volume
> > vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > vgscan
> > 
> > 
