From: Harald Milz <hmilz@linux-magazin.de>
Subject: Re: [linux-lvm] how to determine if /dev/... is an LV?
References: <20010822034425.F8742@pc.ilinx>
Date: Thu, 23 Aug 2001 17:48:53 +0200 (CEST)
Message-Id: <20010823155337.98AD115C64@mail.linux-new-media.de>
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In article <20010822034425.F8742@pc.ilinx>, Brian J. Murrell <6888736b923846176364586bf2e7649f@interlinx.bc.ca> wrote:

> lvdisplay -D -c /dev/VG/lvol1 2>&1 | grep "^/dev/VG/lvol1" >/dev/null

lvdisplay -D -c /dev/VG/lvol1 2>&1 | grep -q ^/dev/VG/lvol1 && do whatever
you want :-) 

-- 
Harald Milz           |     hm@linux-magazin.de     | "He was a modest,
Linux New Media AG    | phone  +49 (0) 89 993411-20 | good-humored boy. It
Stefan-George-Ring 24 | fax    +49 (0) 89 993411-99 | was Oxford that made
D-81929 Muenchen      | http://www.linux-magazin.de | him insufferable."
