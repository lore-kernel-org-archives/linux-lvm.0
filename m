From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] lvm on linux RAID5?
Message-ID: <20021016192819.D2330@zealot.blacknet.de>
References: <1034773372.1658.8.camel@frodo.xelin.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1034773372.1658.8.camel@frodo.xelin.se>; from anders.henriksson@xelin.se on Wed, Oct 16, 2002 at 03:02:52PM +0200
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
Date: Wed Oct 16 12:33:51 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 16 '02 at 15:02, Anders Henriksson wrote:
> I want to run lvm over four linux raid5 devices, can I just treat the
> raid devices as discs? i.e. run pvcreate on them directly and go on from
> there.
You've more than 12 discs in your box? No? Oh, if you ment you're trying
to run LVM ontop of a 4disk RAID5 drive (using linux md drivers), than
try:

pvcreate /dev/md0

vgcreate ... /dev/md0

lvcreate ... 

I'm running LVM since v1.0.0 ontop of a 6 device RAID5 drive using 2.4.x
MD driver.

> I am running a linux 7.3 server almost out of the box.
And what distribution are you using? But that should not matter.
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
