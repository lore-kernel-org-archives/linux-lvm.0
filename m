In-Reply-To: <20040322100443.GA11567@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] It never rains...
Message-ID: <OF6A31DE83.6DD8A933-ON80256E5F.0056D8B4-80256E5F.0059CA24@uk.ibm.com>
From: Chris Laycock <LAYCOCKC@uk.ibm.com>
Date: Mon, 22 Mar 2004 16:20:42 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 0059CA2180256E5F_="
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

This is a multipart message in MIME format.
--=_alternative 0059CA2180256E5F_=
Content-Type: text/plain; charset="US-ASCII"

Heinz, et al

Sorry I failed to explain clearly what has happened. I have in fact lost 2 
disks. 1 disk contained to /boot, / and the swap space, the other disk I 
lost was from a 3 disk LVM called datavg.

I have rebuilt the system on a new disk but I have lost /etc/lvmconf, 
therefore (I assume) I have no metadata to restore the VG from. 

Unfortunately I don't have access to the system until later tonight to 
test if you did in fact understand my poor explanation! 

Many thanks,

Chris.

-------------------
Chris Laycock
IT Specialist 
IBM Global Services (IDO)

LITS, Stevenage
Mail point: K3 STEV UK
Email: LaycockC@uk.ibm.com
Tel : (01438) 76-9460  (internal: 44-9460)


Please respond to mauelshagen@redhat.com; Please respond to LVM general 
discussion and development <linux-lvm@redhat.com> 
Sent by:        linux-lvm-bounces@redhat.com
To:     LVM general discussion and development <linux-lvm@redhat.com>
cc:     hjm@redhat.com 
Subject:        Re: [linux-lvm] It never rains...



On Sat, Mar 20, 2004 at 08:02:03AM +0000, Chris Laycock wrote:
> Hi All, 
> 
> Had a bit a disaster, lost 1 disk from a 3 disk VG and the root 
partition! 
> All  on fully patched RH 9 system.
> I realise that I need to attach the 2 remaining PV to a LV and VG but if 
I 
> do the usual vgcreate, lvcreate & pvcreate I'll end up with two dataless 

> disks.

No, you need to replace the failed drive, pvcreate the new one (same size
as the dead one!) and vgcfgrestore the LVM metadata (see /etc/lvmconf/ and
the vgcfgrestore manual page) to it in order to be able to vgscan+vgchange
successfully.

Presumably your 2 surviving drives have most of the data allocated you 
should
be able to gain access to (most of) your data.
lvdisplay -v ... and pvdisplay -v ... are your friends to display the
actual mappings of LVs to PVs and vice/versa once you recovered
with vgcfgrestore.


> I luckly do have backups of some of the more important data but there 
not 
> a recenct as I'd like and don't contain all of the data or the root 
> partition.

If critical data is allocated to the dead drive (eg, start of LV and
a contained filesystem), you're in trouble and your (out-of-date) backup
is your best bet.

FYI: LVM2 has a --partial option for vgchange which will activate your VG
     ignoring any missing PVs.

Regards,
Heinz    -- The LVM Guy --


> 
> Outputs from:
> 
> vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 

> volume group "datavg" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume 

> group
> 
> pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG "datavg" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "datavg" 
> (run vgscan)
> pvscan -- total: 2 [45.75 GB] / in use: 2 [45.75 GB] / in no VG: 0 [0]
> 
> pvdisplay /dev/hdc1
> 
> --- Physical volume ---
> PV Name               /dev/hdc1
> VG Name               datavg
> PV Size               37.28 GB [78172227 secs] / NOT usable 4.19 MB 
[LVM: 
> 165 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              9541
> Free PE               0
> Allocated PE          9541
> PV UUID               vozLHH-585D-SSjH-XM9b-A8g2-888k-5tZWI0
> 
> The two remaining disks are /dev/hdc1 & /dev/sda1
> 
> Thanks in advance
> 
> Regards,
> Chris.
> 
> -------------------
> Chris Laycock
> IT Specialist 
> IBM Global Services (IDO)
> 
> LITS, Stevenage
> Mail point: K3 STEV UK
> Email: LaycockC@uk.ibm.com
> Tel : (01438) 76-9460  (internal: 44-9460)
> 

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--=_alternative 0059CA2180256E5F_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Heinz, et al</font>
<br>
<br><font size=2 face="sans-serif">Sorry I failed to explain clearly what
has happened. I have in fact lost 2 disks. 1 disk contained to /boot, /
and the swap space, the other disk I lost was from a 3 disk LVM called
datavg.</font>
<br>
<br><font size=2 face="sans-serif">I have rebuilt the system on a new disk
but I have lost /etc/lvmconf, therefore (I assume) I have no metadata to
restore the VG from. </font>
<br>
<br><font size=2 face="sans-serif">Unfortunately I don't have access to
the system until later tonight to test if you did in fact understand my
poor explanation! </font>
<br>
<br><font size=2 face="sans-serif">Many thanks,<br>
<br>
Chris.<br>
<br>
-------------------<br>
Chris Laycock<br>
IT Specialist <br>
IBM Global Services (IDO)<br>
<br>
LITS, Stevenage<br>
Mail point: K3 STEV UK<br>
Email: LaycockC@uk.ibm.com<br>
Tel : (01438) 76-9460 &nbsp;(internal: 44-9460)<br>
<br>
</font>
<p><font size=1 color=#800080 face="sans-serif">Please respond to mauelshagen@redhat.com;
Please respond to LVM general discussion and development &lt;linux-lvm@redhat.com&gt;
</font>
<p><font size=1 color=#800080 face="sans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;linux-lvm-bounces@redhat.com</font>
<p><font size=1 color=#800080 face="sans-serif">To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">LVM general discussion
and development &lt;linux-lvm@redhat.com&gt;</font>
<br><font size=1 color=#800080 face="sans-serif">cc: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">hjm@redhat.com</font><font size=1 color=#800080 face="sans-serif">
</font>
<br><font size=1 color=#800080 face="sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=1 face="sans-serif">Re: [linux-lvm]
It never rains...</font>
<br>
<br>
<br><font size=2><tt><br>
On Sat, Mar 20, 2004 at 08:02:03AM +0000, Chris Laycock wrote:<br>
&gt; Hi All, <br>
&gt; <br>
&gt; Had a bit a disaster, lost 1 disk from a 3 disk VG and the root partition!
<br>
&gt; All &nbsp;on fully patched RH 9 system.<br>
&gt; I realise that I need to attach the 2 remaining PV to a LV and VG
but if I <br>
&gt; do the usual vgcreate, lvcreate &amp; pvcreate I'll end up with two
dataless <br>
&gt; disks.<br>
<br>
No, you need to replace the failed drive, pvcreate the new one (same size<br>
as the dead one!) and vgcfgrestore the LVM metadata (see /etc/lvmconf/
and<br>
the vgcfgrestore manual page) to it in order to be able to vgscan+vgchange<br>
successfully.<br>
<br>
Presumably your 2 surviving drives have most of the data allocated you
should<br>
be able to gain access to (most of) your data.<br>
lvdisplay -v ... and pvdisplay -v ... are your friends to display the<br>
actual mappings of LVs to PVs and vice/versa once you recovered<br>
with vgcfgrestore.<br>
<br>
<br>
&gt; I luckly do have backups of some of the more important data but there
not <br>
&gt; a recenct as I'd like and don't contain all of the data or the root
<br>
&gt; partition.<br>
<br>
If critical data is allocated to the dead drive (eg, start of LV and<br>
a contained filesystem), you're in trouble and your (out-of-date) backup<br>
is your best bet.<br>
<br>
FYI: LVM2 has a --partial option for vgchange which will activate your
VG<br>
 &nbsp; &nbsp; ignoring any missing PVs.<br>
<br>
Regards,<br>
Heinz &nbsp; &nbsp;-- The LVM Guy --<br>
<br>
<br>
&gt; <br>
&gt; Outputs from:<br>
&gt; <br>
&gt; vgscan<br>
&gt; vgscan -- reading all physical volumes (this may take a while...)<br>
&gt; vgscan -- ERROR &quot;vg_read_with_pv_and_lv(): current PV&quot; can't
get data of <br>
&gt; volume group &quot;datavg&quot; from physical volume(s)<br>
&gt; vgscan -- &quot;/etc/lvmtab&quot; and &quot;/etc/lvmtab.d&quot; successfully
created<br>
&gt; vgscan -- WARNING: This program does not do a VGDA backup of your
volume <br>
&gt; group<br>
&gt; <br>
&gt; pvscan<br>
&gt; pvscan -- reading all physical volumes (this may take a while...)<br>
&gt; pvscan -- inactive PV &quot;/dev/sda1&quot; &nbsp;is associated to
unknown VG &quot;datavg&quot; <br>
&gt; (run vgscan)<br>
&gt; pvscan -- inactive PV &quot;/dev/hdc1&quot; &nbsp;is associated to
unknown VG &quot;datavg&quot; <br>
&gt; (run vgscan)<br>
&gt; pvscan -- total: 2 [45.75 GB] / in use: 2 [45.75 GB] / in no VG: 0
[0]<br>
&gt; <br>
&gt; pvdisplay /dev/hdc1<br>
&gt; <br>
&gt; --- Physical volume ---<br>
&gt; PV Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /dev/hdc1<br>
&gt; VG Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; datavg<br>
&gt; PV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 37.28 GB
[78172227 secs] / NOT usable 4.19 MB [LVM: <br>
&gt; 165 KB]<br>
&gt; PV# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
2<br>
&gt; PV Status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; available<br>
&gt; Allocatable &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes (but full)<br>
&gt; Cur LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1<br>
&gt; PE Size (KByte) &nbsp; &nbsp; &nbsp; 4096<br>
&gt; Total PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9541<br>
&gt; Free PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0<br>
&gt; Allocated PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9541<br>
&gt; PV UUID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vozLHH-585D-SSjH-XM9b-A8g2-888k-5tZWI0<br>
&gt; <br>
&gt; The two remaining disks are /dev/hdc1 &amp; /dev/sda1<br>
&gt; <br>
&gt; Thanks in advance<br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris.<br>
&gt; <br>
&gt; -------------------<br>
&gt; Chris Laycock<br>
&gt; IT Specialist <br>
&gt; IBM Global Services (IDO)<br>
&gt; <br>
&gt; LITS, Stevenage<br>
&gt; Mail point: K3 STEV UK<br>
&gt; Email: LaycockC@uk.ibm.com<br>
&gt; Tel : (01438) 76-9460 &nbsp;(internal: 44-9460)<br>
&gt; <br>
<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; linux-lvm@redhat.com<br>
&gt; https://www.redhat.com/mailman/listinfo/linux-lvm<br>
&gt; read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
<br>
*** Software bugs are stupid.<br>
 &nbsp; &nbsp;Nevertheless it needs not so stupid people to solve them
***<br>
<br>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-<br>
<br>
Heinz Mauelshagen &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Red Hat GmbH<br>
Consulting Development Engineer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; Am Sonnenhang 11<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;56242 Marienrachdorf<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;Germany<br>
Mauelshagen@RedHat.com &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;+49 2626 141200<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FAX 924446<br>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
https://www.redhat.com/mailman/listinfo/linux-lvm<br>
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
</tt></font>
<br>
--=_alternative 0059CA2180256E5F_=--
