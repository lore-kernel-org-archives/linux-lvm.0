From: Eduard Bloch <edi@gmx.de>
Message-Id: <20020222102651.GA2134@zombie.inka.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] using a read-only PV
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
Date: Fri Feb 22 04:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

is it possible to use a physical volume in read-only mode? The idea is:
put a snapshot of the PV on a CDROM. Later, build a volume group, with
this read-only volume as the first volume in the snapshot mode, and an
additional volume on the harddisk where the differences are stored.

Is a such scenario possible - or already useable?

Gruss/Regards,
Eduard.
-- 
The UNIX Guru's view of Sex:
unzip ; strip ; touch ; finger ; mount ; fsck ; more ; yes ; umount ;
sleep                                      [Hauke Heidtmann in dcoud]
