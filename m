Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1L5Hl130125
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 00:17:47 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.196])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1L5HkZe018778
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 00:17:46 -0500
Received: by zproxy.gmail.com with SMTP id 14so1139097nzn
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2006 21:17:46 -0800 (PST)
Message-ID: <abe3dd8f0602202117r13749f4bu578cc61613b5ee10@mail.gmail.com>
Date: Tue, 21 Feb 2006 10:47:45 +0530
From: "Gaurab Paul" <gaurab.paul@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_10154_28659035.1140499065955"
Subject: [linux-lvm] How to reset the vg uuid before doing a vgimport?
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

------=_Part_10154_28659035.1140499065955
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Is there a way that before we do vgimport, on the exported volume we
can reset the vg uuid? If so what is the process?

HP-UX lvm provied vgchgid. Any equivalent in lvm2?

In summary, i want to know how to do step 2 below in linux lvm:

1.vgexport vgname
2. Reset the vg uuid
3. vgimport vgname


--
Thanks and Regards,

Gaurab

------=_Part_10154_28659035.1140499065955
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Is there a way that before we do vgimport, on the exported volume we<br>can=
 reset the vg uuid? If so what is the process?<br><br>HP-UX lvm provied vgc=
hgid. Any equivalent in lvm2?<br><br>In summary, i want to know how to do s=
tep 2 below in linux lvm:
<br><br>1.vgexport vgname<br>2. Reset the vg uuid<br>3. vgimport vgname<br>=
<br clear=3D"all"><br>-- <br>Thanks and Regards,<br><br>Gaurab

------=_Part_10154_28659035.1140499065955--
