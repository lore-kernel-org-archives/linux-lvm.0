From: Matt Zimmerman <mdz@debian.org>
Subject: Re: [linux-lvm] Need help with PV recovery
Message-Id: <20011231081542.GO1965@alcor.net>
References: <20011230234056.GB1965@alcor.net> <20011231004824.D12868@lynx.no>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011231004824.D12868@lynx.no>
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
Date: Mon Dec 31 02:13:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

On Mon, Dec 31, 2001 at 12:48:24AM -0700, Andreas Dilger wrote:

> So, what you need to do (approximately) is (bPV = broken PV):
> # restore the LVM magic at the start of the PV (probably OK, but why not)
> dd if=/dev/<some other PV> bs=1 count=4 of=<bPV>
> # restore the UUID (obviously broken)
> echo -e "EffefHZmr5gMrsrUEM6CkDRRZC1ragTp\0" | dd bs=1 seek=44 count=33 of=<bPV>
> # restore the VG name (looks to be missing)
> echo -e "<vgname>\0" | dd bs=1 seek=172 count=<length of vgname + 1>

These three things are more or less what I did by hand, but it looks like I
must have fat-fingered something, because when I do it this way, it seems to
work (!).

> According to the UUID list, this _should_ be PV #2, is that correct?  Hard
> to see if the "system id" is OK, but I'm not sure if it is important.
> What about the output of "pvdata -PP <bPV>"?  I _assume_ that the PV
> location data is OK, or you wouldn't be getting anything from the PE and
> LV lists, but it is hard to tell for sure.

Yes, I think it was originally PV #2.  LVM doesn't seem to mind having it
show up as PV #0, though, as I am now able to activate the volume group and
access all of the LVs.  Since I have enough free space in the volume group
to pvmove everything off of the damaged PV, I am doing that right now, after
which I will recreate it fresh, to be safe.

Thanks very much for your help.

-- 
 - mdz
