From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] Is lvmcreate_initrd expected to work?
Message-ID: <20011129091938.C19316@kluge.net>
References: <3C041A0D.70608@larsshack.org> <20011129090508.B1408@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011129090508.B1408@tykepenguin.com>; from caulfield@sistina.com on Thu, Nov 29, 2001 at 09:05:08AM +0000
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
Date: Thu Nov 29 08:18:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 29, 2001 at 09:05:08AM +0000, Patrick Caulfield wrote:
> Yes it does ignore the issue of kernel modules. It's quite hard for 
> lvmcreate_initrd to know just which modules are needed to get the system booted,
> though I suppose it's possible.

It could do the same thing as mkinitrd does by default (approx):
        - check if SCSI drivers are needed (scsi_hostadapter lines in
          modules.conf), if so add them to initrd and make sure to
          preload scsi_mod and sd_mod.
	- check the current lvm configuration, and if any of the pv's are MD
	  devices, pre-load the appropriate raid[0145] module as well (can
	  determine via /proc/mdstat).

Alternatively, options for specifying modules would work too. :)

-- 
Randomly Generated Tagline:
"My spleen is twice the size of a normal human spleen.  This isn't
 such a big deal right now, but after I'm dead ... There's going to be
 a bidding war."         - Dave Foley, Kids in the Hall
