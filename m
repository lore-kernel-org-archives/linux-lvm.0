From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Is there a maximum for LV?
Message-ID: <20031209220733.U16901@uk.sistina.com>
References: <CEADF0D83077F7458B763904E47AA709BD64@exchange.neokimia.com> <20031209192646.GB4188@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031209192646.GB4188@localhost>; from linux-lvm@24x7linux.com on Tue, Dec 09, 2003 at 08:26:46PM +0100
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
Date: Tue Dec  9 16:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> > How I'm testing LVM2. The field "MAX LV Size" is not there anymore. Is this means that LV doesn't have a maximum?
Correct: Provided you use the new "lvm2" metadata format, you're 
limited only by disk space and the maximum device size that your kernel
will support.

> >From vgcreate(8):
> -s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]

> So it seems you have a 255 GiB limit on LV sizes with your LVM2 setup.
That section now only applies to PVs in "lvm1" format.
It needs updating...

For tool performance reasons it's still a good idea to use large 
physical extent sizes for large volume groups.  (This will get 
fixed eventually.)

Alasdair
-- 
agk@uk.sistina.com
