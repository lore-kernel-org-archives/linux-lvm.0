From: Gunther Kuhlmann <gunther-kuhlmann@easy-call.net>
Subject: Re: [linux-lvm] what happes to VG when disks are added/removed?
Message-Id: <20020311170405.A2207@tui.easy-call.net>
References: <200203110826.g2B8Q6v17961@mailgate5.cinetic.de>
    <20020311162737.A13418@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020311162737.A13418@sistina.com>; from
    mauelshagen@sistina.com on Mon, Mar 11, 2002 at 04:27:37PM +0100
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
Date: Tue Mar 12 00:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 11, 2002, Heinz J . Mauelshagen wrote:

> > I had two hard disks, the first with three VG's, the second
> > with one VG (vg2). When the second hard disk started to fail, I
> > installed a third with VG vg4 and copied the data over. Then,
> > without deleting vg2, I unplugged hd 2. After reboot, the volume
> > on vg2 mounted cleanly, although the disk was not available. It
> > correctly accessed the LV on vg4 on the new disk. Is that correct?
> > Can I now use either of the two vg2/vg4 to access the LV on the
> > new disk? How do I get rid of one (and which) without risking my
> > data? Can I just vgremove vg2 away?
> 
> Gunther,
> 
> the result depends on *how* you copied vg2 over to your new hard drive.
> 
> If you used for eg. dd to do an image copy of the partitions, which contained
> vg2 on the flaky drive or a whole disk copy keeping sizes, you've got duplicated
> content and can unplug the flaky device.
> If you ran vgscan, you saw your 'old' vg2 in the new drive, which is
> perfectly fine.

No, I used pvcreate, vgcreate, lvcreate to create vg4 and a LV on it. And than
rsync to copy the data. That is why I am a bit confused by this behaviour. 
Should I reconnect hd2, then delete vg2 and disconnect hd2 again?

> BTW: your configuration is a little bit extraordinary in terms of how to use
> drives as PVs. Typically you shouldn't have multiple VG's on a single drive
> as you seem to have it.
> Much rather you should have multiple drives in one VG.

Yes, I have one HD with two VG's. It might be unusual, but I can't see anything
wrong with it. I do not intend to span a VG over more than one physical disk,
because I don't want to have _part_ of a VG to fail. That's when it gets messy.
I'm not saying it's impossible to recover, I just don't want to try.
Besides, my HD size is large compared to my LV sizes, that's why I needn't 
bother.

Gunther

-- 
Dipl.-Ing. Gunther Kuhlmann
gunther_kuhlmann@mentorg.com
gunther-kuhlmann@easy-call.net
Tel.: +49 (0)40 / 75 11 84 40
PGP: E6 BC 78 6B E6 09 C7 16  AB 5D 9A 9A D7 1C 01 FB
-- 
