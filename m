Message-ID: <002101c324cf$09e48fb0$e0bba5cc@patni.com>
From: "Sameer Halgatti" <sameer.halgatti@patni.com>
References: <23233866A70C32479532C8D0B8AE7B96032AAC12@i2km07-ukbr.domain1.systemhost.net>
Subject: Re: [linux-lvm] volume group and physical volume
MIME-Version: 1.0
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
Date: Tue May 27 23:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hi narsimha,
If u want to completely remove ur PV (i.e. if u want to lose ur data) then
there is a very simple way to get rid of this problem. Just do following....
dd of=/dev/hda3                  ......hda3 becuse ur PV resides on that
<enter approx 50 chars>
<press cntrl+d>

Of course it not the recommend solution, but it will solve ur problem :-)
Actually ur VGDA data on the disk may be corrupted, that's why u r getting
this error message.
When u create a PV/VG, some data is written on the disk (on some initial
disk blocks). So if u erase that by doing 'dd', then u can create fresh
PV/VG using that disk.

----- Original Message -----
From: <narsimha.kulkarni@bt.com>
To: <linux-lvm@sistina.com>
Sent: Tuesday, May 27, 2003 8:37 PM
Subject: [linux-lvm] volume group and physical volume


> I am trying to create volume group and physical volume.
>
>
> when i do vgscan
>
> helena:/etc # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "helena_vg"
> vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of volume
> group)
> vgscan -- ERROR "lv_read_all_lv(): number of LV" creating "/etc/lvmtab"
and
> "/e"
>
> the conf file for helena_vg is not to be found. how can i completely
remove
> it.
>
> helena:/etc # vgremove helena_vg
> vgremove -- volume group "helena_vg" doesn't exist
>
> then i want to remove this PV /dev/hda3
>
> pvscan -- inactive PV "/dev/hda3"  is associated to an unknown VG (run
> vgscan)
>
>
> narsimha
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
