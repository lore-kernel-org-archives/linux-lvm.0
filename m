From: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040102202206.GA28007@ti19.telemetry-investments.com>
References: <OF1304E5DE.20B1794B-ON00256E0F.006B2F94-00256E0F.006B2FA0@svunta.os.is> <20040102201045.GK26275@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040102201045.GK26275@percy.comedia.it>
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
Date: Fri Jan  2 14:24:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 02, 2004 at 09:10:46PM +0100, Luca Berra wrote:
> On Fri, Jan 02, 2004 at 07:30:45PM +0000, Kjartan Reynir Hauksson wrote:
> >>work.  You have to use the --lvm-version=2 option to mkinitrd.
> >
> >kernel panic, this time VFS: Cannot open root device "3a00" or 3a:00
> 
> ouch that should never happen, do you have anything printed above the 
> kernel panic?

0x3a == 58 == lvm1 major device number.  So it looks like the initrd
is still incorrect.

Regards,

	Bill Rugolsky
