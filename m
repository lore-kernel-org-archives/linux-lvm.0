Message-ID: <1043839567.3e37ba4fd327e@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] 2.4.20 + xfs +lvm2 =  raid0_make_request bug
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
Date: Wed Jan 29 05:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-xfs@oss.sgi.com
Cc: linux-lvm@sistina.com, linux-kernel@vger.kernel.org

Hi, a kind of repost 
useing lvm2(with lvm1 everything is working perfect for the last 6 months)
 when i try to mount a xfs filesystem wich is on 
lv over soft raid-0, i'm getting just like in
2.5.2x - 2.5.4x (i didn't try later kernels) :

############################
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181311 4
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181343 4
############################

is this know problem, is it fixed ?
i thought that the problem exist only in 2.5 kernel

everything works with reiserfs and jfs
( well not really sure but i could transfer ~10Gb to and from the LV, mkfs ..)

but with xfs got this:
mkfs.xfs -- 
device-mapper: unknown block ioctl 0x6424
device-mapper: unknown block ioctl 0x6424

and with mount again :

raid0_make_request bug: can't convert block across chunks or bigger than 16k
213164570 4
raid0_make_request bug: can't convert block across chunks or bigger than 16k
213164602 4

any hints?

regards,

svetljo
