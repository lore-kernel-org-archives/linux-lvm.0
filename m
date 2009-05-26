Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n4QKWhYk029648
	for <linux-lvm@redhat.com>; Tue, 26 May 2009 16:32:43 -0400
Message-Id: <E139DBFB-B6E2-411F-A377-A07505672C20@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <200905261801.49236.jose.neto@liber4e.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-31-922151682
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] Failed to activate snapshot exception store.
Date: Tue, 26 May 2009 15:30:40 -0500
References: <200905261801.49236.jose.neto@liber4e.com>
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


--Apple-Mail-31-922151682
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

what happens if you remove the '--test' from your command?

  brassow

On May 26, 2009, at 12:01 PM, jose nuno neto wrote:

> HI
>
> I'm running into some problems with lvm on redhat.
> I'm trying to create a snapshot but gives always a error
> " Aborting. Failed to activate snapshot exception store."
>
> Also when I try to create a new volume and create new logical  
> volumes I get the same error
>
> This is the output of the lvcreate -s and vgdisplay
> Any ideas/hints are apreciated
>
> Thanks
> Jose Nuno Neto
>
>
>
> lvcreate --test -L 504M -n SnapTest -i2 -s /dev/vgdb/lvdb02
> Test mode: Metadata will NOT be updated.
> Using default stripesize 64.00 KB
> Rounding size (63 extents) up to stripe boundary size (64 extents)
> Aborting. Failed to activate snapshot exception store.
>
>
>
> --- Volume group ---
> VG Name vgdb
> System ID
> Format lvm2
> Metadata Areas 5
> Metadata Sequence No 126
> VG Access read/write
> VG Status resizable
> MAX LV 0
> Cur LV 2
> Open LV 2
> Max PV 0
> Cur PV 5
> Act PV 5
> VG Size 249.96 GB
> PE Size 8.00 MB
> Total PE 31995
> Alloc PE / Size 30976 / 242.00 GB
> Free PE / Size 1019 / 7.96 GB
> VG UUID FqqBnv-EKiI-TXA2-GR3C-b4i0-XTeq-xPxpVa
>
> --- Logical volume ---
> LV Name /dev/vgdb/lvdb01
> VG Name vgdb
> LV UUID 0F2fNt-m2n5-MpJ8-dMNS-Xwzb-QsvS-LyHefm
> LV Write Access read/write
> LV Status available
> # open 1
> LV Size 2.00 GB
> Current LE 256
> Segments 1
> Allocation inherit
> Read ahead sectors auto
> - currently set to 256
> Block device 253:4
>
> --- Logical volume ---
> LV Name /dev/vgdb/lvdb02
> VG Name vgdb
> LV UUID 7Q038a-7FfX-AhBo-djfL-chFO-MI3N-vzdcbo
> LV Write Access read/write
> LV Status available
> # open 1
> LV Size 240.00 GB
> Current LE 30720
> Segments 3
> Allocation inherit
> Read ahead sectors auto
> - currently set to 256
> Block device 253:5
>
>
>
> --- Physical volumes ---
> PV Name /dev/sdh1
> PV UUID 13EWPc-BeSd-w1ub-wbhM-c3Ff-pi7U-KWDkxr
> PV Status allocatable
> Total PE / Free PE 6399 / 0
>
>
>
> PV Name /dev/sdi1
> PV UUID 14OQ42-xq0w-xln5-z9ts-PHKF-goXA-X9qzTE
> PV Status allocatable
> Total PE / Free PE 6399 / 255
>
>
>
> PV Name /dev/sdj1
> PV UUID U3h5F6-g6Wt-MNMb-AHyy-BP2R-BWf1-6LNm55
> PV Status allocatable
> Total PE / Free PE 6399 / 255
>
>
>
> PV Name /dev/sdk1
> PV UUID qkpbY5-dvGg-Z1Xb-3cEM-sidS-frbr-pCe8Bk
> PV Status allocatable
> Total PE / Free PE 6399 / 255
>
>
>
> PV Name /dev/sdb1
> PV UUID WtDVja-1Q9u-Tgr8-bCU3-qlqS-lahj-m1p2cU
> PV Status allocatable
> Total PE / Free PE 6399 / 254
>
>
>
>
> -- 
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean. _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail-31-922151682
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">what happens if you remove the =
'--test' from your =
command?<div><br></div><div>&nbsp;brassow</div><div><br><div><div>On May =
26, 2009, at 12:01 PM, jose nuno neto wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: 2; text-align: auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0; "><div style=3D"font-family: 'Sans =
Serif'; font-size: 14pt; font-weight: 400; font-style: normal; =
">HI<br><div style=3D"margin-top: 0px; margin-bottom: 0px; margin-left: =
0px; margin-right: 0px; text-indent: 0px; white-space: pre-wrap; =
"><br></div>I'm running into some problems with lvm on redhat.<br>I'm =
trying to create a snapshot but gives always a error<br>" Aborting. =
Failed to activate snapshot exception store."<br><div style=3D"margin-top:=
 0px; margin-bottom: 0px; margin-left: 0px; margin-right: 0px; =
text-indent: 0px; white-space: pre-wrap; "><br></div>Also when I try to =
create a new volume and create new logical volumes I get the same =
error<br><div style=3D"margin-top: 0px; margin-bottom: 0px; margin-left: =
0px; margin-right: 0px; text-indent: 0px; white-space: pre-wrap; =
"><br></div>This is the output of the lvcreate -s and vgdisplay<br>Any =
ideas/hints are apreciated<br><div style=3D"margin-top: 0px; =
margin-bottom: 0px; margin-left: 0px; margin-right: 0px; text-indent: =
0px; white-space: pre-wrap; "><br></div>Thanks<br>Jose Nuno Neto<br><div =
style=3D"margin-top: 0px; margin-bottom: 0px; margin-left: 0px; =
margin-right: 0px; text-indent: 0px; white-space: pre-wrap; =
"><br></div><div style=3D"margin-top: 0px; margin-bottom: 0px; =
margin-left: 0px; margin-right: 0px; text-indent: 0px; white-space: =
pre-wrap; "><br></div><div style=3D"margin-top: 0px; margin-bottom: 0px; =
margin-left: 0px; margin-right: 0px; text-indent: 0px; white-space: =
pre-wrap; "><br></div>lvcreate --test -L 504M -n SnapTest -i2 -s =
/dev/vgdb/lvdb02<br>Test mode: Metadata will NOT be updated.<br>Using =
default stripesize 64.00 KB<br>Rounding size (63 extents) up to stripe =
boundary size (64 extents)<br>Aborting. Failed to activate snapshot =
exception store.<br><br><br><br>--- Volume group ---<span =
class=3D"Apple-converted-space">&nbsp;</span><br>VG Name vgdb<span =
class=3D"Apple-converted-space">&nbsp;</span><br>System ID<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Format lvm2<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Metadata Areas 5<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Metadata Sequence No =
126<span class=3D"Apple-converted-space">&nbsp;</span><br>VG Access =
read/write<span class=3D"Apple-converted-space">&nbsp;</span><br>VG =
Status resizable<span class=3D"Apple-converted-space">&nbsp;</span><br>MAX=
 LV 0<span class=3D"Apple-converted-space">&nbsp;</span><br>Cur LV =
2<span class=3D"Apple-converted-space">&nbsp;</span><br>Open LV 2<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Max PV 0<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Cur PV 5<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Act PV 5<span =
class=3D"Apple-converted-space">&nbsp;</span><br>VG Size 249.96 GB<span =
class=3D"Apple-converted-space">&nbsp;</span><br>PE Size 8.00 MB<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Total PE 31995<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Alloc PE / Size 30976 / =
242.00 GB<span class=3D"Apple-converted-space">&nbsp;</span><br>Free PE =
/ Size 1019 / 7.96 GB<span =
class=3D"Apple-converted-space">&nbsp;</span><br>VG UUID =
FqqBnv-EKiI-TXA2-GR3C-b4i0-XTeq-xPxpVa<span =
class=3D"Apple-converted-space">&nbsp;</span><br><br>--- Logical volume =
---<span class=3D"Apple-converted-space">&nbsp;</span><br>LV Name =
/dev/vgdb/lvdb01<span class=3D"Apple-converted-space">&nbsp;</span><br>VG =
Name vgdb<span class=3D"Apple-converted-space">&nbsp;</span><br>LV UUID =
0F2fNt-m2n5-MpJ8-dMNS-Xwzb-QsvS-LyHefm<span =
class=3D"Apple-converted-space">&nbsp;</span><br>LV Write Access =
read/write<span class=3D"Apple-converted-space">&nbsp;</span><br>LV =
Status available<span class=3D"Apple-converted-space">&nbsp;</span><br># =
open 1<span class=3D"Apple-converted-space">&nbsp;</span><br>LV Size =
2.00 GB<span class=3D"Apple-converted-space">&nbsp;</span><br>Current LE =
256<span class=3D"Apple-converted-space">&nbsp;</span><br>Segments =
1<span class=3D"Apple-converted-space">&nbsp;</span><br>Allocation =
inherit<span class=3D"Apple-converted-space">&nbsp;</span><br>Read ahead =
sectors auto<span class=3D"Apple-converted-space">&nbsp;</span><br>- =
currently set to 256<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Block device 253:4<span =
class=3D"Apple-converted-space">&nbsp;</span><br><br>--- Logical volume =
---<span class=3D"Apple-converted-space">&nbsp;</span><br>LV Name =
/dev/vgdb/lvdb02<span class=3D"Apple-converted-space">&nbsp;</span><br>VG =
Name vgdb<span class=3D"Apple-converted-space">&nbsp;</span><br>LV UUID =
7Q038a-7FfX-AhBo-djfL-chFO-MI3N-vzdcbo<span =
class=3D"Apple-converted-space">&nbsp;</span><br>LV Write Access =
read/write<span class=3D"Apple-converted-space">&nbsp;</span><br>LV =
Status available<span class=3D"Apple-converted-space">&nbsp;</span><br># =
open 1<span class=3D"Apple-converted-space">&nbsp;</span><br>LV Size =
240.00 GB<span class=3D"Apple-converted-space">&nbsp;</span><br>Current =
LE 30720<span class=3D"Apple-converted-space">&nbsp;</span><br>Segments =
3<span class=3D"Apple-converted-space">&nbsp;</span><br>Allocation =
inherit<br>Read ahead sectors auto<br>- currently set to 256<br>Block =
device 253:5<br><br><br><br>--- Physical volumes ---<br>PV Name =
/dev/sdh1<br>PV UUID 13EWPc-BeSd-w1ub-wbhM-c3Ff-pi7U-KWDkxr<br>PV Status =
allocatable<br>Total PE / Free PE 6399 / 0<br><br><br><br>PV Name =
/dev/sdi1<br>PV UUID 14OQ42-xq0w-xln5-z9ts-PHKF-goXA-X9qzTE<br>PV Status =
allocatable<br>Total PE / Free PE 6399 / 255<br><br><br><br>PV Name =
/dev/sdj1<br>PV UUID U3h5F6-g6Wt-MNMb-AHyy-BP2R-BWf1-6LNm55<br>PV Status =
allocatable<br>Total PE / Free PE 6399 / 255<br><br><br><br>PV Name =
/dev/sdk1<br>PV UUID qkpbY5-dvGg-Z1Xb-3cEM-sidS-frbr-pCe8Bk<br>PV Status =
allocatable<br>Total PE / Free PE 6399 / 255<br><br><br><br>PV Name =
/dev/sdb1<br>PV UUID WtDVja-1Q9u-Tgr8-bCU3-qlqS-lahj-m1p2cU<br>PV Status =
allocatable<br>Total PE / Free PE 6399 / 254<br><br><br><div =
style=3D"white-space: pre-wrap; "><br =
class=3D"webkit-block-placeholder"></div><br>--<span =
class=3D"Apple-converted-space">&nbsp;</span><br>This message has been =
scanned for viruses and<span =
class=3D"Apple-converted-space">&nbsp;</span><br>dangerous content =
by<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://www.mailscanner.info/"><b>MailScanner</b></a>, and =
is<span class=3D"Apple-converted-space">&nbsp;</span><br>believed to be =
clean.<span =
class=3D"Apple-converted-space">&nbsp;</span>_____________________________=
__________________<br>linux-lvm mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</a></div></span></blockquote></div><br></div></body></html>=

--Apple-Mail-31-922151682--
