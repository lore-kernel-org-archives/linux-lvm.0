Return-Path: <cblunck2000@yahoo.com>
Message-ID: <20010811054020.48520.qmail@web10601.mail.yahoo.com>
Date: Fri, 10 Aug 2001 22:40:20 -0700 (PDT)
From: Christopher Blunck <cblunck2000@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Volume Groups Disappearing
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

Anyone-

Bug 193 I believed covered my issue.  However, I
cannot tell if the bug was ever resolved.  It appears
the last activity regarding bug 193 was in March or
April.  Anyhow, I'd like to ask my question and hope
someone can help me out.

I am running 2.4.7 of the kernel and was using the
0.9.0 stable release of the lvm software.  With it I
created a group named "group1" and attached 1 physical
volume to it.

I then created a logical volume based on "group1" and
then created another physical volume on a different
device.  I used the vgextend command to add the new
physical volume to "group1".  That's when things
turned heel...

vgscan reported didn't report "group1" as being a
valid group.  In fact, it returned a line stating that
there weren't any valid volume groups found.

I used pvdata to confirm that my original PV belonged
to group1 as well as the new PV.  However, I can't get
vgscan to recognize it.

I downloaded 0.9.1 beta 7 but that didn't solve the
problem.  I tried the vgcfgrestore command and that
didn't work.  I tried the dd command to fix the PV and
that didn't work.

Can someone please help me?


Thanks,
Chris

__________________________________________________
Do You Yahoo!?
Send instant messages & get email alerts with Yahoo! Messenger.
http://im.yahoo.com/
