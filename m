Message-ID: <3E5CFF63.5040009@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgimport problem
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
Date: Wed Feb 26 11:55:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

sorry, I just got the next problem, hopefully not that stupid again :-)

I exported a VG of three PV's last week.
When I now try to import them again, I get:

-> vgimport data3 /dev/hdc /dev/hdd2 /dev/hdb
vgimport -- ERROR: wrong number of physical volumes to import volume 
group "data3"

I looked into each PV by pvdata and everything seems OK.
The UUIDs are OK and there are exactly 3 ones listed.
I can't get any hint about any missing PV. Running vgimport -v
does not report any additional errors, too.

any advice?

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
