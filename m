From: "Yves Alloyer" <Yves.ALLOYER@slpinfoware.com>
Subject: RE: [linux-lvm] pvcreate error
Message-Id: <NEBBLHFAEINCLDICDLOAOEEJCJAA.yves.alloyer@slpinfoware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5E34D857F6BB704CA3369B7553233A81651ACA@ntsviemxs0152.connect.at-work.ent>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Jan 15 04:13:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi Csuk,
1.0.1rc4 is not the latest. I ran into the same problem because when it sees
an md device, no matter the raid level, it thinks the device has a partition
table which is wrong. These device are always used as a whole.
To fix the problem you may either upgrade to 1.0.1 or just have a look at
the thread
"[linux-lvm] pvcreate fails on a software RAID metadisk". It describes a
patch from Luca Berra and me:
--- tools/lib/lvm_check_partitioned_dev.c.bluca	Thu Aug 23 07:51:53 2001
+++ tools/lib/lvm_check_partitioned_dev.c	Fri Oct  5 21:18:51 2001
@@ -55,6 +55,8 @@
 	switch (lvm_get_device_type(st_rdev)) {
 	case LVM_DEVICE_TYPE_INVALID:
 	    break;
+	case LVM_DEVICE_TYPE_MD:
+	    break;
 	default:
 	    ret =3D TRUE;
 	}

Yves
-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of Csuk, Ferenc
Sent: Monday, January 14, 2002 9:32 PM
To: linux-lvm@sistina.com
Subject: [linux-lvm] pvcreate error


Dear All,
I made a typing error in my question. Each line of the error message is
related to /dev/md2 instead of /dev/md7.
I just installed a new system and I installed the latest 2.4.16 kernel and
the latest LVM tool 1.0.1-rc4. I established a software RAID-5 device(md)
and wanted to create a logical volume group on it(as I did with 2.4.7 kernel
on another system). However, when I issued the command I got the following
error:
# pvcreate -v /dev/md2
pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/md2"
> pvcreate -- getting physical volume size
> pvcreate -- checking partition type
> pvcreate -- creating new physical volume
> pvcreate -- setting up physical volume for /dev/md2 with 0 sectors
> pvcreate -- ERROR "parameter error" setting up  physical volume "/dev/md2"
I checked the archives where I saw suggestion to patch the LVM tool, but I
don=EF=BF=BDt think that is related to the latest version.
What is the problem? Should I downgrade to 2.4.7?
Thanks in advance,
Ferenc
