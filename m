From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Message-ID: <yw1xbru9l2x3.fsf@users.sourceforge.net>
References: <yw1xwucyty8b.fsf@users.sourceforge.net> <20030828132053.C14441@uk.sistina.com>
 <yw1xy8xdlin0.fsf@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Recovering from disk failure
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
Date: Thu Aug 28 19:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

mru@users.sourceforge.net (M�ns Rullg�rd) writes:

>>> Recently one of two disks in a volume group crashed, and I can't read
>>> it at all.  Now, some LVs are entirely on the disk that survived.  Is
>>> there any way I can just disable the broken LVs and continue using the
>>> complete ones?  I'm using device-mapper and LVM2
>>
>> Read the description of '--partial' on the lvm(8) man page.
>> e.g. (lv|vg)change -ay --partial
>
> I should have read the manuals before mailing.  However, I still have
> some questions.  Some LVs were split between the two disks.  With the
> --partial option, it won't let me see them at all.  Can I do something
> to get just read errors, or zeros, or whatever for the missing
> sectors?  I could of course do some manual work with dd, but an
> automated method seems easier.

I figured it out, after reading some source code to determine that the
dmsetup man page is incorrect.  It tried to tell me that the
"target_type" for an all-errors mapping is "io-err", when it is in
fact "error".  Someone should fix this.

-- 
M�ns Rullg�rd
mru@users.sf.net
