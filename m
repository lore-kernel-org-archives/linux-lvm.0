Message-ID: <001b01c2d111$f54eb320$0400a8c0@venkat>
From: "abbireddy venkatram reddy" <venkat@storageone.co.kr>
References: <000301c2d06c$99f7e280$0400000a@lenina> <20030210144322.A5997@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] what is means in /proc/lvm/global
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
Date: Mon Feb 10 08:38:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Hi all,

 I want to know some phrases in the 'proc/lvm/global file'.
 1) what AA means.
 2) What AWDL means.
 3) What open means.

Please let me know soon..thanks in advance.



File : /proc/lvm/global

LVM driver LVM version 1.0.5+(22/07/2002)

Total:  2 VGs  4 PVs  4 LVs (4 LVs open 4 times)

Global: 112657 bytes malloced   IOP version: 10   6:37:38 active

VG:  vg01  [3 PV, 3 LV/3 open]  PE Size: 65536 KB
  Usage [KB/PE]: 60358656 /921 total  13434880 /205 used  46923776 /716 free
  PVs: [AA] rd/c0d0p5             41091072 /627      8257536 /126
32833536 /501
       [AA] rd/c0d0p6             11141120 /170      5177344 /79
5963776 /91
       [AA] rd/c0d0p7              8126464 /124            0 /0
8126464 /124
    LVs: [AWDL  ] lv01                       5177344 /79       1x open
         [AWDL  ] lv02                       3080192 /47       1x open
         [AWDL  ] lv03                       5177344 /79       1x open

VG:  vg90  [1 PV, 1 LV/1 open]  PE Size: 32768 KB
  Usage [KB/PE]: 833159168 /25426 total  204800000 /6250 used  628359168
/19176 free
  PV:  [AA] sda2                  833159168 /25426   204800000 /6250
628359168 /19176
    LV:  [AWDL  ] opt                      204800000 /6250     1x open


With Regards
venkat.

----- Original Message -----
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: <linux-lvm@sistina.com>
Sent: Monday, February 10, 2003 10:43 PM
Subject: Re: [linux-lvm] Erroneously formatted PV; 'vgscan -- ERROR
"vg_read_with_pv_and_lv(): current PV" can't get data of volume group'...



Tim-Patrick,

with your root on LV setup you either need:


an emergency boot media with LVM1 on it _and_ /etc/lvmconf/* backup in
order to restore you LVM metadata using vgcfgrestore presuming you setup
your partitions exactly the way they were before ("vgscan;vgchange -ay"
after
metadata restore)

- or -

an emergency boot media with LVM2/device-mapper on it to
run "vgscan ; vgchange --partial -a y" in order to
access your partioal VG without the gone partition

- or -

that LVM2 boot media to restore the metadata.

- or -

to attach your HDDs to another LVM equipped system to repair the
volume group configuration

Regards,
Heinz    -- The LVM Guy --


On Sun, Feb 09, 2003 at 07:53:56PM +0100, Tim-Patrick M�rk wrote:
> Hello,
>
> two days ago i installed a new HDD and added it to my VG 'vg1'
> (partition id '8e' + 'pvcreate /dev/hdb1' + 'vgextend vh1 /dev/hdb1').
> A bit later I erroneously formatted '/dev/hdb1' by 'mkfs.xfs /dev/hdb1'.
> I ran 'vgscan' and 'pvscan' and the made a smiliar output like it is
> shown on
> http://lists.sistina.com/pipermail/linux-lvm/2002-August/011947.html -
> but i have only two PVs in my VG 'vg1': '/dev/hdc1' and '/dev/hdd2'.
> I don't remember what i exactly did with '/dev/hdb' after that (it was
> late...), but as a result I 'fdisked' the partition table away...
> There was no data on '/dev'hdb' (except the LVM metadata), so no 'real'
> data needs to be recovered (at least i hope so).
>
> All in all, I can't access the VG 'vg1' (PVs: '/dev/hdc1' + '/dev/hdd2')
> with the 3 LVs 'root', 'storage' and 'swap' any more.
>
> Now you could advise me to run 'vgcfgrestore', but i regretfully must
> say that i rebooted my box and as the name of the LV 'root' implies, my
> root-filesystem was on it, so the system doesn't boot anymore *doh*...
>
> Summary:
> - 1 VG: 'vg1'
> - 2 (3) PVs: '/dev/hdc1' + '/dev/hdd2' + for a short time (see above)
> '/dev/hdb1'
> - 3 LVs: 'root', 'storage' and 'swap'
> - Filesystem on all LVs: XFS
>
> Fortunately i have a separated 'backup system' on another HDD, which
> doesn't use LVM nor XFS, but simply ext2, so i can work with it
> temporarily to fix this disaster.
>
> I think the problem is, that the VG 'vg1' still thinks, it would consist
> of 3 PVs, but only 2 are there.
> But because no VG is found by 'vgscan' (see link above), i can't remove
> '/dev/hdb1' by 'vgreduce vg1 /dev/hdb1' and so on...
>
> Is there any way to generate metadata for '/dev/hdb1' to make it known
> by 'vg1' or remove '/dev/hdb1' from 'vg1'?!
>
> I'm very despaired and would be gladdened by every answer.
> If you need any details, just ask.
>
> P.S.: This is not intended to be a cross-posting; I only had problems
> submitting my first one.
>
> Kind regards and thanks in advance
>
> Tim-Patrick M�rk
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
