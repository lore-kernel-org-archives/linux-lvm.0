Date: Thu, 23 Aug 2001 15:52:37 -0700
From: David Rees <dbr@greenhydrant.com>
Subject: Re: [linux-lvm] LVM, rawio, ext2?
Message-ID: <20010823155237.A8142@greenhydrant.com>
References: <20010823014012.A32700@greenhydrant.com> <20010823204905.B920@dardhal.mired.net> <20010823224034.B17378@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010823224034.B17378@sistina.com>; from mauelshagen@sistina.com on Thu, Aug 23, 2001 at 10:40:34PM +0200
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Thu, Aug 23, 2001 at 10:40:34PM +0200, Heinz J . Mauelshagen wrote:
> On Thu, Aug 23, 2001 at 08:49:05PM +0000, Jos� Luis Domingo L�pez wrote:
> > On Thursday, 23 August 2001, at 01:40:12 -0700,
> > David Rees wrote:
> > 
> > > Hi,
> > > 
> > > I'd like to create an ext2 filesystem over a raw io device, is this even
> > > possible?  (If not, skip the rest of this message! ;-)
> > > 
> > Maybe I'm completely wrong (as usual :), but as far as I know you can
> > either create a filesystem over any block device (e.g. partition, md, LV,
> > etc.) and use it as usual, or bind a raw device to an existing block
> > device, and let the application (e.g. Oracle) manage space on the device
> > as it wants.
> 
> Correct.
> 
> You can't run a filesystem on a raw device.

As I suspected.  I thought I had seen an example of it somewhere but I am
mistaken.

Thanks,
Dave
