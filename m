Return-Path: <gashaw@asosa.org>
Message-ID: <3A7B17B2.8A75537B@asosa.org>
Date: Fri, 02 Feb 2001 15:25:22 -0500
From: Gashaw Mengistu <gashaw@asosa.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F78742B140659BA77D315707"
Subject: [linux-lvm] startup scripts
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------F78742B140659BA77D315707
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello all,

New here. 
I am trying to get my RAID working with LVM. So far so good. But I have
a couple of questions:

Where does the startup script go? I tried to put it in rc.sysinit right
after the hostname setup and tells me LVM startup is sucessful but would
not really start the VG. It fails on fsck. Then it drops me to shell and
I can manually start LVM by doing vgchange -ay (exact same way it is in
rc.sysinit) and do fsck and continue booting from there. What gives?

The other question is probably just a fluke but I couldn't create a
directory on the file system mounted on LVM. I can create files though.
But then it went away when I rebooted.

Thanks
--------------F78742B140659BA77D315707
Content-Type: text/x-vcard; charset=iso-8859-1;
 name="gashaw.vcf"
Content-Transfer-Encoding: base64
Content-Description: Card for Gashaw Mengistu
Content-Disposition: attachment;
 filename="gashaw.vcf"

YmVnaW46dmNhcmQgCm46TWVuZ2lzdHU7R2FzaGF3CngtbW96aWxsYS1odG1sOkZBTFNFCmFk
cjo7Ozs7OzsKdmVyc2lvbjoyLjEKZW1haWw7aW50ZXJuZXQ6Z2FzaGF3QGFzb3NhLm9yZwp0
aXRsZTpTeXN0ZW1zIEVuZ2luZWVyCngtbW96aWxsYS1jcHQ6OzAKZm46R2FzaGF3IE1lbmdp
c3R1CmVuZDp2Y2FyZAo=
--------------F78742B140659BA77D315707--
