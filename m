Date: Fri, 7 Sep 2001 10:35:15 +0000
From: Tomas Edwardsson <tommi@tommi.org>
Message-ID: <20010907103515.B32257@hp.is>
References: <20010906123245.B28532@hp.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010906123245.B28532@hp.is>; from tommi@tommi.org on Thu, Sep 06, 2001 at 12:32:45PM +0000
Subject: [linux-lvm] Re: Problem with vgscan "only found 626 of 625 LEs for LV"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hmm, anyone able to help with this? All my data is currently offline and
I really need it back so if anyone could help please!

- Tommi

On Thu, Sep 06, 2001 at 12:32:45PM +0000, Tomas Edwardsson wrote:
> Here is what vgscan shows:
> 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "vg00"
> vgscan -- only found 626 of 625 LEs for LV /dev/vg00/lvol1 (0)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "vg00" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"
> 
> I also tried pvscna, but I don't know if that's relevant:
> 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdb2"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdc2"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hdd1"  is associated to an unknown VG (run vgscan)
> pvscan -- total: 3 [16.00 GB] / in use: 3 [16.00 GB] / in no VG: 0 [0]
> 
> - Tomas Edwardsson
