Message-Id: <3C4D61CF.12330DF1@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] 64K limit for VG/LV
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
Date: Tue Jan 22 06:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

I just merged two volume groups without any error message,
but the result seems to have more than 65535 LE now. The only
effect until now is, that the number of free PE becomes negative
and is displayed as an unsigned huge value:

--- Volume group ---
VG Name               vg0
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                9
Open LV               2
MAX LV Size           255.99 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               286.33 GB
PE Size               4.00 MB
Total PE              73300
Alloc PE / Size       97200 / 379.69 GB
Free  PE / Size       4294943396 / 1.91 TB
VG UUID               QDKBpV-xwqr-gO3b-VKiA-Jaf4-grmm-pWEY32

My VG consists of 4 x 75 GB IBM-DTLA-307075. Should I worry now?
If there is any limit of 65536 I might suspect some 16bit value
for PE addressing. If no overflow is checked, a wrong PE may be
addressed beyond LE 65536 and my VG possibly gets destroyed :-(

But I found some hints in the mailing archive, saying that the
64K limit does not affect the VG itself but only each LV inside.
Thus as long as each of my LV is <256G I don't have to worry, and
the reported "Free PE" might be just cosmetics.

Besides, vgdisplay says: "Logical Volume Manager 1.0.1-rc2"
On SuSE 7.3 running 2.4.16.

If I want to increase my LE size, I think I have to create a new VG.
Is there any tool to copy my LVs to the new VG other than "dd"?

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
    stueken@conterra.de         stueken@qgp.uni-muenster.de
    http://www.conterra.de/     http://qgp.uni-muenster.de/~stueken
    (0)251-980-2027             (0)251-83-334974
