Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9FDKbbk001466
	for <linux-lvm@redhat.com>; Wed, 15 Oct 2008 09:20:37 -0400
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.172])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9FDKR1C008628
	for <linux-lvm@redhat.com>; Wed, 15 Oct 2008 09:20:28 -0400
Received: by wf-out-1314.google.com with SMTP id 25so2629700wfc.6
	for <linux-lvm@redhat.com>; Wed, 15 Oct 2008 06:20:27 -0700 (PDT)
Message-ID: <d5dce2210810150620l2e9c4b44uc519eeeebadd604f@mail.gmail.com>
Date: Wed, 15 Oct 2008 18:50:27 +0530
From: "himanshu padmanabhi" <himanshu.padmanabhi@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_27219_18307324.1224076827278"
Subject: [linux-lvm] [IMPORTANT]LVM+iSCSI issue..Local Disk disappeared..
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

------=_Part_27219_18307324.1224076827278
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am using "iscsi-initiator-utils-6.2.0.865-0.2.fc7" as initiator and
"iscsitarget-0.4.15-1" as target.

Following is the scenario

*PV  =  local_disk1       remote_disk1  (i.e PV is formed using 2 disks
1 local and 1 from iscsitarget)
*

* VG  =  Vgname
*

* LV =  lv_localdisk_1       lv_localremotedisk1
lv_remotedisk1 (i.e. 1 lv only from local disk,1 from remote
iscsitarget and one from combination of both)
*

I performed "logout" operation on "remote_disk1" after deactivating
"lv_localremotedisk1 and           lv_remotedisk1" on it using
"lvchange" command.

Then result I should at least get,

*PV  =  local_disk1    (remote_disk1 is removed now)
*

* VG = Vgname
*

* LV = lv_localdisk1     (So LVs containing PVs as "remote_disk1" are
deactivated.It can be in combination with local disk also) *

Still confused about  "lv_localremotedisk1"?Local disk part would also
lost here till I again login to that target.

But the result was

*PV =
VG =
LV =
*

i.e They all were lost temporarily.

When I logged in to the same target and activated the LVs on
"remote_disk1",I got my original configuration.i.e.

*PV  =  local_disk1       remote_disk1  (i.e PV is formed using 2 disks
1 local and 1 from iscsitarget)
*

* VG  =  Vgname
*

* LV =  lv_localdisk_1       lv_localremotedisk1
lv_remotedisk1 (i.e. 1 lv only from local disk,1 from remote
iscsitarget and one from combination of both)*

Please help......

This should not happen.....right...

-- 
Thanks and Regards,
Himanshu Padmanabhi

------=_Part_27219_18307324.1224076827278
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr"><br clear="all"><font class="fixed_width" face="Courier, Monospaced">I am using &quot;iscsi-initiator-utils-6.2.0.865-0.2.fc7&quot; as initiator and
<br> &quot;iscsitarget-0.4.15-1&quot; as target.
<br> </font><p><font class="fixed_width" face="Courier, Monospaced">Following is the scenario
<br> </font></p><p><b><font class="fixed_width" face="Courier, Monospaced">PV &nbsp;= &nbsp;local_disk1 &nbsp; &nbsp; &nbsp; remote_disk1 &nbsp;(i.e PV is formed using 2 disks
<br> 1 local and 1 from iscsitarget) <br></font></b></p><p><b><font class="fixed_width" face="Courier, Monospaced"> VG &nbsp;= &nbsp;Vgname <br></font></b></p><p><b><font class="fixed_width" face="Courier, Monospaced"> LV = &nbsp;lv_localdisk_1 &nbsp; &nbsp; &nbsp; lv_localremotedisk1
<br> lv_remotedisk1 (i.e. 1 lv only from local disk,1 from remote
<br> iscsitarget and one from combination of both)
<br> </font></b></p><p><font class="fixed_width" face="Courier, Monospaced">I performed &quot;logout&quot; operation on &quot;remote_disk1&quot; after deactivating
<br> &quot;lv_localremotedisk1 and &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; lv_remotedisk1&quot; on it using
<br> &quot;lvchange&quot; command.
<br> </font></p><p><font class="fixed_width" face="Courier, Monospaced">Then result I should at least get,
<br> </font></p><p><font class="fixed_width" face="Courier, Monospaced"><b>PV &nbsp;= &nbsp;local_disk1 &nbsp; &nbsp;(remote_disk1 is removed now) <br></b></font></p><p><font class="fixed_width" face="Courier, Monospaced"><b> VG = Vgname <br>
</b></font></p><p><font class="fixed_width" face="Courier, Monospaced"><b> LV = lv_localdisk1 &nbsp; &nbsp; (So LVs containing PVs as &quot;remote_disk1&quot; are
<br> deactivated.It can be in combination with local disk also)
</b><br> </font></p><p><font class="fixed_width" face="Courier, Monospaced">Still confused about &nbsp;&quot;lv_localremotedisk1&quot;?Local disk part would also
<br> lost here till I again login to that target.
<br> </font></p><p><font class="fixed_width" face="Courier, Monospaced">But the result was
<br> </font></p><p><b><font class="fixed_width" face="Courier, Monospaced">PV =
<br> VG =
<br> LV =
<br> </font></b></p><p><font class="fixed_width" face="Courier, Monospaced">i.e They all were lost temporarily.
<br> </font></p><p><font class="fixed_width" face="Courier, Monospaced">When I logged in to the same target and activated the LVs on
<br> &quot;remote_disk1&quot;,I got my original configuration.i.e.
<br> </font></p><p><font class="fixed_width" face="Courier, Monospaced"><b>PV &nbsp;= &nbsp;local_disk1 &nbsp; &nbsp; &nbsp; remote_disk1 &nbsp;(i.e PV is formed using 2 disks
<br> 1 local and 1 from iscsitarget) <br></b></font></p><p><font class="fixed_width" face="Courier, Monospaced"><b> VG &nbsp;= &nbsp;Vgname <br></b></font></p><p><font class="fixed_width" face="Courier, Monospaced"><b> LV = &nbsp;lv_localdisk_1 &nbsp; &nbsp; &nbsp; lv_localremotedisk1
<br> lv_remotedisk1 (i.e. 1 lv only from local disk,1 from remote
<br> iscsitarget and one from combination of both)</b>
<br> </font></p><p><font class="fixed_width" face="Courier, Monospaced">Please help......
<br> </font></p><p><font class="fixed_width" face="Courier, Monospaced">This should not happen.....right...</font>
  </p><br>-- <br>Thanks and Regards,<br>Himanshu Padmanabhi<br><br>
</div>

------=_Part_27219_18307324.1224076827278--
