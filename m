From: "Abu @ Trabas Dot Com" <abu@trabas.com>
Message-ID: <20011114152558.H9398@trabas.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] vgscan -- LVM driver/module not loaded?
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
Date: Wed Nov 14 02:09:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am only monitoring this mailing, but now i have a few question.
after I did a patch kernel with lvm 1.0.1-rc4, and compile and build
with rpm, the kernel config like:

CONFIG_BLK_DEV_LVM=3Dy
CONFIG_LVM_PROC_FS=3Dy

succeed. but when i try following INSTALL file and vgscan result
said vgscan -- LVM driver/module not loaded?

why the vgscan said that, I did compile lvm not be module, any explanation.
and how to fix it?

thanks.


--=20
   __  =20
  (oo) =20
 / \/ \ GnuPg public information         pub 1024/EBD26280=20
 `V__V' A9A9 8F57 9E9D 14E3 05B4  3EDB C241 A313 EBD2 6280
You will pass away very quickly.
