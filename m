From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] Is there a maximum for LV?
Message-ID: <20031209192646.GB4188@localhost>
References: <CEADF0D83077F7458B763904E47AA709BD64@exchange.neokimia.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CEADF0D83077F7458B763904E47AA709BD64@exchange.neokimia.com>
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
Date: Tue Dec  9 13:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tuesday, 09 December 2003, at 09:29:05 -0500,
Yanick Quirion wrote:

> On the past I was using lvm 1.1rc2. For an unknown reason, the version is not anymore available.
> But with this version, when I do a "vgdisplay" I was able to saw the LV Max Size:
> 
> How I'm testing LVM2. The field "MAX LV Size" is not there anymore. Is this means that LV doesn't have a maximum?
> 
From vgcreate(8):
-s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]
       Sets the physical extent size on physical volumes of this volume
       group.  A size suffix (k for kilobytes up to t for terabytes) is
       optional, megabytes is the default  if  no  suffix  is  present.
       Values  can be from 8 KB to 16 GB in powers of 2. The default of
       4 MB causes maximum LV sizes of ~256GB because as many  as  ~64k
       extents  are  supported  per LV. In case larger maximum LV sizes
       are needed (later), you need to set the  PE  size  to  a  larger
       value  as  well.  Later changes of the PE size in an existing VG
       are not supported.

So it seems you have a 255 GiB limit on LV sizes with your LVM2 setup. This
same limitation is what applies to LVM2 Logical Volumes, and the math is
simple to do.

Greetings.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.6.0-test10-mm1)
