Message-ID: <3E5C980B.3000401@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: [linux-lvm] pv_move failed 
Content-Transfer-Encoding: 8bit
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
Date: Wed Feb 26 04:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

ok, is was all my fault:

I cloned my hda1 using dd and also tried to clone the MBR later
on, too. Stupidly i copied 512 bytes (instead of 446) and thus
"cloned" the partition table of my smaller 180G disk, too, and
the 240G target partition got truncated. After fixing this,
every thing works all right now.

Suggestion: For pvmove it might be helpful to report the actual
system errno occurred, if something went wrong.

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
