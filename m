From: Lars-Gunnar Ellenberg <lglnberg@rz.uni-potsdam.de>
Message-Id: <Pine.GSO.4.30.0202111056330.13668-100000@persius.rz.uni-potsdam.de>
MIME-Version: 1.0
Subject: [linux-lvm] lvm cannot vgchange -a y _pv_get_number failed for rdev = 65535
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
Date: Mon Feb 11 04:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, jpattinson@yahoo.com, mag@bunuel.tii.matav.hu

hi,
I found only three matches, two postings, for this, and no solution. may
be you solved this problem back then, and can tell me about it.

I cannot vgchange -a y :
_pv_get_number_failed for rdev = 65535
_lvm_snapshot_fill_COW_page failed

(I once toyed around with a snapshot, but never used it actually, and
obviously never removed it again)

so is there an "easy" solution except recreating the whole thing and
hoping for some recent backup (which I doubt...)

if theres no solution, is there a way to dd the data somewhere
 and mount -o loop it to get the data back?


--                                                       ,,,

 -- Lars                                                (o o)
                                                  ---o00-(_)-00o----
