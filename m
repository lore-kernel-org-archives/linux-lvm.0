Date: Thu, 30 Jul 2020 16:31:35 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200730213135.GF21486@redhat.com>
References: <d98fb84c-2b32-d6eb-65cb-022e5a974319@nwra.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d98fb84c-2b32-d6eb-65cb-022e5a974319@nwra.com>
Subject: Re: [linux-lvm] What do these messages mean?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Orion Poplawski <orion@nwra.com>
Cc: linux-lvm@redhat.com

On Thu, Jul 30, 2020 at 02:34:40PM -0600, Orion Poplawski wrote:
> I'm guessing this simply indicates that the kernel device name associated
> with the PV has changed.  Is that correct?

yes
 
> Jul 28 16:50:58 hostname lvm[1424]:   PVID
> 6seLWa-Oz2d-jZIC-Ox17-MPaB-QGu5-uElsKN read from /dev/sdb1 last written to
> /dev/sdd1.

When the VG was last updated the PV was on sdd1, now it's on sdb1.

> No idea what this means.  Should we be using quick activation?  Is it a
> result of the above?
> 
> Jul 28 16:50:58 hostname lvm[1424]:   pvscan[1424] VG vg_leka not using
> quick activation.

The activation of the VG from pvscan is not being optimized, because of
the device name change.  That's not a problem, just informative.

Usually, I think these messages only appear in systemctl status for the
lvm2-pvscan service.

Dave
