From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011204151431.B11429@mail.wave.co.nz>
References: <3C06A624.80205@larsshack.org> <Pine.LNX.4.33.0111291548580.4437-100000@lx1.daboard.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0111291548580.4437-100000@lx1.daboard.com>; from mitch@mdmiller.com on Thu, Nov 29, 2001 at 03:50:54PM -0600
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
Date: Mon Dec  3 20:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 29, 2001 at 03:50:54PM -0600, mitch@mdmiller.com wrote:
> Pardon me for being a neophyte here, but what else goes on the root
> partition which takes any significant or dynamic amount of space?  Isn't
> the root just a place to put all the top level directories, the contents
> of which are typically all on another partition anyway?

/bin, /sbin and /lib can get quite large; /etc can also get a little fat.
I like to keep them (and /boot) on the root partition, I guess because
they are all critical for booting and seldom altered.

Regards,

Mark.
