Message-ID: <000701c1662e$69e79d00$8400a8c0@EFOLAPTOP>
From: "Frode Ulsund" <frode@gangstah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem with activating volume group
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
Date: Mon Nov  5 13:08:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-LVM@sistina.com

Hi there!

I have read all the documentation in the LVM-package and your homepage, but
i can't find a
sollution to my problem in the HOW-TOs.

I run kernel 2.4.13 with Slackware 8.0. I tried to patch the rc.S with the
patch i found on your homepage
but it looks like the patch is allready applied in the distribution.

I have loaded LVM as a module in the boot. Everything runs perfectly until i
try to activate my
volume group "vg01".

When i run  : vgchange -v -d -a y i get the following output, but I don't
really know what the problem is.

Any help is aprichiated.

And thank you for making great software.

mvh
Frode Ulsund
-------------------------------------------------------------------------
<333> vg_check_name -- vg_name: "vg01"
<4444> lvm_check_chars -- CALLED with name: "vg01"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency -- LEAVING with ret: 0
<1> vg_create_remove -- IOCTL
<1> vg_create_remove -- IOCTL returned: -22
<1> vg_create_remove -- LEAVING with ret: -22
<> vgchange -- vg_create returned: -22
<1> lvm_error -- CALLED with: -22
<1> lvm_error -- LEAVING with: "Invalid argument"
vgchange -- ERROR "Invalid argument" activating volume group "vg01"
<1> vg_free -- CALLED
<1> vg_free -- entering PV loop
<1> vg_free -- entering LV loop
<1> vg_free -- LEAVING with ret: 0
vgchange -- unlocking logical volume manager
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
