From: Jake Roersma <jacob.roersma@priority-health.com>
Message-Id: <1072728458.1600.14.camel@phobos.internal.priority-heatlh.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Interesting LVM1 to LVM2 migration issues.
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
Date: Tue Dec 30 09:33:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I ran into an interesting problem after I upgraded from LVM1 to LVM2
that I would like to share.  My setup when running LVM1 with linux
kernel 2.4.20 consisted of 6 logical volumes (lv_home, lv_opt, lv_use,
lv_var, lv_var_snap, lv_var_copy) all in the same volume group called
lvm00.  lv_var_snap was a test LV that I setup to snapshot lv_var, and
lv_var_copy was a seperate LV that I used to copy lv_var with, all of
which were the same size.  

After I migrated to LVM2 I found that with device mapper it was seeing
the original LV lv_var as lv_var-real, which is only the begining of my
troubles. After fixing fstab to point to the new naming of my lv_var, I
decided since I was not using lv_var_snap and lv_var_copy that I should
removed them.  After removing lv_var_snap I noticed that the device file
for lv_var-real was gone, both in /dev/mapper and in /dev/lvm00. 
Interestingly enough /var was still mounted and operational.  I ran
vgscan and vgchange -a y, and that found all of my LV's but now my
lv_var-real was renamed back to its original lv_var.  Luck for me I
noticed this and was able to update fstab before I rebooted.

My question is, why does LVM2 feel the need to change the names of the
logical volumes that I have created?  I feel perfectly confident in my
naming abilities :)..  Also, why after deleting a snapshot of an LV, was
the original LV device file (although with its new name) removed with
it?  And, after I ran vgscan and vgchange -a y, why did LVM2 feel the
need to change the name of my LV back to its original name? Thanks for
the help.

- Jake






** ** **  PRIVILEGED AND CONFIDENTIAL  ** ** **
This email transmission contains privileged and confidential information 
intended only for the use of the individual or entity named above.  Any 
unauthorized review, use, disclosure or distribution is prohibited and 
may be a violation of law.  If you are not the intended recipient or a 
person responsible for delivering this message to an intended recipient, 
please delete the email and immediately notify the sender via the email 
return address or mailto:postmaster@priority-health.com.  Thank you.
