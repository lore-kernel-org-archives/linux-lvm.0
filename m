Return-Path: <riel@conectiva.com.br>
Date: Tue, 6 Feb 2001 11:01:21 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] vgscan -- ERROR -132: volume group "vgall" is
 inconsistent
In-Reply-To: <20010206120129.F8914@srv.sistina.com>
Message-ID: <Pine.LNX.4.21.0102061056100.1535-100000@duckman.distro.conectiva>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 6 Feb 2001, Heinz J. Mauelshagen wrote:

> The bug you are facing with vgscan should already be fixed with
> LVM 0.9.1 beta3 which you can get from www.sistina.com.

Not all critical bugs from vgscan are gone, however...

...
vg_read_with_pv_and_lv -- AFTER lv_read_all_lv; vg_this->pv_cur: 3 vg_this->pv_max: 256  ret: 0
lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE of LV" vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "vg0" from physical volume(s)
lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE of LV"vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"
...

Full debugging output attached to this bug:
http://bugzilla.sistina.com/show_bug.cgi?id=153

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
