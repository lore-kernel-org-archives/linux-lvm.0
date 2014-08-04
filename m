Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s74Abd2K028554
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2014 06:37:39 -0400
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s74AbTwY013664
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2014 06:37:30 -0400
Received: by mail-vc0-f179.google.com with SMTP id hq11so10647994vcb.10
	for <linux-lvm@redhat.com>; Mon, 04 Aug 2014 03:37:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMEXTZp7KxuhfGa743a4_mDStfqnWQULqzeivZjtriVMip6b_Q@mail.gmail.com>
References: <CAMEXTZp7KxuhfGa743a4_mDStfqnWQULqzeivZjtriVMip6b_Q@mail.gmail.com>
Date: Mon, 4 Aug 2014 14:37:28 +0400
Message-ID: <CADxRZqzmzh9Kz9uyaT6w-jdmWLmA+EWsaAE0n7khjRgRAMT6Uw@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
Subject: Re: [linux-lvm] Monitoring LVM RAID
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jul 25, 2014 at 3:57 PM, Eugene Bright <hexumg@gmail.com> wrote:
> Could you help me with me question about LVM?
>
> I've read a ton of manuals, but found nothing.
> I'm not sure about direction. Let me know if I sent email to wrong address.
>
> I can't find right way to monitor LVM RAID status.
> Is there something like mdadm --monitor?


# systemctl status lvm2-monitor
lvm2-monitor.service - Monitoring of LVM2 mirrors, snapshots etc.
using dmeventd or progress polling
   Loaded: loaded (/usr/lib/systemd/system/lvm2-monitor.service; enabled)
   Active: active (exited) since Mon 2014-08-04 14:35:44 MSK; 18s ago
     Docs: man:dmeventd(8)
           man:lvcreate(8)
           man:lvchange(8)
           man:vgchange(8)
  Process: 17893 ExecStart=/sbin/lvm vgchange --monitor y
(code=exited, status=0/SUCCESS)
 Main PID: 17893 (code=exited, status=0/SUCCESS)
