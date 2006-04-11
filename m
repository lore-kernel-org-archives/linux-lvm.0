Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k3BExQ0P023156
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2006 10:59:26 -0400
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <20060408211158.56899.qmail@web60411.mail.yahoo.com>
References: <20060408211158.56899.qmail@web60411.mail.yahoo.com>
Message-Id: <0aa81d30ea28716535a28bd942327f3a@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Concise LVM Summary
Date: Tue, 11 Apr 2006 10:00:46 -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

You can pretty much print things how you want by specifying the right 
things on the command line.  'lvs' and friends will default to printing 
out certain columns, but you can change that.

prompt> lvs --noheadings # print things out without the headings
prompt> lvs --noheadings -o lv_name  #print just the lv names
prompt> lvs --noheadings -o lv_name, uuid  #print the lv names and 
their uuid
etc

for a more complete list, see the various man pages

  brassow



On Apr 8, 2006, at 4:11 PM, <linux_user98765@yahoo.com> wrote:

> I'm trying to write a perl script to give concise output of
> pvs, vgs, lvs, pvdisplay, vgdisplay, lvdisplay and df -- something
> like:
>
>
> VG home [PE (4MB): 0 (0 b) / 52205 (203.93 GB)]
> LV /dev/home/lvol0 /home [LE: 52205 (203.93 GB); DF: 64G/201G (129G)
> 34%]
> PV /dev/sdb [PE (4096KB): 0 (0 b) / 38156 (149.05 GB); DF: ??/149G (??)
> ??%]
> PV /dev/hdb4 [PE (4096KB): 0 (0 b) / 14049 (54.88 GB); DF: ??/55G (??)
> ??%]
>
>
> however, there are a few things I have yet to figure out:
>
> - determine the actual disk usage of a particular PV in a given LV
> - the lvs column option which produces the heading "Log"
> - the nature of the pvs,vgs,lvs separator inconsistencies:
>
> lvs - Headers and LV lines are separator terminated
> vgs - Headers not separator terminated, VG lines are
> pvs - Headers not separator terminated, PV lines are
>
> - The unabreviated names of the column headings
>   (a website detailing each would be nice)
> - whether pvdisplay,vgdisplay,lvdisplay offer anything more than
>   pvs, vgs, lvs with all columns displayed
> - Why the majority of pvs,vgs,lvs columns lack data
>
> I'm still working on the code, but the above are the major stumbling
> blocks I've come across so far...
>
> TIA!
>
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
