From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] Max LV size
Message-ID: <20021111225220.GA13022@localhost>
References: <Pine.A41.4.43.0211111602380.53894-100000@hera.itg.uiuc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.A41.4.43.0211111602380.53894-100000@hera.itg.uiuc.edu>
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
Date: Mon Nov 11 16:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

On Monday, 11 November 2002, at 16:10:05 -0600,
Alexander Lazarevich wrote:

> vgdisplay -v tells me the max LV size is 255GB. So I figured I'd decrease
> the number of Max LV's (currently at 256) to 128, and then that would
> increase the size that each LV could be. But when I do a "vgchange -l 128
> blah", it just stops and says "segmentation fault".
> 
> What gives? I really hope 255GB isn't a limit. Any ideas?
> 
Yes, just read the documentation :-). From man vgcreate:

       -s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]
              Sets  the  physical extent size on physical volumes
              of this volume group.  A size suffix (k  for  kilo
              bytes up to t for terabytes) is optional, megabytes
              is the default if no suffix is present.  Values can
              be  from  8 KB to 16 GB in powers of 2. The default
              of 4 MB causes maximum LV sizes of  ~256GB  because
              as  many  as  ~64k extents are supported per LV. In
              case larger maximum LV sizes  are  needed  (later),
              you  need  to  set the PE size to a larger value as
              well. Later changes of the PE size in  an  existing
              VG are not supported.

Hope it helps.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
