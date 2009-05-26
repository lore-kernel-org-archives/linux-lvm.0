Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4QH54pE031836
	for <linux-lvm@redhat.com>; Tue, 26 May 2009 13:05:04 -0400
Received: from fela.liber4e.com (fela.liber4e.com [208.77.96.130])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n4QH4o37021375
	for <linux-lvm@redhat.com>; Tue, 26 May 2009 13:04:50 -0400
Received: from libermobile.liber4e.home (fela.liber4e.com [127.0.0.1])
	(authenticated bits=0)
	by fela.liber4e.com (8.14.2/8.14.2) with ESMTP id n4QH2RSi009623
	for <linux-lvm@redhat.com>; Tue, 26 May 2009 18:02:39 +0100
From: jose nuno neto <jose.neto@liber4e.com>
Date: Tue, 26 May 2009 18:01:48 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="Boundary-00=_9BCHKbR/rJF4aJr"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905261801.49236.jose.neto@liber4e.com>
Subject: [linux-lvm] Failed to activate snapshot exception store.
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
To: linux-lvm@redhat.com


--Boundary-00=_9BCHKbR/rJF4aJr
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

HI

I'm running into some problems with lvm on redhat.
I'm trying to create a snapshot but gives always a error
"  Aborting. Failed to activate snapshot exception store."

Also when I try to create a new volume and create new logical volumes I get 
the same error

This is the output of the lvcreate -s and vgdisplay
Any ideas/hints are apreciated

Thanks
Jose Nuno Neto



 lvcreate --test -L 504M -n SnapTest -i2 -s /dev/vgdb/lvdb02
  Test mode: Metadata will NOT be updated.
  Using default stripesize 64.00 KB
  Rounding size (63 extents) up to stripe boundary size (64 extents)
  Aborting. Failed to activate snapshot exception store.



  --- Volume group ---                                                                                                                                 
  VG Name               vgdb                                                                                                                           
  System ID                                                                                                                                            
  Format                lvm2                                                                                                                           
  Metadata Areas        5                                                                                                                              
  Metadata Sequence No  126                                                                                                                            
  VG Access             read/write                                                                                                                     
  VG Status             resizable                                                                                                                      
  MAX LV                0                                                                                                                              
  Cur LV                2                                                                                                                              
  Open LV               2                                                                                                                              
  Max PV                0                                                                                                                              
  Cur PV                5                                                                                                                              
  Act PV                5                                                                                                                              
  VG Size               249.96 GB                                                                                                                      
  PE Size               8.00 MB                                                                                                                        
  Total PE              31995                                                                                                                          
  Alloc PE / Size       30976 / 242.00 GB                                                                                                              
  Free  PE / Size       1019 / 7.96 GB                                                                                                                 
  VG UUID               FqqBnv-EKiI-TXA2-GR3C-b4i0-XTeq-xPxpVa                                                                                         
                                                                                                                                                       
  --- Logical volume ---                                                                                                                               
  LV Name                /dev/vgdb/lvdb01                                                                                                              
  VG Name                vgdb                                                                                                                          
  LV UUID                0F2fNt-m2n5-MpJ8-dMNS-Xwzb-QsvS-LyHefm                                                                                        
  LV Write Access        read/write                                                                                                                    
  LV Status              available                                                                                                                     
  # open                 1                                                                                                                             
  LV Size                2.00 GB                                                                                                                       
  Current LE             256                                                                                                                           
  Segments               1                                                                                                                             
  Allocation             inherit                                                                                                                       
  Read ahead sectors     auto                                                                                                                          
  - currently set to     256                                                                                                                           
  Block device           253:4                                                                                                                         
                                                                                                                                                       
  --- Logical volume ---                                                                                                                               
  LV Name                /dev/vgdb/lvdb02                                                                                                              
  VG Name                vgdb                                                                                                                          
  LV UUID                7Q038a-7FfX-AhBo-djfL-chFO-MI3N-vzdcbo                                                                                        
  LV Write Access        read/write                                                                                                                    
  LV Status              available                                                                                                                     
  # open                 1                                                                                                                             
  LV Size                240.00 GB                                                                                                                     
  Current LE             30720                                                                                                                         
  Segments               3                                                                                                                             
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:5



  --- Physical volumes ---
  PV Name               /dev/sdh1
  PV UUID               13EWPc-BeSd-w1ub-wbhM-c3Ff-pi7U-KWDkxr
  PV Status             allocatable
  Total PE / Free PE    6399 / 0



  PV Name               /dev/sdi1
  PV UUID               14OQ42-xq0w-xln5-z9ts-PHKF-goXA-X9qzTE
  PV Status             allocatable
  Total PE / Free PE    6399 / 255



  PV Name               /dev/sdj1
  PV UUID               U3h5F6-g6Wt-MNMb-AHyy-BP2R-BWf1-6LNm55
  PV Status             allocatable
  Total PE / Free PE    6399 / 255



  PV Name               /dev/sdk1
  PV UUID               qkpbY5-dvGg-Z1Xb-3cEM-sidS-frbr-pCe8Bk
  PV Status             allocatable
  Total PE / Free PE    6399 / 255



  PV Name               /dev/sdb1
  PV UUID               WtDVja-1Q9u-Tgr8-bCU3-qlqS-lahj-m1p2cU
  PV Status             allocatable
  Total PE / Free PE    6399 / 254




-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


--Boundary-00=_9BCHKbR/rJF4aJr
Content-Type: text/html;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-=
html40/strict.dtd"><html><head><meta name=3D"qrichtext" content=3D"1" /><st=
yle type=3D"text/css">p, li { white-space: pre-wrap; }</style></head><body =
style=3D" font-family:'Sans Serif'; font-size:14pt; font-weight:400; font-s=
tyle:normal;">HI<br>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; ma=
rgin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-u=
ser-state:0;"><br></p>I'm running into some problems with lvm on redhat.<br>
I'm trying to create a snapshot but gives always a error<br>
"  Aborting. Failed to activate snapshot exception store."<br>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; ma=
rgin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-u=
ser-state:0;"><br></p>Also when I try to create a new volume and create new=
 logical volumes I get the same error<br>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; ma=
rgin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-u=
ser-state:0;"><br></p>This is the output of the lvcreate -s and vgdisplay<b=
r>
Any ideas/hints are apreciated<br>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; ma=
rgin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-u=
ser-state:0;"><br></p>Thanks<br>
Jose Nuno Neto<br>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; ma=
rgin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-u=
ser-state:0;"><br></p><p style=3D"-qt-paragraph-type:empty; margin-top:0px;=
 margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; =
text-indent:0px; -qt-user-state:0;"><br></p><p style=3D"-qt-paragraph-type:=
empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px=
; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"><br></p> lvcreate=
 --test -L 504M -n SnapTest -i2 -s /dev/vgdb/lvdb02<br />  Test mode: Metad=
ata will NOT be updated.<br />  Using default stripesize 64.00 KB<br />  Ro=
unding size (63 extents) up to stripe boundary size (64 extents)<br />  Abo=
rting. Failed to activate snapshot exception store.<br /><br>
<br /><br>
  --- Volume group ---                                                     =
                                                                           =
 <br />  VG Name               vgdb                                        =
                                                                           =
        <br />  System ID                                                  =
                                                                           =
               <br />  Format                lvm2                          =
                                                                           =
                      <br />  Metadata Areas        5                      =
                                                                           =
                             <br />  Metadata Sequence No  126             =
                                                                           =
                                    <br />  VG Access             read/writ=
e                                                                          =
                                           <br />  VG Status             re=
sizable                                                                    =
                                                  <br />  MAX LV           =
     0                                                                     =
                                                         <br />  Cur LV    =
            2                                                              =
                                                                <br />  Ope=
n LV               2                                                       =
                                                                       <br =
/>  Max PV                0                                                =
                                                                           =
   <br />  Cur PV                5                                         =
                                                                           =
          <br />  Act PV                5                                  =
                                                                           =
                 <br />  VG Size               249.96 GB                   =
                                                                           =
                        <br />  PE Size               8.00 MB              =
                                                                           =
                               <br />  Total PE              31995         =
                                                                           =
                                      <br />  Alloc PE / Size       30976 /=
 242.00 GB                                                                 =
                                             <br />  Free  PE / Size       =
1019 / 7.96 GB                                                             =
                                                    <br />  VG UUID        =
       FqqBnv-EKiI-TXA2-GR3C-b4i0-XTeq-xPxpVa                              =
                                                           <br />          =
                                                                           =
                                                                  <br />  -=
-- Logical volume ---                                                      =
                                                                         <b=
r />  LV Name                /dev/vgdb/lvdb01                              =
                                                                           =
     <br />  VG Name                vgdb                                   =
                                                                           =
            <br />  LV UUID                0F2fNt-m2n5-MpJ8-dMNS-Xwzb-QsvS-=
LyHefm                                                                     =
                   <br />  LV Write Access        read/write               =
                                                                           =
                          <br />  LV Status              available         =
                                                                           =
                                 <br />  # open                 1          =
                                                                           =
                                        <br />  LV Size                2.00=
 GB                                                                        =
                                               <br />  Current LE          =
   256                                                                     =
                                                      <br />  Segments     =
          1                                                                =
                                                             <br />  Alloca=
tion             inherit                                                   =
                                                                    <br /> =
 Read ahead sectors     auto                                               =
                                                                           =
<br />  - currently set to     256                                         =
                                                                           =
       <br />  Block device           253:4                                =
                                                                           =
              <br />                                                       =
                                                                           =
                     <br />  --- Logical volume ---                        =
                                                                           =
                            <br />  LV Name                /dev/vgdb/lvdb02=
                                                                           =
                                   <br />  VG Name                vgdb     =
                                                                           =
                                          <br />  LV UUID                7Q=
038a-7FfX-AhBo-djfL-chFO-MI3N-vzdcbo                                       =
                                                 <br />  LV Write Access   =
     read/write                                                            =
                                                        <br />  LV Status  =
            available                                                      =
                                                               <br />  # op=
en                 1                                                       =
                                                                      <br /=
>  LV Size                240.00 GB                                        =
                                                                           =
  <br />  Current LE             30720                                     =
                                                                           =
         <br />  Segments               3                                  =
                                                                           =
                <br />  Allocation             inherit<br />  Read ahead se=
ctors     auto<br />  - currently set to     256<br />  Block device       =
    253:5<br /><br>
<br /><br>
  --- Physical volumes ---<br />  PV Name               /dev/sdh1<br />  PV=
 UUID               13EWPc-BeSd-w1ub-wbhM-c3Ff-pi7U-KWDkxr<br />  PV Status=
             allocatable<br />  Total PE / Free PE    6399 / 0<br /><br>
<br /><br>
  PV Name               /dev/sdi1<br />  PV UUID               14OQ42-xq0w-=
xln5-z9ts-PHKF-goXA-X9qzTE<br />  PV Status             allocatable<br />  =
Total PE / Free PE    6399 / 255<br /><br>
<br /><br>
  PV Name               /dev/sdj1<br />  PV UUID               U3h5F6-g6Wt-=
MNMb-AHyy-BP2R-BWf1-6LNm55<br />  PV Status             allocatable<br />  =
Total PE / Free PE    6399 / 255<br /><br>
<br /><br>
  PV Name               /dev/sdk1<br />  PV UUID               qkpbY5-dvGg-=
Z1Xb-3cEM-sidS-frbr-pCe8Bk<br />  PV Status             allocatable<br />  =
Total PE / Free PE    6399 / 255<br /><br>
<br /><br>
  PV Name               /dev/sdb1<br />  PV UUID               WtDVja-1Q9u-=
Tgr8-bCU3-qlqS-lahj-m1p2cU<br />  PV Status             allocatable<br />  =
Total PE / Free PE    6399 / 254<br /><br>
<br /></p><br />--=20
<br />This message has been scanned for viruses and
<br />dangerous content by
<a href=3D"http://www.mailscanner.info/"><b>MailScanner</b></a>, and is
<br />believed to be clean.
</body></html>

--Boundary-00=_9BCHKbR/rJF4aJr--
