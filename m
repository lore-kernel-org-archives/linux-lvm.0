From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Recovering inconsistent vg
Message-ID: <20020605123903.GH1061@tykepenguin.com>
References: <20020605003728.GA3783@continuum.cm.nu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020605003728.GA3783@continuum.cm.nu>
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
Date: Wed Jun  5 07:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 04, 2002 at 05:37:28PM -0700, Shane Wegner wrote:
> Hi all,
> 
> I'm not sure how this happened but after rebooting, I am
> getting the following from vgscan.
> continuum:~# vgscan
> vgscan -- reading all physical volumes (this may take a
> while...)
> vgscan -- found inactive volume group "vg0"
> vgscan -- ERROR "lv_check_consistency(): LV status" volume
> group "vg0" is inconsistent
> vgscan -- ERROR: unable to do a backup of volume group
> "vg0"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing
> volume group "vg0" from "/etc/lvmtab"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully
> created
> vgscan -- WARNING: This program does not do a VGDA backup
> of your volume group
> 


If this is a recent debian unstable upgrade then you should get
the latest 1:1.0.4-4 deb (uploaded this morning GMT) that fixes 
the problem.

patrick
