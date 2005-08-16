Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7GIwpV04714
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 14:58:51 -0400
Received: from web52204.mail.yahoo.com (web52204.mail.yahoo.com
	[206.190.48.127])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id j7GIwfHg027623
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 14:58:42 -0400
Message-ID: <20050816185836.11869.qmail@web52204.mail.yahoo.com>
Date: Tue, 16 Aug 2005 11:58:36 -0700 (PDT)
From: <john_gore@yahoo.com>
Subject: Re: [linux-lvm] vg works fine under FC3, but not FC4
In-Reply-To: <Pine.LNX.4.62.0508160752340.29127@rray.drdc.mstc.ms.gov>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-755395049-1124218716=:1685"
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-755395049-1124218716=:1685
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Any guidance on the best way to downgrade? Yum doesnt seem to do this and I get a number of dependencies using rpm - libdevmapper.so.1.00, libdevmapper.so.1.00(base) and libreadline.so.4 
 
Thanks, John

Richard Ray <rray@mstc.state.ms.us> wrote:
I had a similar problem with FC4.
lvm2-2.01 has problems.
Downgrade to lvm2-2.00 from FC3.

Richard

On Tue, 16 Aug 2005 john_gore@yahoo.com wrote:

> My vg mounts fine under fc3, but when i installed fc4 on a new drive, I cant bring in the vg. I get errors for hdc like "Couldn't find device with uuid..." and PV unknown device (from pvscan).
>
> I can plug back in the old boot drive and run under fc3 and things work well.
>
> The vg consists of 1 lv and 2 pv drives configured as:
>
> my_vg:
> my_lv1:
> hdc2 (ext2)
> hdd (single partition as ext2)
>
> The old hda boot disk is ext3 running FC3 and the new hda boot disk is running the dafault lvm partitions under FC4.
>
> hdc is formatted with boot and swap on hdc1 and hdc5 - probably this was from an earlier install (although I did have these disks plugged in while installing FC4 - when the installer started asking about reformatting hdc and hdd, I powered down, unplugged these drives, and redid the install)
>
> Any ideas to try?
>
> - John
>
>
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--0-755395049-1124218716=:1685
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>Any guidance on the best way to downgrade? Yum doesnt seem to do this and I get&nbsp;a number of&nbsp;dependencies using rpm - libdevmapper.so.1.00, libdevmapper.so.1.00(base) and libreadline.so.4 </DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks, John<BR><BR><B><I>Richard Ray &lt;rray@mstc.state.ms.us&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">I had a similar problem with FC4.<BR>lvm2-2.01 has problems.<BR>Downgrade to lvm2-2.00 from FC3.<BR><BR>Richard<BR><BR>On Tue, 16 Aug 2005 john_gore@yahoo.com wrote:<BR><BR>&gt; My vg mounts fine under fc3, but when i installed fc4 on a new drive, I cant bring in the vg. I get errors for hdc like "Couldn't find device with uuid..." and PV unknown device (from pvscan).<BR>&gt;<BR>&gt; I can plug back in the old boot drive and run under fc3 and things work well.<BR>&gt;<BR>&gt; The vg consists of 1 lv and 2 pv drives configured as:<BR>&gt;<BR>&gt; my_vg:<BR>&gt; my_lv1:<BR>&gt; hdc2 (ext2)<BR>&gt; hdd (single partition as ext2)<BR>&gt;<BR>&gt; The old hda boot disk is ext3 running FC3 and the new hda boot disk is running the dafault lvm partitions under FC4.<BR>&gt;<BR>&gt; hdc is formatted with boot and swap on hdc1 and hdc5 - probably this was from an earlier install (althoug!
h I did
 have these disks plugged in while installing FC4 - when the installer started asking about reformatting hdc and hdd, I powered down, unplugged these drives, and redid the install)<BR>&gt;<BR>&gt; Any ideas to try?<BR>&gt;<BR>&gt; - John<BR>&gt;<BR>&gt;<BR>&gt;<BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@redhat.com<BR>https://www.redhat.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<BR></BLOCKQUOTE>
--0-755395049-1124218716=:1685--
