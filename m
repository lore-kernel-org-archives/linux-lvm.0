Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4SE7vGh016723
	for <linux-lvm@redhat.com>; Thu, 28 May 2009 10:07:57 -0400
Received: from fela.liber4e.com (fela.liber4e.com [208.77.96.130])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n4SE7dbu022167
	for <linux-lvm@redhat.com>; Thu, 28 May 2009 10:07:39 -0400
Received: from libermobile.liber4e.home (fela.liber4e.com [127.0.0.1])
	(authenticated bits=0)
	by fela.liber4e.com (8.14.2/8.14.2) with ESMTP id n4SE5ARA009546
	for <linux-lvm@redhat.com>; Thu, 28 May 2009 15:05:21 +0100
From: jose nuno neto <jose.neto@liber4e.com>
Subject: Re: [linux-lvm] Failed to activate snapshot exception store.
Date: Thu, 28 May 2009 14:40:52 +0100
References: <200905261801.49236.jose.neto@liber4e.com>
	<E139DBFB-B6E2-411F-A377-A07505672C20@redhat.com>
In-Reply-To: <E139DBFB-B6E2-411F-A377-A07505672C20@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="Boundary-00=_lRpHK6VP3LwS8o+"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905281440.53176.jose.neto@liber4e.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--Boundary-00=_lRpHK6VP3LwS8o+
Content-Type: text/plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit

Hi,

Thanks for the reply :-)

If I take the --test, yes the snapshot gets created
But if I try to create a new VG and after a new LV I get the same error. I can 
the work I was supposed to do, but would like to understand what's going 
on......

lvcreate -L 1G -n TEST  vg_mysql_bk
Aborting. Failed to activate new LV to wipe the start of it.

vgdisplay -v vg_mysql_bk
    Using volume group(s) on command line
    Finding volume group "vg_mysql_bk"
  --- Volume group ---
  VG Name               vg_mysql_bk
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               250.00 GB
  PE Size               4.00 MB
  Total PE              63999
  Alloc PE / Size       0 / 0
  Free  PE / Size       63999 / 250.00 GB
  VG UUID               orekvq-dWqZ-uXs8-gETe-WkyG-adTO-YHdHPh

  --- Physical volumes ---
  PV Name               /dev/sdl1
  PV UUID               pw80TN-xYP2-FY4T-ASWF-PpIe-j6vo-WNQTtG
  PV Status             allocatable
  Total PE / Free PE    63999 / 63999



On Tuesday 26 May 2009 21:30:40 Jonathan Brassow wrote:
> what happens if you remove the '--test' from your command?
>
>   brassow
>
> On May 26, 2009, at 12:01 PM, jose nuno neto wrote:
> > HI
> >
> > I'm running into some problems with lvm on redhat.
> > I'm trying to create a snapshot but gives always a error
> > " Aborting. Failed to activate snapshot exception store."
> >
> > Also when I try to create a new volume and create new logical
> > volumes I get the same error
> >
> > This is the output of the lvcreate -s and vgdisplay
> > Any ideas/hints are apreciated
> >
> > Thanks
> > Jose Nuno Neto
> >
> >
> >
> > lvcreate --test -L 504M -n SnapTest -i2 -s /dev/vgdb/lvdb02
> > Test mode: Metadata will NOT be updated.
> > Using default stripesize 64.00 KB
> > Rounding size (63 extents) up to stripe boundary size (64 extents)
> > Aborting. Failed to activate snapshot exception store.
> >
> >
> >
> > --- Volume group ---
> > VG Name vgdb
> > System ID
> > Format lvm2
> > Metadata Areas 5
> > Metadata Sequence No 126
> > VG Access read/write
> > VG Status resizable
> > MAX LV 0
> > Cur LV 2
> > Open LV 2
> > Max PV 0
> > Cur PV 5
> > Act PV 5
> > VG Size 249.96 GB
> > PE Size 8.00 MB
> > Total PE 31995
> > Alloc PE / Size 30976 / 242.00 GB
> > Free PE / Size 1019 / 7.96 GB
> > VG UUID FqqBnv-EKiI-TXA2-GR3C-b4i0-XTeq-xPxpVa
> >
> > --- Logical volume ---
> > LV Name /dev/vgdb/lvdb01
> > VG Name vgdb
> > LV UUID 0F2fNt-m2n5-MpJ8-dMNS-Xwzb-QsvS-LyHefm
> > LV Write Access read/write
> > LV Status available
> > # open 1
> > LV Size 2.00 GB
> > Current LE 256
> > Segments 1
> > Allocation inherit
> > Read ahead sectors auto
> > - currently set to 256
> > Block device 253:4
> >
> > --- Logical volume ---
> > LV Name /dev/vgdb/lvdb02
> > VG Name vgdb
> > LV UUID 7Q038a-7FfX-AhBo-djfL-chFO-MI3N-vzdcbo
> > LV Write Access read/write
> > LV Status available
> > # open 1
> > LV Size 240.00 GB
> > Current LE 30720
> > Segments 3
> > Allocation inherit
> > Read ahead sectors auto
> > - currently set to 256
> > Block device 253:5
> >
> >
> >
> > --- Physical volumes ---
> > PV Name /dev/sdh1
> > PV UUID 13EWPc-BeSd-w1ub-wbhM-c3Ff-pi7U-KWDkxr
> > PV Status allocatable
> > Total PE / Free PE 6399 / 0
> >
> >
> >
> > PV Name /dev/sdi1
> > PV UUID 14OQ42-xq0w-xln5-z9ts-PHKF-goXA-X9qzTE
> > PV Status allocatable
> > Total PE / Free PE 6399 / 255
> >
> >
> >
> > PV Name /dev/sdj1
> > PV UUID U3h5F6-g6Wt-MNMb-AHyy-BP2R-BWf1-6LNm55
> > PV Status allocatable
> > Total PE / Free PE 6399 / 255
> >
> >
> >
> > PV Name /dev/sdk1
> > PV UUID qkpbY5-dvGg-Z1Xb-3cEM-sidS-frbr-pCe8Bk
> > PV Status allocatable
> > Total PE / Free PE 6399 / 255
> >
> >
> >
> > PV Name /dev/sdb1
> > PV UUID WtDVja-1Q9u-Tgr8-bCU3-qlqS-lahj-m1p2cU
> > PV Status allocatable
> > Total PE / Free PE 6399 / 254
> >
> >
> >
> >
> > --
> > This message has been scanned for viruses and
> > dangerous content by MailScanner, and is
> > believed to be clean. _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


--Boundary-00=_lRpHK6VP3LwS8o+
Content-Type: text/html;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd"><html><head><meta name="qrichtext" content="1" /><style type="text/css">p, li { white-space: pre-wrap; }</style></head><body style=" font-family:'Sans Serif'; font-size:14pt; font-weight:400; font-style:normal;">Hi,<br>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p>Thanks for the reply :-)<br>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p>If I take the --test, yes the snapshot gets created<br>
But if I try to create a new VG and after a new LV I get the same error. I can the work I was supposed to do, but would like to understand what's going on......<br>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p>lvcreate -L 1G -n TEST  vg_mysql_bk<br>
Aborting. Failed to activate new LV to wipe the start of it.<br>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p>vgdisplay -v vg_mysql_bk<br>
    Using volume group(s) on command line<br>
    Finding volume group "vg_mysql_bk"<br>
  --- Volume group ---<br>
  VG Name               vg_mysql_bk<br>
  System ID<br>
  Format                lvm2<br>
  Metadata Areas        1<br>
  Metadata Sequence No  3<br>
  VG Access             read/write<br>
  VG Status             resizable<br>
  MAX LV                0<br>
  Cur LV                0<br>
  Open LV               0<br>
  Max PV                0<br>
  Cur PV                1<br>
  Act PV                1<br>
  VG Size               250.00 GB<br>
  PE Size               4.00 MB<br>
  Total PE              63999<br>
  Alloc PE / Size       0 / 0<br>
  Free  PE / Size       63999 / 250.00 GB<br>
  VG UUID               orekvq-dWqZ-uXs8-gETe-WkyG-adTO-YHdHPh<br>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p>  --- Physical volumes ---<br>
  PV Name               /dev/sdl1<br>
  PV UUID               pw80TN-xYP2-FY4T-ASWF-PpIe-j6vo-WNQTtG<br>
  PV Status             allocatable<br>
  Total PE / Free PE    63999 / 63999<br>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p><p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p><p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p>On Tuesday 26 May 2009 21:30:40 Jonathan Brassow wrote:<br>
&gt; what happens if you remove the '--test' from your command?<br>
&gt;<br>
&gt;   brassow<br>
&gt;<br>
&gt; On May 26, 2009, at 12:01 PM, jose nuno neto wrote:<br>
&gt; &gt; HI<br>
&gt; &gt;<br>
&gt; &gt; I'm running into some problems with lvm on redhat.<br>
&gt; &gt; I'm trying to create a snapshot but gives always a error<br>
&gt; &gt; " Aborting. Failed to activate snapshot exception store."<br>
&gt; &gt;<br>
&gt; &gt; Also when I try to create a new volume and create new logical<br>
&gt; &gt; volumes I get the same error<br>
&gt; &gt;<br>
&gt; &gt; This is the output of the lvcreate -s and vgdisplay<br>
&gt; &gt; Any ideas/hints are apreciated<br>
&gt; &gt;<br>
&gt; &gt; Thanks<br>
&gt; &gt; Jose Nuno Neto<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; lvcreate --test -L 504M -n SnapTest -i2 -s /dev/vgdb/lvdb02<br>
&gt; &gt; Test mode: Metadata will NOT be updated.<br>
&gt; &gt; Using default stripesize 64.00 KB<br>
&gt; &gt; Rounding size (63 extents) up to stripe boundary size (64 extents)<br>
&gt; &gt; Aborting. Failed to activate snapshot exception store.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --- Volume group ---<br>
&gt; &gt; VG Name vgdb<br>
&gt; &gt; System ID<br>
&gt; &gt; Format lvm2<br>
&gt; &gt; Metadata Areas 5<br>
&gt; &gt; Metadata Sequence No 126<br>
&gt; &gt; VG Access read/write<br>
&gt; &gt; VG Status resizable<br>
&gt; &gt; MAX LV 0<br>
&gt; &gt; Cur LV 2<br>
&gt; &gt; Open LV 2<br>
&gt; &gt; Max PV 0<br>
&gt; &gt; Cur PV 5<br>
&gt; &gt; Act PV 5<br>
&gt; &gt; VG Size 249.96 GB<br>
&gt; &gt; PE Size 8.00 MB<br>
&gt; &gt; Total PE 31995<br>
&gt; &gt; Alloc PE / Size 30976 / 242.00 GB<br>
&gt; &gt; Free PE / Size 1019 / 7.96 GB<br>
&gt; &gt; VG UUID FqqBnv-EKiI-TXA2-GR3C-b4i0-XTeq-xPxpVa<br>
&gt; &gt;<br>
&gt; &gt; --- Logical volume ---<br>
&gt; &gt; LV Name /dev/vgdb/lvdb01<br>
&gt; &gt; VG Name vgdb<br>
&gt; &gt; LV UUID 0F2fNt-m2n5-MpJ8-dMNS-Xwzb-QsvS-LyHefm<br>
&gt; &gt; LV Write Access read/write<br>
&gt; &gt; LV Status available<br>
&gt; &gt; # open 1<br>
&gt; &gt; LV Size 2.00 GB<br>
&gt; &gt; Current LE 256<br>
&gt; &gt; Segments 1<br>
&gt; &gt; Allocation inherit<br>
&gt; &gt; Read ahead sectors auto<br>
&gt; &gt; - currently set to 256<br>
&gt; &gt; Block device 253:4<br>
&gt; &gt;<br>
&gt; &gt; --- Logical volume ---<br>
&gt; &gt; LV Name /dev/vgdb/lvdb02<br>
&gt; &gt; VG Name vgdb<br>
&gt; &gt; LV UUID 7Q038a-7FfX-AhBo-djfL-chFO-MI3N-vzdcbo<br>
&gt; &gt; LV Write Access read/write<br>
&gt; &gt; LV Status available<br>
&gt; &gt; # open 1<br>
&gt; &gt; LV Size 240.00 GB<br>
&gt; &gt; Current LE 30720<br>
&gt; &gt; Segments 3<br>
&gt; &gt; Allocation inherit<br>
&gt; &gt; Read ahead sectors auto<br>
&gt; &gt; - currently set to 256<br>
&gt; &gt; Block device 253:5<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --- Physical volumes ---<br>
&gt; &gt; PV Name /dev/sdh1<br>
&gt; &gt; PV UUID 13EWPc-BeSd-w1ub-wbhM-c3Ff-pi7U-KWDkxr<br>
&gt; &gt; PV Status allocatable<br>
&gt; &gt; Total PE / Free PE 6399 / 0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; PV Name /dev/sdi1<br>
&gt; &gt; PV UUID 14OQ42-xq0w-xln5-z9ts-PHKF-goXA-X9qzTE<br>
&gt; &gt; PV Status allocatable<br>
&gt; &gt; Total PE / Free PE 6399 / 255<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; PV Name /dev/sdj1<br>
&gt; &gt; PV UUID U3h5F6-g6Wt-MNMb-AHyy-BP2R-BWf1-6LNm55<br>
&gt; &gt; PV Status allocatable<br>
&gt; &gt; Total PE / Free PE 6399 / 255<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; PV Name /dev/sdk1<br>
&gt; &gt; PV UUID qkpbY5-dvGg-Z1Xb-3cEM-sidS-frbr-pCe8Bk<br>
&gt; &gt; PV Status allocatable<br>
&gt; &gt; Total PE / Free PE 6399 / 255<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; PV Name /dev/sdb1<br>
&gt; &gt; PV UUID WtDVja-1Q9u-Tgr8-bCU3-qlqS-lahj-m1p2cU<br>
&gt; &gt; PV Status allocatable<br>
&gt; &gt; Total PE / Free PE 6399 / 254<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; This message has been scanned for viruses and<br>
&gt; &gt; dangerous content by MailScanner, and is<br>
&gt; &gt; believed to be clean. _______________________________________________<br>
&gt; &gt; linux-lvm mailing list<br>
&gt; &gt; linux-lvm@redhat.com<br>
&gt; &gt; https://www.redhat.com/mailman/listinfo/linux-lvm<br>
&gt; &gt; read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p><br />-- 
<br />This message has been scanned for viruses and
<br />dangerous content by
<a href="http://www.mailscanner.info/"><b>MailScanner</b></a>, and is
<br />believed to be clean.
</body></html>

--Boundary-00=_lRpHK6VP3LwS8o+--
