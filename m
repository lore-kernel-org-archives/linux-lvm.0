From: "Mark H. Wood" <mwood@IUPUI.Edu>
Message-ID: <Pine.LNX.4.55.0306051525561.3269@mhw.ULib.IUPUI.Edu>
MIME-Version: 1.0
Subject: [linux-lvm] Huge PV yields huge /etc/lvmtab.d/* overfilling initrd -- ideas?
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
Date: Thu Jun  5 17:28:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm setting up a box on Red Hat 9 to run a large database application.
After creating a couple of large LVs (264GB total) and making all sorts of
other adjustments, I rebooted the box to be sure everything would start
properly.  Nope, now vgscan errors out:

  vgscan -- found inactive volume group "Volume00"
         -- ERROR 2 writing volume group backup file  /etc/lvmtab.d/Volume00.tmp
  vgscan -- ERROR: unable to do a backup of volume group "Volume00"
  vgscan -- ERROR: "lvm_tab_vg_remove(): unlink" removing volume group  "Volume00" from /etc/lvmtab

After getting over wishing that "ERROR 2" told me something I could use, I
eventually figured out that the real problem was ENOSPC -- Red Hat
supplies an initrd of around 3MB and vgscan is trying to use 2MB of it for
the backup.

I worked around it by copying the contents of the initrd image to a larger
filesystem and re-imaging, but of course this only works until the next
weekly kernel erratum supplies a new image.  Any ideas about something
more permanent I can do, short of "dump all the data, repartition, and
reinstall"?

("Bug Red Hat to expand their initrd" only works until someone comes along
with an even bigger blob of storage and hits the new limit.  There's no
way to get off that merry-go-round.)

-- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
MS Windows *is* user-friendly, but only for certain values of "user".
