From: Gunther Kuhlmann <gunther-kuhlmann@easy-call.net>
Message-Id: <20020412140325.L1346@tui.easy-call.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vgscan segfault at bootup
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
Date: Fri Apr 12 07:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Gurus!

I have a system with several VGs (none spanning across physical disks).
Installed systems are SuSE 7.2, which I use most of the time, and SuSE
7.3. After a hard disk failure, I meddling with some of the VGs (data
recovery and the like on new hard disk onto new VGs). The VG names on
the broken disk I have not re-used on the new disk, but chose new names.
I did all this from SuSE 7.2.

Yesterday, after some time, I tried to boot SuSE 7.3. During bootup,
vgscan secfaulted, leaving me without /usr, /opt and /home, which is
not really useful. What do I need to do to recover? At least most of
the VGs are used by both systems and I do not want to destroy them.

Do I probably need to remove some files which are in the way?

All kernes, tools etc are from the two SuSE distributions.

Regards,

Gunther

-- 
Dipl.-Ing. Gunther Kuhlmann
gunther_kuhlmann@mentorg.com
gunther-kuhlmann@easy-call.net
Tel.: +49 (0)40 / 75 11 84 40
PGP: E6 BC 78 6B E6 09 C7 16  AB 5D 9A 9A D7 1C 01 FB
-- 
