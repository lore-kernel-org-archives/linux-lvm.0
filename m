From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Re: [Announce] device-mapper beta3 (fast snapshots)
Message-ID: <20020716180522.GN957@tykepenguin.com>
References: <3D2F6464.60908@us.ibm.com> <02071513565400.06209@boiler> <20020716084234.GA431@fib011235813.fsnet.co.uk> <200207161105.49328.habanero@us.ibm.com> <20020716163157.GA11334@fib011235813.fsnet.co.uk> <1026840444.21656.544.camel@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1026840444.21656.544.camel@tiny>
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
Date: Tue Jul 16 13:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 16, 2002 at 01:27:24PM -0400, Chris Mason wrote:
> On Tue, 2002-07-16 at 12:31, Joe Thornber wrote:
> 
> > > Joe, are you absolutely sure these tests had the disk cache disabled?  That's
> > > the only hardware thing I can think of that would make a difference.
> > 
> > Absolutely sure.  Those figures were for a pair of PVs that were
> > sharing an IDE cable so I can certainly get things moving faster.
> 
> Some IDE drives ignore commands to turn off the write back cache, or
> turn it back on when load gets high.
> 

I have reproduced Joes flat graph with SCSI & Fibre-channel drives so I wouldn't
read too much into his cabling :-)

patrick
