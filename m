Return-Path: <markv@wave.co.nz>
Date: Tue, 29 May 2001 11:36:04 +1200
From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] Converting my Root file system to LVM [last
Message-ID: <20010529113604.A28657@mail.wave.co.nz>
References: <200105232106.f4NL6Bl01557@dixie.dyndns.org> <20010528104951.D26710@sistina.com>
Mime-Version: 1.0
In-Reply-To: <20010528104951.D26710@sistina.com>; from Heinz J. Mauelshagen on Mon, May 28, 2001 at 10:49:51AM +0000
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

On Mon, May 28, 2001 at 10:49:51AM +0000, Heinz J. Mauelshagen wrote:
> There is *no* problem avoiding "vgchange -an" *today* because nothing is written
> to disk running it.
> 
> The command tries to unload the LVM metadata from the kernel therefore
> deactivating VGs and the access to LVs which can't work unless *all* LVs of
> all VGs are closed (no FS mounted etc.).
> 
> However this might change in the future in regard that a metadata update might
> be necessary.

When/if you do this, please consider systems with root on LVM.  Building a
ramdisk and pivoting root to that seems clumsy at best.  Perhaps vgchange
could have an option to request a metadata flush, which is deferred until
the relevant volumes are closed?

Regards,

Mark.
