Subject: Re: [linux-lvm] Doubled PV
From: Markus Schiltknecht <markus@bluegap.ch>
In-Reply-To: <20030527130119.B8518@sistina.com>
References: <1053561043.12809.166.camel@localhost>
	 <20030527130119.B8518@sistina.com>
Message-Id: <1054232125.1862.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu May 29 12:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tue, 2003-05-27 at 13:01, Heinz J . Mauelshagen wrote:
> Markus,
> 
> what _exactly_ happened during the pvmove ?

Hard to reconstruct in detail, but as soon as the raid device has
'enough' failed devices, it doesn't respond to any request. It simply
isn't readable anymore.

> Would help to analyze any pvmove bug.

Don't think that's a bug in pvmove. Neigther in linux-softraid - just a
very bad accident. (If a bug at all, I would say it's an ATA bug...)

> 
> Using LVM2 tools is a good idea.
> 
> You'll have text metadata that way, would be able to hand-edit it removing
> the 10 LEs and vgcfgrestore the changed metadata back onto the PVs.

I could restore the single PV to a state, where it had no LEs on it.
(using vgcfgrestore from lvm 1). That way vgscan now finds just enough
LEs and I can activate the VG again.

Lucky me... ;-)

Thanks anyway.

Markus
