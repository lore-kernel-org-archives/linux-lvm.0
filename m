Return-Path: <elim@nutrot.ern-e.org>
Date: Tue, 21 Aug 2001 05:53:48 -0400 (EDT)
From: elim <elim@nutrot.ern-e.org>
Message-ID: <Pine.LNX.4.21.0108210453440.15709-100000@nutrot.ern-e.org>
MIME-Version: 1.0
Subject: [linux-lvm] Ow.. not again
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

Hiya

After a lengthy period of uptime, my Linux box was rebooted today and this
is what it spewed out on bootup:

vgscan -- found inactive volume group "vg01"
vgscan -- reading data of volume group "vg01" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg01" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"


I tried the vgcfgrestore but then I ended up with "No volume groups
found" error. I then tried dd'ing the vg info onto the pv's as per a
previous post which basically got me back to the "ERROR
"vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg01" from physical volume(s)" error. 

Basically Im going in circles. I even tried the uuid_fixer but it seems it
does the same thing as the dd trick.

I've scoured the faq's and read one too many list messages... can somebody
please help??? Having my fs's back would be really convenient right now :)

Kernel is 2.2.19aa1 and Iam using 0.9beta4 of lvm and the tools. The vg
on disk was created pre 0.6.. i cant remember exactly.

Thanks.
Ernie
