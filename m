Subject: Re: [linux-lvm] Chicken and egg problem..
Message-ID: <20011121144408.GI9907@pc.ilinx>
References: <1006347197.3bfba3bd23d95@imp.free.fr> <7510000.1006331425@dizzy>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7510000.1006331425@dizzy>
From: "Brian J. Murrell" <724b581f59b221086926026402b50126@interlinx.bc.ca>
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
Date: Wed Nov 21 12:36:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 21, 2001 at 02:30:25AM -0600, Steven Lembark wrote:
> 
> The kernel panic is extactly why you probably wouldn't
> want to use only LVM on the system.

I do it.  Only my boot partition is a regular ol' partition.  I won't
say I haven't had problems that I had to recover from in the past with
an LVM root, but luckily enough my distro vendor's LVM support is
decent and their BOOT kernel/media has an LVM module built for it.

> Leaving the root
> volume (a.k.a., '/'), primary swap and probably /var on
> the first three partitions of the boot device will make
> your life enormously simpler in the long run.

I completely disagree.  Eventually you will get to a point where an
upgrade of your system will require more space in / or /usr and even
just normal usage will want more space in /var.  Being able to expand
these easily with LVM is awesome!

> This is pretty much the only way you'll be able to
> convienently recover from any LVM problems in the future.

Just use a good boot disk.  You are even luckier if your distro
vendor's stock kernel and/or media support LVM.

> Otherwise you'll need bootable media floating around.

Of course.  Don't you always?  :-)

b.

-- 
Brian J. Murrell
