Message-ID: <3E0F61AE.5090804@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgcreate -- no valid physical volumes in command
 line
References: <004c01c2af72$d49d8220$820d2a3e@Desiportatil>
In-Reply-To: <004c01c2af72$d49d8220$820d2a3e@Desiportatil>
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
Date: Sun Dec 29 14:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> --- List of physical volume UUIDs ---
> ------------------------------------------------------
> root]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/part1" is in no VG
> [37.27 GB]
> pvscan -- inactive PV "/dev/ide/host2/bus1/target1/lun0/part1" is in no VG
> [74.53 GB]
> pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part1" is in no VG
> [19.08 GB]
> pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/part1" is in no VG
> [19.07 GB]
> pvscan -- total: 4 [149.96 GB] / in use: 0 [0] / in no VG: 4 [149.96 GB]
> ----------------------------------------------------------------------------
> ---------
> 
>  root]# vgcreate test-vg /dev/hd[e-h]1
> vgcreate -- no valid physical volumes in command line
> 
> 
> i have this error, can samebady help me out?
> 
vgcreate test-vg /dev/ide/host2/bus1/target0/lun0/part1 .....

L.

-- 
Luca Berra -- bluca@comedia.it
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
