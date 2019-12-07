Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B6B4A319D
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 17:37:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CB4F1024D1C
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 17:37:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t2so11340949wrr.1
	for <linux-lvm@redhat.com>; Sat, 07 Dec 2019 09:37:51 -0800 (PST)
Received: from [10.96.255.164] (mob-5-90-86-116.net.vodafone.it. [5.90.86.116])
	by smtp.gmail.com with ESMTPSA id
	x11sm3212665wmg.46.2019.12.07.09.37.48 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Dec 2019 09:37:49 -0800 (PST)
Date: Sat, 07 Dec 2019 18:37:45 +0100
Message-ID: <1p3erjcoc4qsk3gplvduhoep.1575740265800@gmail.com>
From: Roberto Fastec <roberto.fastec@gmail.com>
In-Reply-To: <CADxRZqyWbvoGGVJXdx9Mj+9toTM8tSMP9oUE8F0b+OhYqJ4uUA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Did you thought about RAID 50 ?




  Messaggio originale  


Da: matorola@gmail.com
Inviato: 7 dicembre 2019 17:17
A: linux-lvm@redhat.com
Rispondi a: linux-lvm@redhat.com
Oggetto: Re: [linux-lvm] Best way to run LVM over multiple SW RAIDs?


On Tue, Oct 29, 2019 at 12:14 PM Daniel Janzon
<daniel.janzon@edgeware.tv> wrote:
>
> Hello,
>
> I have a server with very high load using four NVMe SSDs and therefore no HW RAID. Instead I used SW RAID with the mdadm tool. Using one RAID5 volume does not work well since the driver can only utilize one CPU core which spikes at 100% and harms performance. Therefore I created 8 partitions on each disk, and 8 RAID5s across the four disks.
>
> Now I want to bring them together with LVM. If I do not use a striped volume I get high performance (in expected magnitude according to disk specs). But when I use a striped volume, performance drops to a magnitude below. The reason I am looking for a striped setup is to ensure that data is spread well over the drive to guarantee a good worst-case performance. With linear allocation rather than striped, if load is directed to files on the first PV (a SW RAID) the system is again exposed to the 1-core limitation.
>
> I tried "--stripes 8 --stripesize 512", and would appreciate any ideas of other things to try. I guess the performance hit can be in the file system as well. I tried XFS and EXT4 with default settings.

Daniel,

a bit more about your system? Like kernel version, io scheduler, etc..
Have you tried with recent kernels MQ (multi-queue) schedulers (noop,
deadline) ?


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
