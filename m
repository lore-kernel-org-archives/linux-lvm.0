Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2C37V121551
	for <linux-lvm@redhat.com>; Sat, 11 Mar 2006 22:07:31 -0500
Received: from nproxy.gmail.com (nproxy.gmail.com [64.233.182.196])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2C37U2j009292
	for <linux-lvm@redhat.com>; Sat, 11 Mar 2006 22:07:30 -0500
Received: by nproxy.gmail.com with SMTP id l36so711110nfa
	for <linux-lvm@redhat.com>; Sat, 11 Mar 2006 19:06:29 -0800 (PST)
Message-ID: <99fb4c10603111906u7c5bbc9fr1b1bb5bb3585813b@mail.gmail.com>
Date: Sat, 11 Mar 2006 22:06:29 -0500
From: "Enils Bashi" <ebashi@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_19468_27686011.1142132789842"
Subject: [linux-lvm] resizing physical volume in Fedora Core 4
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

------=_Part_19468_27686011.1142132789842
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

All,

I followed the instructions from
http://netzooid.com/blog/2005/11/01/shriking-a-physical-volume-on-linux/
to reduce the physical volume on my laptop. I am trying to make room for
non-lvm partitions. Everything worked fine. I resized the physical volume
rom $57G to $27G however fdisk does not see the emtpy space. see below:
[root@hyllus ~]# pvs -o +dev_size --units h
  PV         VG         Fmt  Attr PSize  PFree  DevSize
  /dev/hda2  VolGroup00 lvm2 a-   27.81G 64.00M  55.79G

---

Is there something I am missing? Fdisk, parted and any other partition
utilties don't see any empty space. There is a mismatch  between the
physical volume size and what is being reported to the system. Is there a
way to shrink the size of /dev/hda2 without having to reformat? I would
rather not have to reformat, since /, /usr, /usr/local and other partitions
resized on /dev/hda2.

Any and all feedback would be greatly appreciated.

Enils

--
    ___           ___                                     ___
     /\__\         /\  \                                   /\__\
    /:/ _/_        \:\  \       ___                       /:/ _/_
   /:/ /\__\        \:\  \     /\__\                     /:/ /\  \
  /:/ /:/ _/_   _____\:\  \   /:/__/      ___     ___   /:/ /::\  \
/:/_/:/ /\__\ /::::::::\__\ /::\  \     /\  \   /\__\ /:/_/:/\:\__\
\:\/:/ /:/  / \:\~~\~~\/__/ \/\:\  \__  \:\  \ /:/  / \:\/:/ /:/  /
  \::/_/:/  /   \:\  \        ~~\:\/\__\  \:\  /:/  /   \::/ /:/  /
   \:\/:/  /     \:\  \          \::/  /   \:\/:/  /     \/_/:/  /
    \::/  /       \:\__\         /:/  /     \::/  /        /:/  /
     \/__/         \/__/         \/__/       \/__/         \/__/

------=_Part_19468_27686011.1142132789842
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

All,<br><br>I followed the instructions from <a href=3D"http://netzooid.com=
/blog/2005/11/01/shriking-a-physical-volume-on-linux/">http://netzooid.com/=
blog/2005/11/01/shriking-a-physical-volume-on-linux/</a><br>to reduce the p=
hysical volume on my laptop. I am trying to make room for non-lvm partition=
s. Everything worked fine. I resized the physical volume rom $57G to $27G h=
owever fdisk does not see the emtpy space. see below:
<br>[root@hyllus ~]# pvs -o +dev_size --units h<br>&nbsp; PV&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; Fmt&nbsp; Attr PSize&nbsp; PFree&nbsp; DevSize<br>&nbsp; /dev/hda=
2&nbsp; VolGroup00 lvm2 a-&nbsp;&nbsp; 27.81G 64.00M&nbsp; 55.79G<br><br>--=
-<br><br>Is there something I am missing? Fdisk, parted and any other parti=
tion utilties don't see any empty space. There is a mismatch&nbsp; between =
the physical volume size and what is being reported to the system. Is there=
 a way to shrink the size of /dev/hda2 without having to reformat? I would =
rather not have to reformat, since /, /usr, /usr/local and other partitions=
 resized on /dev/hda2.
<br><br>Any and all feedback would be greatly appreciated.<br><br>Enils<br =
clear=3D"all"><br>-- <br>&nbsp;&nbsp;&nbsp;&nbsp;___&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ___&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ___&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp;&nbs=
p;&nbsp;&nbsp; /\__\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /\&nbs=
p;&nbsp;\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /\__\&nbsp;=
&nbsp;&nbsp;&nbsp;
<br>&nbsp;&nbsp;&nbsp;&nbsp;/:/ _/_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;\:\&nbsp;&nbsp;\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ___&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /:/ _/_&nbsp;&nbsp; <br>&nbs=
p;&nbsp; /:/ /\__\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\:\&nbsp;=
&nbsp;\&nbsp;&nbsp;&nbsp;&nbsp; /\__\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /:/ /\&nbsp;&nbsp;\&nbsp;&nbsp;<br>&nbsp;&nbsp;/:/ /:/ _/_&nbsp;&nb=
sp; _____\:\&nbsp;&nbsp;\&nbsp;&nbsp; /:/__/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;___&nbsp;&nbsp;&nbsp;&nbsp; ___&nbsp;&nbsp; /:/ /::\&nbsp;&nbsp;\ <br>=
 /:/_/:/ /\__\ /::::::::\__\ /::\&nbsp;&nbsp;\&nbsp;&nbsp;&nbsp;&nbsp; /\&n=
bsp;&nbsp;\&nbsp;&nbsp; /\__\ /:/_/:/\:\__\
<br> \:\/:/ /:/&nbsp;&nbsp;/ \:\~~\~~\/__/ \/\:\&nbsp;&nbsp;\__&nbsp;&nbsp;=
\:\&nbsp;&nbsp;\ /:/&nbsp;&nbsp;/ \:\/:/ /:/&nbsp;&nbsp;/<br>&nbsp;&nbsp;\:=
:/_/:/&nbsp;&nbsp;/&nbsp;&nbsp; \:\&nbsp;&nbsp;\&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;~~\:\/\__\&nbsp;&nbsp;\:\&nbsp;&nbsp;/:/&nbsp;&nbsp;/&=
nbsp;&nbsp; \::/ /:/&nbsp;&nbsp;/ <br>&nbsp;&nbsp; \:\/:/&nbsp;&nbsp;/&nbsp=
;&nbsp;&nbsp;&nbsp; \:\&nbsp;&nbsp;\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;\::/&nbsp;&nbsp;/&nbsp;&nbsp; \:\/:/&nbsp;&nbsp;/&nbsp=
;&nbsp;&nbsp;&nbsp; \/_/:/&nbsp;&nbsp;/&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;&n=
bsp;\::/&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \:\__\&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /:/&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nb=
sp; \::/&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/:/&nb=
sp;&nbsp;/&nbsp;&nbsp;=20
<br>&nbsp;&nbsp;&nbsp;&nbsp; \/__/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \/__/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \/__/&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; \/__/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \/__/&nbsp;&nbsp;&nbsp;&nbsp;<br>

------=_Part_19468_27686011.1142132789842--
