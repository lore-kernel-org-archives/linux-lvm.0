From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems with snapshots on sparc64
Message-ID: <20030602113939.D5039@sistina.com>
References: <20030529001029.GB16622@wh9155.stw.uni-rostock.de>
Mime-Version: 1.0
In-Reply-To: <20030529001029.GB16622@wh9155.stw.uni-rostock.de>; from daniel.bayer@stud.uni-rostock.de on Thu, May 29, 2003 at 02:10:29AM +0200
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
Date: Mon Jun  2 04:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Daniel,

which LVM version (kernel and tools) and do you have HIGHMEM configured
(IOW: more than 960M memory) ?
There's flaws with Linux 2.4.20 highmem which show with snapshots :(


On Thu, May 29, 2003 at 02:10:29AM +0200, Daniel Bayer wrote:
> Hello
> 
> I have a E250 running Debian/stable with Linux 2.4.20 (vanilla kernel,
> except for xfs). Three weeks ago I created a LV with an xfs on it. I
> also created a backupscript that uses snapshots. For two weeks
> everything worked fine.
> 
> Then I got oopses during the backup (mainly from kupdated). After that
> the system was rebooted. I had to boot with init=/bin/sh since the
> system freezed while mounting the xfs partitions (another story). I
> did a vgscan and a vgchange. After that I did a
> "lvdisplay /dev/vg1/lv_snapshot" and got the usual output and 3 times
> the error "Trying to vfree() nonexistent vm area (addr)". Then I tried
> "lvdisplay /dev/vg1/lv" and also got the vfree()-error and a
> Segmention-Fault after the line that says that there is a snapshot of
> this LV. I removed the snapshot and "lvdisplay /dev/vg1/lv" worked
> fine. After that I could bring the whole system in a working state.
> I could reproduce this.
> 
> The address in the vfree()-error message only changes after a reboot.
> I also found older vfree()-errors in the log.
> 
> The Backtrace of the oops always ends in
> | Trace; 005143e8 <lvm_map+488/580>
> | Trace; 005144e8 <lvm_make_request_fn+8/40>
> 
> Another related problem is, that "cat /proc/lvm/global" in the most
> cases doesn't output the usual data but some random memory. Its really
> odd. But if I try often enough I sometimes also get the right output
> (and no, I didn't calculated the probability). The other files in
> /proc/lvm work fine.
> 
> Since I moved the important stuff to another system I can do some
> tests and provide further informations.
> 
> 
> Daniel
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
