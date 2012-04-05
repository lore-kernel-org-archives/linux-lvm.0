Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q35Haqgh020322
	for <linux-lvm@redhat.com>; Thu, 5 Apr 2012 13:36:52 -0400
Received: from titan.nuclearwinter.com (titan.nuclearwinter.com
	[209.40.204.131])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q35Hah6w021734
	for <linux-lvm@redhat.com>; Thu, 5 Apr 2012 13:36:43 -0400
Message-ID: <4F7DD831.3020506@nuclearwinter.com>
Date: Thu, 05 Apr 2012 12:36:49 -0500
From: Larkin Lowrey <llowrey@nuclearwinter.com>
MIME-Version: 1.0
References: <4F7CE981.1080206@nuclearwinter.com>
	<20120405110221.31bf8cd4@bettercgi.com>
In-Reply-To: <20120405110221.31bf8cd4@bettercgi.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ray Morris <support@bettercgi.com>

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
