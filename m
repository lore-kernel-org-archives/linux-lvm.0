Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBQDrH115649
	for <linux-lvm@redhat.com>; Mon, 26 Dec 2005 08:53:17 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.200])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBQDr6vS031779
	for <linux-lvm@redhat.com>; Mon, 26 Dec 2005 08:53:06 -0500
Received: by zproxy.gmail.com with SMTP id 14so1132524nzn
	for <linux-lvm@redhat.com>; Mon, 26 Dec 2005 05:53:06 -0800 (PST)
Message-ID: <a3802a4f0512260553y40c82867of058d189b727d2c7@mail.gmail.com>
Date: Mon, 26 Dec 2005 08:53:06 -0500
From: Jon Coulter <ledjon@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_34726_18177277.1135605186185"
Subject: [linux-lvm] lvm2 + 4gb of memroy = problem?
Reply-To: ledjon@ledjon.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

------=_Part_34726_18177277.1135605186185
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

We've got a server that uses lvm2 to handle a mysql volume.  When the serve=
r
had 2gb of memory, taking a snapshot for backups was perfectly smooth.  Whe=
n
we added 2gb of memory more (total of 4gb), we started getting fatal errors=
:

[root@edge1 ~]# lvcreate -L500M -s -n mysqlbk /dev/edge/mysql
  device-mapper ioctl cmd 9 failed: Cannot allocate memory
  Couldn't load device 'edge-mysqlbk'.
  Problem reactivating origin mysql

and dmesg showed:
device-mapper: Unable to allocate hash table space
device-mapper: error adding target to table

This was with all services stopped, so nothing should have been using any o=
f
the 4gb of memory.

Any ideas?

Thanks,

--
Jon Coulter
ledjon@ledjon.com

------=_Part_34726_18177277.1135605186185
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>We've got a server that uses lvm2 to handle a mysql volume.&nbsp; When=
 the server had 2gb of memory, taking a snapshot for backups was perfectly =
smooth.&nbsp; When we added 2gb of memory more (total of&nbsp;4gb), we star=
ted getting fatal errors:
</div>
<div>&nbsp;</div>
<div>[root@edge1 ~]# lvcreate -L500M -s -n mysqlbk /dev/edge/mysql<br>&nbsp=
; device-mapper ioctl cmd 9 failed: Cannot allocate memory<br>&nbsp; Couldn=
't load device 'edge-mysqlbk'.<br>&nbsp; Problem reactivating origin mysql<=
br>&nbsp;</div>

<div>and dmesg showed:</div>
<div>device-mapper: Unable to allocate hash table space<br>device-mapper: e=
rror adding target to table</div>
<div>&nbsp;</div>
<div>This was with all services stopped, so nothing should have been using =
any of the 4gb of memory.</div>
<div>&nbsp;</div>
<div>Any ideas?</div>
<div>&nbsp;</div>
<div>Thanks,<br clear=3D"all"><br>-- <br>Jon Coulter<br><a href=3D"mailto:l=
edjon@ledjon.com">ledjon@ledjon.com</a> </div>

------=_Part_34726_18177277.1135605186185--
