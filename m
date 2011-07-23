Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6N0P3ti016550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2011 20:25:03 -0400
Date: Fri, 22 Jul 2011 20:25:02 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110723002502.GA27245@redhat.com>
References: <02292FBD45CF4C40AA7104EA7B291B70028E37F4CF@mxb-zv04.LVRINTERN.LVR.DE>
	<59730.213.157.4.156.1311359179.squirrel@nimrod.dscd.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59730.213.157.4.156.1311359179.squirrel@nimrod.dscd.de>
Subject: Re: [linux-lvm] LVM Alignement
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jul 22 2011 at  2:26pm -0400,
Alexander Dalloz <ad+lists@uni-x.org> wrote:

> > Hey all,
> >
> > i have a question about Lun / Partition alignment.
> > If I use LVM in a Linux guest OS on a VMFS Datastore i can align my
> > Partitions with mbralign.
> > But the tool failes if I will try to use it on a LVM only VDisk. For
> > example the second Disk of this guest OS.
> >
> > Did I need to align the second disk or did LVM take care of alignment ? I
> > just mean a single VDisk with a single LVM VG.

More recent versions of lvm will take care of alignment (e.g. that found
in fedora 14, 15 or RHEL6).

> By default LVM uses an offset of 192k, see:
> 
> # vgs -o +pe_start
>   VG         #PV #LV #SN Attr   VSize VFree 1st PE
>   VolGroup00   1   1   0 wz--n- 8,78G    0  192,00K

That was the old default.  That is not the case any more.

The default alignment (for storage that doesn't export topology
information) is now 1MB.  But that may be overriden with lvm.conf's
'default_data_alignment'.

Also see 'data_alignment_detection' in lvm.conf.

Mike
