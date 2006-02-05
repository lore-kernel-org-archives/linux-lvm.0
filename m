Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k15Hs4106388
	for <linux-lvm@redhat.com>; Sun, 5 Feb 2006 12:54:04 -0500
Received: from uproxy.gmail.com (uproxy.gmail.com [66.249.92.206])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k15Hrpjb012204
	for <linux-lvm@redhat.com>; Sun, 5 Feb 2006 12:53:51 -0500
Received: by uproxy.gmail.com with SMTP id c2so528699ugf
	for <linux-lvm@redhat.com>; Sun, 05 Feb 2006 09:53:46 -0800 (PST)
Message-ID: <77ec93690602050953r6ada49aat@mail.gmail.com>
Date: Sun, 5 Feb 2006 18:53:45 +0100
From: Martin Lindquist <black.ant@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_19820_31654027.1139162025401"
Subject: [linux-lvm] Accidental removal of logical volume - any way to
	salvage?
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

------=_Part_19820_31654027.1139162025401
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Ok, here's the situation:

I have a volume group consisting of two whole disk partitions, on top of
which I used to have a full size logical volume containing data of system
non-critical but nevertheless important nature. After deciding to replace a
lot of the hardware in the machine (and to reinstall the system) I realized
that I would first need to export the volume group or I could be in for a
lot of trouble (lesson learned from previous experience). To make a long an=
d
stupid story (for which I have no defense) a lot shorter; I did 'lvremove
main' ("main" being the name of the lv in question), ran 'vgexport rajd'
("rajd" being the vg), backed up a lot of files (including /etc and most of
/var), replaced the hardware, reinstalled the system, ran 'vgimport rajd'
and only then realized what 'lvremove' really did.

Now, instead of getting questions like "what did you think 'lvremove main'
would do?" or "are you the result of several generations of inbreeding?",
could anyone first of all tell me if there is any way at all to salvage the
data from the logical volume "main"? If there is I would love to find out
how.


Regards,
Martin

------=_Part_19820_31654027.1139162025401
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Ok, here's the situation:<br><br>I have a volume group consisting of two wh=
ole disk partitions, on top of which I used to have a full size logical vol=
ume containing data of system non-critical but nevertheless important natur=
e. After deciding to replace a lot of the hardware in the machine (and to r=
einstall the system) I realized that I would first need to export the volum=
e group or I could be in for a lot of trouble (lesson learned from previous=
 experience). To make a long and stupid story (for which I have no defense)=
 a lot shorter; I did 'lvremove main' (&quot;main&quot; being the name of t=
he lv in question), ran 'vgexport rajd' (&quot;rajd&quot; being the vg), ba=
cked up a lot of files (including /etc and most of /var), replaced the hard=
ware, reinstalled the system, ran 'vgimport rajd' and only then realized wh=
at 'lvremove' really did.
<br><br>Now, instead of getting questions like &quot;what did you think 'lv=
remove main' would do?&quot; or &quot;are you the result of several generat=
ions of inbreeding?&quot;, could anyone first of all tell me if there is an=
y way at all to salvage the data from the logical volume &quot;main&quot;? =
If there is I would love to find out how.
<br><br><br>Regards,<br>Martin<br>

------=_Part_19820_31654027.1139162025401--
