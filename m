From: Jan Rhebergen <jan@rhebergen.net>
Message-Id: <20031111173043.4ad75d3b.jan@rhebergen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how do i recover "lost" vg info?
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
Date: Tue Nov 11 10:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello there,

Trough inexperience with LVM i've got landed myself into trouble. Before posting an even lengthier story about exactly what i did i'll first briefly describe what happend.

I created an LVM system on host "titan' running Debian (sarge). It took some effort to get an LVM root file system working but I finally got it right. 

Over confident by my recent succes I decided to give another host called "doors" a similar treatment. In the process I parked a huge amount of data from "doors" on "titan". Before (i think) doing that I made a vg called doors_vg on the second hd of titan (using the whole disk as a pe). I then removed titans first hd and put doors second (data) hd in its place. Not having an os running on either drives i booted a knoppix cdrom and used that to access the lv i had created earlier. In this way I was able to copy between the drives. So far so good. 

I replaced to original first hd in titan and booted expecting my rootfs system to come up but alas it didn't. vgscan reported this error message.

ERROR "vg_read_with_pv_and_lv(): current PV" can't getdata of volume group "vg" from physical volume(s).

The vg on the second drive called "door_vg" (containing a backup of doors data) is however recognised and accessible. Logical volumes seem in order but the size of the vg seems wrong. 

pvdisplay reports a pv size of 111GB with 32GB not usable

Now, the 111GB is the size of the combined lv's on titans second drive. The non usable 32GB seems to be the combined size of the lv's on titans first drive.

I need to recover access to the vg and lv's that should be present on the first drive. How do I go about restoring this? What steps should I take to "debug"? 

I think part of the problem was using the Knoppix cdrom. Although it had lvm support it (vgscan) cannot write in the /etc directory. Reading the howtos I see that I did not go about the process in the right way.

Any advice? 


regards,

Jan





-- 
Message originates from the laptop of:
  J.B Rhebergen, Scientist EM Effects, TNO-FEL
