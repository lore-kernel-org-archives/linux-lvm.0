Subject: Re: [linux-lvm] HELP: vgscan segfaults
References: <20030129151209.GB2200@elrond.lohmann-services.de>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <20030129151209.GB2200@elrond.lohmann-services.de>
Message-ID: <wxxvfz7xh1r.fsf@nommo.uio.no>
MIME-Version: 1.0
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
Date: Wed Feb 26 08:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

listenmann@elrond.lohmann-services.de (Peter Lohmann) writes:

> root@tty1[/]# vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d" 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- scanning for all active volume group(s) first
> vgscan -- reading data of volume group "myvg" from physical volume(s)
> Segmentation fault

  I've seen this recently as well.  on my end there were some issues
  with a PV getting lost.  the problem in my end was that the
  partition table of a drive was lost somehow, and without a partition
  table you don't get any PVs.  :-)

  I recreated the partitontable (fdisk), recreated the PV on it
  (pvcreate) and added the PV to the appropriate VG (vgextend).  this
  happily enough didn't touch the data on the drive, so the LVs that
  resided on the readded drive where found and worked as normal
  afterwards.  

-- 
Terje
