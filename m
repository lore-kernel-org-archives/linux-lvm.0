Message-ID: <005501c3370c$737e0600$7631a8c0@waw137>
From: "Marcin Giedz" <marcin.giedz@hermes.pl>
References: <077f01c336a7$2df27a90$6501a8c0@portege>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] busy buffer
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
Date: Fri Jun 20 04:16:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

My linux box is Debian3.0 with kernel 2.4.20 with latest patch and cvs LVM.
LVM works OK but every command like pvdisplay or lvdisplay is proceeded with
text:
    invalidate: busy buffer
    invalidate: busy buffer
    invalidate: busy buffer
    invalidate: busy buffer
    invalidate: busy buffer
    invalidate: busy buffer
    invalidate: busy buffer
    invalidate: busy buffer
LV    VG ....
zasoby_lvm    hermes_lvm ...

What is wrong???

Thanks,Marcin
