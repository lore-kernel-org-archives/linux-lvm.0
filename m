In-Reply-To: <20040323145828.GB29071@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] It never rains...
Message-ID: <OFD57F1BB5.A54371B5-ON80256E63.00019BE4-80256E63.006E87AB@uk.ibm.com>
From: Chris Laycock <LAYCOCKC@uk.ibm.com>
Date: Fri, 26 Mar 2004 20:08:42 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 006E87A580256E63_="
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
--=_alternative 006E87A580256E63_=
Content-Type: text/plain; charset="US-ASCII"

Heinz,

I now have two available PVs, if I craete a new VG / LV will I be able to 
pvmigrate (?) the data off these two drives or do I need to do some form 
of pv import?

Regards,

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
To:     Chris Laycock/UK/IBM@IBMGB
cc:     LVM general discussion and development <linux-lvm@redhat.com>, 
mauelshagen@redhat.com 
Subject:        Re: [linux-lvm] It never rains...


On Mon, Mar 22, 2004 at 04:20:42PM +0000, Chris Laycock wrote:
> Heinz, et al
> 
> Sorry I failed to explain clearly what has happened. I have in fact lost 
2 
> disks. 1 disk contained to /boot, / and the swap space, the other disk I 

> lost was from a 3 disk LVM called datavg.
> 
> I have rebuilt the system on a new disk but I have lost /etc/lvmconf, 
> therefore (I assume) I have no metadata to restore the VG from. 

Unless you have actual backups of /etc/lvmconf somewhere, I'm afraid so.

> 
> Unfortunately I don't have access to the system until later tonight to 
> test if you did in fact understand my poor explanation! 

If you really don't have actual LVM metadata backups:

in order to get to the other 2 PVs out of 3 in your VG, you want to use 
LVM2
and device-mapper and run "vgscan --partial".

Regards,
Heinz    -- The LVM Guy --


> 
> Many thanks,
> 
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
> 
> Please respond to mauelshagen@redhat.com; Please respond to LVM general 
> discussion and development <linux-lvm@redhat.com> 
> Sent by:        linux-lvm-bounces@redhat.com
> To:     LVM general discussion and development <linux-lvm@redhat.com>
> cc:     hjm@redhat.com 
> Subject:        Re: [linux-lvm] It never rains...
> 
> 
> 
> On Sat, Mar 20, 2004 at 08:02:03AM +0000, Chris Laycock wrote:
> > Hi All, 
> > 
> > Had a bit a disaster, lost 1 disk from a 3 disk VG and the root 
> partition! 
> > All  on fully patched RH 9 system.
> > I realise that I need to attach the 2 remaining PV to a LV and VG but 
if 
> I 
> > do the usual vgcreate, lvcreate & pvcreate I'll end up with two 
dataless 
> 
> > disks.
> 
> No, you need to replace the failed drive, pvcreate the new one (same 
size
> as the dead one!) and vgcfgrestore the LVM metadata (see /etc/lvmconf/ 
and
> the vgcfgrestore manual page) to it in order to be able to 
vgscan+vgchange
> successfully.
> 
> Presumably your 2 surviving drives have most of the data allocated you 
> should
> be able to gain access to (most of) your data.
> lvdisplay -v ... and pvdisplay -v ... are your friends to display the
> actual mappings of LVs to PVs and vice/versa once you recovered
> with vgcfgrestore.
> 
> 
> > I luckly do have backups of some of the more important data but there 
> not 
> > a recenct as I'd like and don't contain all of the data or the root 
> > partition.
> 
> If critical data is allocated to the dead drive (eg, start of LV and
> a contained filesystem), you're in trouble and your (out-of-date) backup
> is your best bet.
> 
> FYI: LVM2 has a --partial option for vgchange which will activate your 
VG
>      ignoring any missing PVs.
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> 
> > 
> > Outputs from:
> > 
> > vgscan
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data 
of 
> 
> > volume group "datavg" from physical volume(s)
> > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > vgscan -- WARNING: This program does not do a VGDA backup of your 
volume 
> 
> > group
> > 
> > pvscan
> > pvscan -- reading all physical volumes (this may take a while...)
> > pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG 
"datavg" 
> > (run vgscan)
> > pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG 
"datavg" 
> > (run vgscan)
> > pvscan -- total: 2 [45.75 GB] / in use: 2 [45.75 GB] / in no VG: 0 [0]
> > 
> > pvdisplay /dev/hdc1
> > 
> > --- Physical volume ---
> > PV Name               /dev/hdc1
> > VG Name               datavg
> > PV Size               37.28 GB [78172227 secs] / NOT usable 4.19 MB 
> [LVM: 
> > 165 KB]
> > PV#                   2
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                1
> > PE Size (KByte)       4096
> > Total PE              9541
> > Free PE               0
> > Allocated PE          9541
> > PV UUID               vozLHH-585D-SSjH-XM9b-A8g2-888k-5tZWI0
> > 
> > The two remaining disks are /dev/hdc1 & /dev/sda1
> > 
> > Thanks in advance
> > 
> > Regards,
> > Chris.
> > 
> > -------------------
> > Chris Laycock
> > IT Specialist 
> > IBM Global Services (IDO)
> > 
> > LITS, Stevenage
> > Mail point: K3 STEV UK
> > Email: LaycockC@uk.ibm.com
> > Tel : (01438) 76-9460  (internal: 44-9460)
> > 
> 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

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


--=_alternative 006E87A580256E63_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Heinz,</font>
<br>
<br><font size=2 face="sans-serif">I now have two available PVs, if I craete
a new VG / LV will I be able to pvmigrate (?) the data off these two drives
or do I need to do some form of pv import?</font>
<br>
<br><font size=2 face="sans-serif">Regards,<br>
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
&nbsp;</font><font size=1 face="sans-serif">Chris Laycock/UK/IBM@IBMGB</font>
<br><font size=1 color=#800080 face="sans-serif">cc: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">LVM general discussion
and development &lt;linux-lvm@redhat.com&gt;, mauelshagen@redhat.com</font><font size=1 color=#800080 face="sans-serif">
</font>
<br><font size=1 color=#800080 face="sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=1 face="sans-serif">Re: [linux-lvm]
It never rains...</font>
<br>
<br>
<br><font size=2><tt>On Mon, Mar 22, 2004 at 04:20:42PM +0000, Chris Laycock
wrote:<br>
&gt; Heinz, et al<br>
&gt; <br>
&gt; Sorry I failed to explain clearly what has happened. I have in fact
lost 2 <br>
&gt; disks. 1 disk contained to /boot, / and the swap space, the other
disk I <br>
&gt; lost was from a 3 disk LVM called datavg.<br>
&gt; <br>
&gt; I have rebuilt the system on a new disk but I have lost /etc/lvmconf,
<br>
&gt; therefore (I assume) I have no metadata to restore the VG from. <br>
<br>
Unless you have actual backups of /etc/lvmconf somewhere, I'm afraid so.<br>
<br>
&gt; <br>
&gt; Unfortunately I don't have access to the system until later tonight
to <br>
&gt; test if you did in fact understand my poor explanation! <br>
<br>
If you really don't have actual LVM metadata backups:<br>
<br>
in order to get to the other 2 PVs out of 3 in your VG, you want to use
LVM2<br>
and device-mapper and run &quot;vgscan --partial&quot;.<br>
<br>
Regards,<br>
Heinz &nbsp; &nbsp;-- The LVM Guy --<br>
<br>
<br>
&gt; <br>
&gt; Many thanks,<br>
&gt; <br>
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
&gt; <br>
&gt; Please respond to mauelshagen@redhat.com; Please respond to LVM general
<br>
&gt; discussion and development &lt;linux-lvm@redhat.com&gt; <br>
&gt; Sent by: &nbsp; &nbsp; &nbsp; &nbsp;linux-lvm-bounces@redhat.com<br>
&gt; To: &nbsp; &nbsp; LVM general discussion and development &lt;linux-lvm@redhat.com&gt;<br>
&gt; cc: &nbsp; &nbsp; hjm@redhat.com <br>
&gt; Subject: &nbsp; &nbsp; &nbsp; &nbsp;Re: [linux-lvm] It never rains...<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Sat, Mar 20, 2004 at 08:02:03AM +0000, Chris Laycock wrote:<br>
&gt; &gt; Hi All, <br>
&gt; &gt; <br>
&gt; &gt; Had a bit a disaster, lost 1 disk from a 3 disk VG and the root
<br>
&gt; partition! <br>
&gt; &gt; All &nbsp;on fully patched RH 9 system.<br>
&gt; &gt; I realise that I need to attach the 2 remaining PV to a LV and
VG but if <br>
&gt; I <br>
&gt; &gt; do the usual vgcreate, lvcreate &amp; pvcreate I'll end up with
two dataless <br>
&gt; <br>
&gt; &gt; disks.<br>
&gt; <br>
&gt; No, you need to replace the failed drive, pvcreate the new one (same
size<br>
&gt; as the dead one!) and vgcfgrestore the LVM metadata (see /etc/lvmconf/
and<br>
&gt; the vgcfgrestore manual page) to it in order to be able to vgscan+vgchange<br>
&gt; successfully.<br>
&gt; <br>
&gt; Presumably your 2 surviving drives have most of the data allocated
you <br>
&gt; should<br>
&gt; be able to gain access to (most of) your data.<br>
&gt; lvdisplay -v ... and pvdisplay -v ... are your friends to display
the<br>
&gt; actual mappings of LVs to PVs and vice/versa once you recovered<br>
&gt; with vgcfgrestore.<br>
&gt; <br>
&gt; <br>
&gt; &gt; I luckly do have backups of some of the more important data but
there <br>
&gt; not <br>
&gt; &gt; a recenct as I'd like and don't contain all of the data or the
root <br>
&gt; &gt; partition.<br>
&gt; <br>
&gt; If critical data is allocated to the dead drive (eg, start of LV and<br>
&gt; a contained filesystem), you're in trouble and your (out-of-date)
backup<br>
&gt; is your best bet.<br>
&gt; <br>
&gt; FYI: LVM2 has a --partial option for vgchange which will activate
your VG<br>
&gt; &nbsp; &nbsp; &nbsp;ignoring any missing PVs.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Heinz &nbsp; &nbsp;-- The LVM Guy --<br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; Outputs from:<br>
&gt; &gt; <br>
&gt; &gt; vgscan<br>
&gt; &gt; vgscan -- reading all physical volumes (this may take a while...)<br>
&gt; &gt; vgscan -- ERROR &quot;vg_read_with_pv_and_lv(): current PV&quot;
can't get data of <br>
&gt; <br>
&gt; &gt; volume group &quot;datavg&quot; from physical volume(s)<br>
&gt; &gt; vgscan -- &quot;/etc/lvmtab&quot; and &quot;/etc/lvmtab.d&quot;
successfully created<br>
&gt; &gt; vgscan -- WARNING: This program does not do a VGDA backup of
your volume <br>
&gt; <br>
&gt; &gt; group<br>
&gt; &gt; <br>
&gt; &gt; pvscan<br>
&gt; &gt; pvscan -- reading all physical volumes (this may take a while...)<br>
&gt; &gt; pvscan -- inactive PV &quot;/dev/sda1&quot; &nbsp;is associated
to unknown VG &quot;datavg&quot; <br>
&gt; &gt; (run vgscan)<br>
&gt; &gt; pvscan -- inactive PV &quot;/dev/hdc1&quot; &nbsp;is associated
to unknown VG &quot;datavg&quot; <br>
&gt; &gt; (run vgscan)<br>
&gt; &gt; pvscan -- total: 2 [45.75 GB] / in use: 2 [45.75 GB] / in no
VG: 0 [0]<br>
&gt; &gt; <br>
&gt; &gt; pvdisplay /dev/hdc1<br>
&gt; &gt; <br>
&gt; &gt; --- Physical volume ---<br>
&gt; &gt; PV Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /dev/hdc1<br>
&gt; &gt; VG Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; datavg<br>
&gt; &gt; PV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 37.28
GB [78172227 secs] / NOT usable 4.19 MB <br>
&gt; [LVM: <br>
&gt; &gt; 165 KB]<br>
&gt; &gt; PV# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
2<br>
&gt; &gt; PV Status &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; available<br>
&gt; &gt; Allocatable &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes (but full)<br>
&gt; &gt; Cur LV &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1<br>
&gt; &gt; PE Size (KByte) &nbsp; &nbsp; &nbsp; 4096<br>
&gt; &gt; Total PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9541<br>
&gt; &gt; Free PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0<br>
&gt; &gt; Allocated PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;9541<br>
&gt; &gt; PV UUID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vozLHH-585D-SSjH-XM9b-A8g2-888k-5tZWI0<br>
&gt; &gt; <br>
&gt; &gt; The two remaining disks are /dev/hdc1 &amp; /dev/sda1<br>
&gt; &gt; <br>
&gt; &gt; Thanks in advance<br>
&gt; &gt; <br>
&gt; &gt; Regards,<br>
&gt; &gt; Chris.<br>
&gt; &gt; <br>
&gt; &gt; -------------------<br>
&gt; &gt; Chris Laycock<br>
&gt; &gt; IT Specialist <br>
&gt; &gt; IBM Global Services (IDO)<br>
&gt; &gt; <br>
&gt; &gt; LITS, Stevenage<br>
&gt; &gt; Mail point: K3 STEV UK<br>
&gt; &gt; Email: LaycockC@uk.ibm.com<br>
&gt; &gt; Tel : (01438) 76-9460 &nbsp;(internal: 44-9460)<br>
&gt; &gt; <br>
&gt; <br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; linux-lvm mailing list<br>
&gt; &gt; linux-lvm@redhat.com<br>
&gt; &gt; https://www.redhat.com/mailman/listinfo/linux-lvm<br>
&gt; &gt; read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; linux-lvm@redhat.com<br>
&gt; https://www.redhat.com/mailman/listinfo/linux-lvm<br>
&gt; read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
&gt; <br>
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
--=_alternative 006E87A580256E63_=--
