From: Daniel Ahlberg <aliz@telia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200208051249.58901.aliz@telia.com>
Subject: [linux-lvm] Moving LVM data off a bad disk
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
Date: Mon Aug  5 05:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, linux-kernel@vger.kernel.org

Hi,

Recently one of my harddisks began to develop bad sectors. I decided to a=
dd a=20
another disk to replace the disk and run pvmove -i to salvgage as much as=
=20
possible to the spare disk. But, the process takes seems to take ages. Fo=
r=20
every bad sector pvmove encounters it takes 5 seconds for the kernel to=20
timeout and move on to the next sector. Some calculation would tell me th=
at=20
it would take approx 6 years to go through the rest of the disk.

So, is there any way to speed up this? I was thinking in the ways of redu=
cing=20
the 5 second timeout or having the disk driver simply skip the bad sector=
s.

These are the errors I get:

Aug  4 00:01:31 springbird kernel: hdc: dma_intr: status=3D0x51 { DriveRe=
ady=20
SeekComplete Error }
Aug  4 00:01:31 springbird kernel: hdc: dma_intr: error=3D0x40 {=20
UncorrectableError }, LBAsect=3D34880281, sector=3D34880218
Aug  4 00:01:31 springbird kernel: end_request: I/O error, dev 16:01 (hdc=
),=20
sector 34880218
Aug  4 00:01:36 springbird kernel: hdc: dma_intr: status=3D0x51 { DriveRe=
ady=20
SeekComplete Error }
Aug  4 00:01:36 springbird kernel: hdc: dma_intr: error=3D0x40 {=20
UncorrectableError }, LBAsect=3D34880283, sector=3D34880220
Aug  4 00:01:36 springbird kernel: end_request: I/O error, dev 16:01 (hdc=
),=20
sector 34880220
