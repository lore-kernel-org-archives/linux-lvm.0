Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2OEQRko016262
	for <linux-lvm@redhat.com>; Fri, 24 Mar 2006 09:26:27 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.200])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2OEQLkI013027
	for <linux-lvm@redhat.com>; Fri, 24 Mar 2006 09:26:21 -0500
Received: by zproxy.gmail.com with SMTP id m7so822953nzf
	for <linux-lvm@redhat.com>; Fri, 24 Mar 2006 06:26:20 -0800 (PST)
Message-ID: <2c51ecee0603240626m5c118d17h63bb9a66ef906fc1@mail.gmail.com>
Date: Fri, 24 Mar 2006 09:26:19 -0500
From: "Raghuram Devarakonda" <draghuram@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_12524_11031534.1143210379803"
Subject: [linux-lvm] Problem in reading snapshots....
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

------=_Part_12524_11031534.1143210379803
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I am able to create LVM snapshot but reading it is failing most of the
times. The failure occurs at random offsets. Occassionally, the read
completes. Whenever the read fails, I see messages similar to following in
/var/log/messages:

"Buffer I/O error on device dm-6, logical block 1938043"

There are other messages:

"/etc/hotplug/block.agent[16978]: try 1 while waiting for /block/dm-4's
bus_id"

The system is a SLES9 SP3.

# uname -a
Linux raaga 2.6.5-7.244-default #1 Mon Dec 12 18:32:25 UTC 2005 i686 i686
i386 GNU/Linux

# rpm -qa | grep -i lvm
lvm2-2.01.14-3.6

I tested reads with "dd" command.

I would appreciate it if someone can help me in resolving this problem.
Please let me know if more details are needed.

Thanks in advance,
Raghu.

------=_Part_12524_11031534.1143210379803
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br>Hi,<br><br>I am able to create LVM snapshot but reading it is failing m=
ost of the times. The failure occurs at random offsets. Occassionally, the =
read completes. Whenever the read fails, I see messages similar to followin=
g in /var/log/messages:
<br><br>&quot;Buffer I/O error on device dm-6, logical block 1938043&quot;<=
br><br>There are other messages:<br><br>&quot;/etc/hotplug/block.agent[1697=
8]: try 1 while waiting for /block/dm-4's bus_id&quot;<br><br>The system is=
 a SLES9 SP3.
<br><br># uname -a<br>Linux raaga 2.6.5-7.244-default #1 Mon Dec 12 18:32:2=
5 UTC 2005 i686 i686 i386 GNU/Linux<br><br># rpm -qa | grep -i lvm<br>lvm2-=
2.01.14-3.6<br><br>I tested reads with &quot;dd&quot; command. <br><br>
I would appreciate it if someone can help me in resolving this problem. Ple=
ase let me know if more details are needed.<br><br>Thanks in advance,<br>Ra=
ghu.<br><br><br><br><br><br><br><br><br>

------=_Part_12524_11031534.1143210379803--
