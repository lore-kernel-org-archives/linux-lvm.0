Return-Path: <mikem@twisted.net>
Message-ID: <3A7F6413.A80D1803@twisted.net>
Date: Mon, 05 Feb 2001 21:40:19 -0500
From: Michael McLinn <mikem@twisted.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 0.9.1 vgscan doesn't detect upgraded vg's
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
To: linux-lvm@sistina.com

Hello,

I was running some large vg's with 0.8final, and upgraded
to 0.9.1_beta3 w/ kernel 2.4.1-ac2.  

After the upgrade, vgscan does not find any volume groups.

Reverting to prior tools + kernel does not work as the on disk
vg structures have been altered (presumably upgraded to the v2 
format). 

I have no suitably recent vgcfg backups, so restoring is not an
option.  

Thus, I have been digging in vgscan to see what is going wrong.

My question is this...

I look at the output of pvdata -U on a physical volume. 
I see 3 UUID slots, which matches the number of pv's in the vg.
However, on the first pv in the vg, only the first one is filled.
On the second pv in the vg, the first two are filled.  On the 
third pv of the vg, all three are filled. 

Within pv_read_all_pv_of_vg.c, there is a call to 
pv_read_uuidlist(), this routine is scanning the first pv, 
and thus only returns one uuid.

Later the result is only the first pv is returned from
pv_read_all_pv_of_vg().  

My theory is each pv is supposed to have the the UUID's of 
itself, and all other pv's in it's vg within it's UUID 
datastructure.  Is this so?

If this is the case, it seems it would be possible to write the 
correct UUID's to the datastructure on disk, and potentially 
improve (maybe even fix) my situation.

Any advice would be welcome.  A lot of important data is riding on 
solving this problem.

One more note that might be of interest, these volume groups were
created with a much earlier version of lvm, 0.6 or 0.7 I believe.

Thank you.

-Michael McLinn
