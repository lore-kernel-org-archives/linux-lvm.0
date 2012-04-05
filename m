Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q35I7lrv007192
	for <linux-lvm@redhat.com>; Thu, 5 Apr 2012 14:07:47 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q35I7j9P012387
	for <linux-lvm@redhat.com>; Thu, 5 Apr 2012 14:07:46 -0400
Received: from [10.0.2.103]
	(r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net [74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id 96F7620833
	for <linux-lvm@redhat.com>; Thu,  5 Apr 2012 13:07:43 -0500 (CDT)
References: <4F7CE981.1080206@nuclearwinter.com>
	<20120405110221.31bf8cd4@bettercgi.com>
	<4F7DD831.3020506@nuclearwinter.com>
In-Reply-To: <4F7DD831.3020506@nuclearwinter.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----GL9A8BIGQSPOS0S4KDE2EOA9JTJEZD"
From: Ray Morris <support@bettercgi.com>
Date: Thu, 05 Apr 2012 13:07:38 -0500
Message-ID: <ff686e16-ac0a-48b7-b146-c0301232e7d5@email.android.com>
Subject: Re: [linux-lvm] Frozen root volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

------GL9A8BIGQSPOS0S4KDE2EOA9JTJEZD
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit

Depending on syslog.conf, there may well be messages in the logs not on the console.

I have experienced similar issues with software RAID 5 which were not present with hardware RAID and they showed up around the same kernel version as your experience.

There is a fix headed to the mainline kernel for a deadlock in raid1.c which caused very similar symptoms under very similar loads. I suspect another variation of a similar bug exists in raid5.c but I'm not a kernel programer, so I'm speculating. You may wish to have a close look at raid5.c. Perhaps add some printk to see if you can narrow it down. Obviously putting some of your storage on HW raid and seeing if the problem persists on those devices could be informative. That would let you know whether or not to move this to the RAID list.
-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.

Larkin Lowrey <llowrey@nuclearwinter.com> wrote:

I have the serial console output going to a logging terminal server so
I'm able to capture everything that is sent to the console and I've seen
no errors or any other unusual output prior to these freezes. Would
rsyslog produce different results?

My vg is atop 4 md raid devices, a tiny raid6 for the boot fs, an 8
drive raid5 for the root fs, and two 6 drive raid5s for a data fs.

The 8 drives of the root raid5 are connected to a 6 port AHCI controller
(AMD SB850) and a 2 port AHCI controller (Marvell 88SE9128).

Is there any way to determine which of these (md device, AHCI
controller, disk) is the culprit? I have been able to read from each of
the constituent drives so I know that I/O at that level can take place.
I can't think of a safe way to test writes non-destructively.

--Larkin

On 4/5/2012 11:02 AM, Ray Morris wrote:
> What does your storage stack look like? Something in the stack froze
> up. It could be your SAN storage device, if you're using one, the switch
> connecting to the SAN, if you're using one, the RAID card, if you're
> using one, the software RAID, if you're using software RAID ...
>
> A reasonable next step if there is nothing in the logs because are on
> the root device might be to use rsyslog to send the log data to a
> neighboring machine. That would you can see the messages in the log no
> matter which local storage has a problem. 

_____________________________________________

linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


------GL9A8BIGQSPOS0S4KDE2EOA9JTJEZD
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head></head><body>Depending on syslog.conf, there may well be messages in the logs not on the console.<br>
<br>
I have experienced similar issues with software RAID 5 which were not present with hardware RAID and they showed up around the same kernel version as your experience.<br>
<br>
There is a fix headed to the mainline kernel for a deadlock in raid1.c which caused very similar symptoms under very similar loads. I suspect another variation of a similar bug exists in raid5.c but I&#39;m not a kernel programer, so I&#39;m speculating. You may wish to have a close look at raid5.c. Perhaps add some printk to see if you can narrow it down. Obviously putting some of your storage on HW raid and seeing if the problem persists on those devices could be informative. That would let you know whether or not to move this to the RAID list.<br>
-- <br>
Sent from my Android phone with K-9 Mail. Please excuse my brevity.<br><br><div class="gmail_quote">Larkin Lowrey &lt;llowrey@nuclearwinter.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre style="white-space: pre-wrap; word-wrap:break-word; font-family: sans-serif">I have the serial console output going to a logging terminal server so<br />I'm able to capture everything that is sent to the console and I've seen<br />no errors or any other unusual output prior to these freezes. Would<br />rsyslog produce different results?<br /><br />My vg is atop 4 md raid devices, a tiny raid6 for the boot fs, an 8<br />drive raid5 for the root fs, and two 6 drive raid5s for a data fs.<br /><br />The 8 drives of the root raid5 are connected to a 6 port AHCI controller<br />(AMD SB850) and a 2 port AHCI controller (Marvell 88SE9128).<br /><br />Is there any way to determine which of these (md device, AHCI<br />controller, disk) is the culprit? I have been able to read from each of<br />the constituent drives so I know that I/O at that level can take place.<br />I can't think of a safe way to test writes non-destructively.<br /><br />--Larkin<br /><br />On 4/5/2012 11:02 AM
 , Ray
Morris wrote:<br />&gt; What does your storage stack look like? Something in the stack froze<br />&gt; up. It could be your SAN storage device, if you're using one, the switch<br />&gt; connecting to the SAN, if you're using one, the RAID card, if you're<br />&gt; using one, the software RAID, if you're using software RAID ...<br />&gt;<br />&gt; A reasonable next step if there is nothing in the logs because are on<br />&gt; the root device might be to use rsyslog to send the log data to a<br />&gt; neighboring machine. That would you can see the messages in the log no<br />&gt; matter which local storage has a problem. <br /><br /><hr /><br />linux-lvm mailing list<br />linux-lvm@redhat.com<br /><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br />read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO">http://tldp.org/HOWTO/LVM-HOWTO</a>/<br /><br /></pre></blockquote></div></body></html>
------GL9A8BIGQSPOS0S4KDE2EOA9JTJEZD--
