Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6KI99aL018766
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 14:09:09 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.155])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6KI8o9S009448
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 14:08:51 -0400
Received: by fg-out-1718.google.com with SMTP id e21so592947fga.7
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 11:08:50 -0700 (PDT)
Message-ID: <bf6f43f40807201108s15b68449yf682d84b919d140a@mail.gmail.com>
Date: Sun, 20 Jul 2008 15:08:50 -0300
From: "Levy Abinajm Melero Sant'Anna" <levy.santanna@gmail.com>
Sender: log.todos@gmail.com
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_41730_10460887.1216577330119"
Subject: [linux-lvm] lvconvert alloc policy
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

------=_Part_41730_10460887.1216577330119
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,
I don't understand why I can't mirror this LV

root@atom:~# pvs
  PV         VG       Fmt  Attr PSize   PFree
  /dev/sda5  backvg   lvm2 a-   186,26G 316,00M
  /dev/sdb1  archvg   lvm2 a-   465,76G 465,76G
  /dev/sdc3  onlinevg lvm2 a-   315,62G 310,18G
  /dev/sdc4  archvg   lvm2 a-   381,48G 632,00M

root@atom:~# lvs
  LV        VG       Attr   LSize   Origin Snap%  Move Log Copy%
  onhomelv  archvg   -wi-a- 380,86G
  arcsnaplv backvg   sri-a-   2,00G backlv  48,00
  backlv    backvg   owi-a- 164,00G
  homelv    backvg   -wi-ao  12,00G
  usrlv     backvg   -wi-ao   7,95G
  drooton   onlinevg -wi-a-   1,00G
  dusron    onlinevg -wi-a-   2,45G
  dvaron    onlinevg -wi-a-   1,00G
  swaplv    onlinevg -wi-a-   1,00G

root@atom:~# vgs
  VG       #PV #LV #SN Attr   VSize   VFree
  archvg     2   1   0 wz--n- 847,23G 466,38G
  backvg     1   3   1 wz--n- 186,26G 316,00M
  onlinevg   1   4   0 wz--n- 315,62G 310,18G

root@atom:~# lvconvert -v -m 1 /dev/archvg/onhomelv /dev/sdb1
    Checking for existing volume group "archvg"
    Archiving volume group "archvg" metadata (seqno 6).
  Not enough PVs with free space available for parallel allocation.
  Consider --alloc anywhere if desperate.

All help will be nice,
-- 
Lewis/Iceman/Levy

Google Talk! levy.santanna@gmail.com
ICQ 12913566
MSN levy.santanna@gmail.com
Meebo lewisgodus

------=_Part_41730_10460887.1216577330119
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Hi all, <br>I don&#39;t understand why I can&#39;t mirror this LV<br clear="all"><br>root@atom:~# pvs<br>&nbsp; PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fmt&nbsp; Attr PSize&nbsp;&nbsp; PFree&nbsp; <br>&nbsp; /dev/sda5&nbsp; backvg&nbsp;&nbsp; lvm2 a-&nbsp;&nbsp; 186,26G 316,00M<br>
&nbsp; /dev/sdb1&nbsp; archvg&nbsp;&nbsp; lvm2 a-&nbsp;&nbsp; 465,76G 465,76G<br>&nbsp; /dev/sdc3&nbsp; onlinevg lvm2 a-&nbsp;&nbsp; 315,62G 310,18G<br>&nbsp; /dev/sdc4&nbsp; archvg&nbsp;&nbsp; lvm2 a-&nbsp;&nbsp; 381,48G 632,00M<br><br>root@atom:~# lvs<br>&nbsp; LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attr&nbsp;&nbsp; LSize&nbsp;&nbsp; Origin Snap%&nbsp; Move Log Copy% <br>
&nbsp; onhomelv&nbsp; archvg&nbsp;&nbsp; -wi-a- 380,86G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; arcsnaplv backvg&nbsp;&nbsp; sri-a-&nbsp;&nbsp; 2,00G backlv&nbsp; 48,00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; backlv&nbsp;&nbsp;&nbsp; backvg&nbsp;&nbsp; owi-a- 164,00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; homelv&nbsp;&nbsp;&nbsp; backvg&nbsp;&nbsp; -wi-ao&nbsp; 12,00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp; usrlv&nbsp;&nbsp;&nbsp;&nbsp; backvg&nbsp;&nbsp; -wi-ao&nbsp;&nbsp; 7,95G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; drooton&nbsp;&nbsp; onlinevg -wi-a-&nbsp;&nbsp; 1,00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; dusron&nbsp;&nbsp;&nbsp; onlinevg -wi-a-&nbsp;&nbsp; 2,45G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; dvaron&nbsp;&nbsp;&nbsp; onlinevg -wi-a-&nbsp;&nbsp; 1,00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp; swaplv&nbsp;&nbsp;&nbsp; onlinevg -wi-a-&nbsp;&nbsp; 1,00G <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>root@atom:~# vgs<br>&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #PV #LV #SN Attr&nbsp;&nbsp; VSize&nbsp;&nbsp; VFree&nbsp; <br>&nbsp; archvg&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp; 1&nbsp;&nbsp; 0 wz--n- 847,23G 466,38G<br>&nbsp; backvg&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp; 3&nbsp;&nbsp; 1 wz--n- 186,26G 316,00M<br>
&nbsp; onlinevg&nbsp;&nbsp; 1&nbsp;&nbsp; 4&nbsp;&nbsp; 0 wz--n- 315,62G 310,18G<br><br>root@atom:~# lvconvert -v -m 1 /dev/archvg/onhomelv /dev/sdb1<br>&nbsp;&nbsp;&nbsp; Checking for existing volume group &quot;archvg&quot;<br>&nbsp;&nbsp;&nbsp; Archiving volume group &quot;archvg&quot; metadata (seqno 6).<br>
&nbsp; Not enough PVs with free space available for parallel allocation.<br>&nbsp; Consider --alloc anywhere if desperate.<br><br>All help will be nice,<br>-- <br>Lewis/Iceman/Levy<br><br>Google Talk! <a href="mailto:levy.santanna@gmail.com">levy.santanna@gmail.com</a><br>
ICQ 12913566<br>MSN <a href="mailto:levy.santanna@gmail.com">levy.santanna@gmail.com</a><br>Meebo lewisgodus
</div>

------=_Part_41730_10460887.1216577330119--
