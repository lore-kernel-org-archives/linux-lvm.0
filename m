Return-Path: <m.vd.brink@worldonline.nl>
Content-Type: Multipart/Mixed;
  charset="iso-8859-1";
  boundary="------------Boundary-00=_1EUNW6TZDFDJ6WRONMQQ"
From: Melis van den Brink <m.vd.brink@worldonline.nl>
Date: Mon, 6 Aug 2001 21:06:01 +0200
MIME-Version: 1.0
Message-Id: <01080621060101.00882@giant.koningspage.nl>
Subject: [linux-lvm] Missing (or double) logical volume after upgrade to 2.4.7 and beta8
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

--------------Boundary-00=_1EUNW6TZDFDJ6WRONMQQ
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hello,

I'm experiencing a bit of trouble with LVM (just as I was becoming very happy 
with it :-().
I had it running on a 2.4.6 kernel patched with the beta7 lvm-stuff and some 
patches from the reiserfs-guys. That was running quite fine.
Today I performed the upgrade to linux 2.4.7 and lvm beta8. I followed the 
advice from the README.1st in upgrading to the new meta-format. I installed 
the beta8 tools and booted with the new kernel (including the patches from 
beta8). It seemed to be working until I discovered that one of my LV's was 
missing. Or better it showed the same filesystem as the one mounted on /var.

I could try to fix it, but would like to know some options as I am fairly new 
to LVM.
Attached is some information about the LVM-setup. I can give you some more, 
but I don't know what to provide you with...

--------------Boundary-00=_1EUNW6TZDFDJ6WRONMQQ
Content-Type: text/plain;
  charset="iso-8859-1";
  name="lvm.pr.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lvm.pr.txt"

CnB2c2NhbjogTG9naWNhbCBWb2x1bWUgTWFuYWdlciAwLjkuMV9iZXRhOApIZWlueiBNYXVlbHNo
YWdlbiwgU2lzdGluYSBTb2Z0d2FyZSAgMjQvMDcvMjAwMSAoSU9QIDEwKQoKcHZzY2FuIC0tIHJl
YWRpbmcgYWxsIHBoeXNpY2FsIHZvbHVtZXMgKHRoaXMgbWF5IHRha2UgYSB3aGlsZS4uLikKcHZz
Y2FuIC0tIGluYWN0aXZlIFBWICIvZGV2L3NkYTEiIG9mIFZHICJ2Z192bXdhcmUiIFsxLjk1IEdC
IC8gMCBmcmVlXQpwdnNjYW4gLS0gaW5hY3RpdmUgUFYgIi9kZXYvc2RiMSIgb2YgVkcgInZnX2li
bSIgICAgWzIuMDAgR0IgLyA0NC4wMCBNQiBmcmVlXQpwdnNjYW4gLS0gQUNUSVZFICAgUFYgIi9k
ZXYvaGRjNCIgb2YgVkcgInZnX3Jvb3QiICAgWzcuMTcgR0IgLyAyLjU1IEdCIGZyZWVdCnB2c2Nh
biAtLSBBQ1RJVkUgICBQViAiL2Rldi9oZGM2IiBvZiBWRyAidmdfcm9vdCIgICBbMS41MiBHQiAv
IDAgZnJlZV0KcHZzY2FuIC0tIHRvdGFsOiA0IFsxMi42NCBHQl0gLyBpbiB1c2U6IDQgWzEyLjY0
IEdCXSAvIGluIG5vIFZHOiAwIFswXQoKbHZzY2FuIC0tIGNoZWNraW5nIHZvbHVtZSBncm91cCBu
YW1lICJ2Z19pYm0iCmx2c2NhbiAtLSBjaGVja2luZyB2b2x1bWUgZ3JvdXAgInZnX2libSIgZXhp
c3RlbmNlCmx2c2NhbiAtLSBjaGVja2luZyB2b2x1bWUgZ3JvdXAgInZnX2libSIgYWN0aXZpdHkK
bHZzY2FuIC0tIHZvbHVtZSBncm91cCAidmdfaWJtIiBpcyBOT1QgYWN0aXZlOyB0cnkgLUQKbHZz
Y2FuIC0tIGNoZWNraW5nIHZvbHVtZSBncm91cCBuYW1lICJ2Z19yb290IgpsdnNjYW4gLS0gY2hl
Y2tpbmcgdm9sdW1lIGdyb3VwICJ2Z19yb290IiBleGlzdGVuY2UKbHZzY2FuIC0tIGNoZWNraW5n
IHZvbHVtZSBncm91cCAidmdfcm9vdCIgYWN0aXZpdHkKbHZzY2FuIC0tIGdldHRpbmcgVkdEQSBv
ZiB2b2x1bWUgZ3JvdXAgInZnX3Jvb3QiIGZyb20ga2VybmVsCmx2c2NhbiAtLSBBQ1RJVkUgICAg
ICAgICAgICAiL2Rldi92Z19yb290L2x2X3ZhciIgWzY1Mi4wMCBNQl0KbHZzY2FuIC0tIEFDVElW
RSAgICAgICAgICAgICIvZGV2L3ZnX3Jvb3QvbHZfb3B0IiBbMi41MCBHQl0KbHZzY2FuIC0tIEFD
VElWRSAgICAgICAgICAgICIvZGV2L3ZnX3Jvb3QvbHZfaG9tZSIgWzEuMDAgR0JdCmx2c2NhbiAt
LSBBQ1RJVkUgICAgICAgICAgICAiL2Rldi92Z19yb290L2x2X3VzciIgWzIuMDAgR0JdCmx2c2Nh
biAtLSBjaGVja2luZyB2b2x1bWUgZ3JvdXAgbmFtZSAidmdfdm13YXJlIgpsdnNjYW4gLS0gY2hl
Y2tpbmcgdm9sdW1lIGdyb3VwICJ2Z192bXdhcmUiIGV4aXN0ZW5jZQpsdnNjYW4gLS0gY2hlY2tp
bmcgdm9sdW1lIGdyb3VwICJ2Z192bXdhcmUiIGFjdGl2aXR5Cmx2c2NhbiAtLSBnZXR0aW5nIFZH
REEgb2Ygdm9sdW1lIGdyb3VwICJ2Z192bXdhcmUiIGZyb20ga2VybmVsCmx2c2NhbiAtLSBBQ1RJ
VkUgICAgICAgICAgICAiL2Rldi92Z19yb290L2x2X3ZhciIgWzY1Mi4wMCBNQl0KbHZzY2FuIC0t
IEFDVElWRSAgICAgICAgICAgICIvZGV2L3ZnX3Jvb3QvbHZfb3B0IiBbMi41MCBHQl0KbHZzY2Fu
IC0tIEFDVElWRSAgICAgICAgICAgICIvZGV2L3ZnX3Jvb3QvbHZfaG9tZSIgWzEuMDAgR0JdCmx2
c2NhbiAtLSBBQ1RJVkUgICAgICAgICAgICAiL2Rldi92Z19yb290L2x2X3VzciIgWzIuMDAgR0Jd
Cmx2c2NhbiAtLSA4IGxvZ2ljYWwgdm9sdW1lcyB3aXRoIDEyLjI3IEdCIHRvdGFsIGluIDIgdm9s
dW1lIGdyb3VwcwpsdnNjYW4gLS0gOCBhY3RpdmUgbG9naWNhbCB2b2x1bWVzCgojCiMgQCgjKWZz
dGFiIC0gQSBsaXN0aW5nIG9mIGFsbCB0aGUgZGV2aWNlcyB3YWl0aW5nIHRvIGJlIG1vdW50ZWQu
CiMKIyBIaXN0b3J5OgojIDI3LUp1bC0yMDAxIChicmlubTAwKToKIwlBZGRlZCB0aGUgY29tbWVu
dHMuCiMKI0RldmljZQkJCU1udC1wb2ludAlUeXBlCU9wdGlvbnMKIy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0Kbm9uZQkJCS9wcm9jCQlwcm9jCWRlZmF1bHRzCQkJCQkJCTAgMApub25lCQkJL2Rldi9w
dHMJZGV2cHRzCW1vZGU9MDYyMCAwIDAKCi9kZXYvaGRjMgkJc3dhcAkJc3dhcAlkZWZhdWx0cwkJ
CQkJCQkwIDAKL2Rldi9oZGMzCQkvCQlleHQyCWV4ZWMsZGV2LHN1aWQscncsdXNycXVvdGEsZ3Jw
cXVvdGEJMSAxCgovZGV2L3ZnX3Jvb3QvbHZfdXNyCS91c3IJCXJlaXNlcmZzCWRlZmF1bHRzCQkJ
CQkJMSAzCi9kZXYvdmdfcm9vdC9sdl92YXIJL3ZhcgkJcmVpc2VyZnMJZGVmYXVsdHMJCQkJCQkx
IDMKL2Rldi92Z19yb290L2x2X2hvbWUJL2hvbWUJCXJlaXNlcmZzCWRlZmF1bHRzCQkJCQkJMSAz
Ci9kZXYvdmdfcm9vdC9sdl9vcHQJL29wdAkJcmVpc2VyZnMJZGVmYXVsdHMJCQkJCQkxIDMKCiMv
ZGV2L3ZnX3Ztd2FyZS9sdl92bXdhcmUJL21udC92bXdhcmUJCXJlaXNlcmZzCWRlZmF1bHRzCQkJ
CQkJMSAzCgovZGV2L3NyMAkJL21udC9jZHJvbQlpc285NjYwCXJvLG5vc3VpZCxub2F1dG8sZXhl
Yyx1c2VyLG5vZGV2CTAgMAovZGV2L2ZkMAkJL21udC9mbG9wcHkJdmZhdAlzeW5jLG5vc3VpZCxu
b2F1dG8sdXNlcixub2Rldix1bmhpZGUJMCAwCiMvZGV2L2hkYTEJL21udC93aW5fYwl2ZmF0CXVz
ZXIsZXhlYyx1bWFzaz0wCQkJCQkwIDAKIy9kZXYvaGRjNQkvbW50L2dhbWVzCXZmYXQJdXNlcixl
eGVjLHVtYXNrPTAJCQkJCTAgMAo=

--------------Boundary-00=_1EUNW6TZDFDJ6WRONMQQ--
