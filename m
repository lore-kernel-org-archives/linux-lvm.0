Message-ID: <3C041A0D.70608@larsshack.org>
From: Lars Kellogg-Stedman <lars@larsshack.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Is lvmcreate_initrd expected to work?
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
Date: Tue Nov 27 16:54:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Now that we've solved the pressing oh-my-goodness-my-system-won't-boot 
problem, I've got a few other questions.

The lvm package comes with the nifty lvmcreate_initrd command...but in 
my experience it simply doesn't work.  While it's especially clever 
about resolving library dependencies, it seems to ignore the issue of 
kernel modules.

For instance, I'm running a "reasonably" stock RedHat/SGI 7.2 
installation, which means that both SCSI support and the RAID5 module 
are built as drivers.  This means that my initrd needs, minimally:

  - scsi_mod
  - sd_mod
  - xor
  - raid5
  - lvm-mod

And unfortunately, lvmcreate_initrd doesn't pick up on any of this.

I ended up custom building an initrd around busybox, which provides a 
flexible pre-boot environment, including access to a shell prompt from 
within the initrd (which proved extremely useful recently).  But 
obviously, not everybody is going to have the time or experience to do this.

I realize that the root-on-LVM design is fairly bleeding-edge, as these 
things go, but it is in the FAQ.  I suppose the best solution would be 
for distribution vendors such as RedHat to include LVM support in their 
own dist-specific 'mkinitrd' type script.

While it would probably be easier to build a custom kernel with all the 
necessary drivers built in, I'll probably stick with this solution now 
since I'm fond of my initrd.  What are other folks doing?

-- Lars
