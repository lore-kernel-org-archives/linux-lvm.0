Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1OFvVdS020143
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2012 10:57:31 -0500
Received: from mail-pz0-f46.google.com (mail-pz0-f46.google.com
	[209.85.210.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1OFvVgd014692
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2012 10:57:31 -0500
Received: by daed14 with SMTP id d14so3711056dae.33
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2012 07:57:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5dd15783-9200-4ed0-b746-32a812210f77@email.android.com>
References: <20120221102932.19eb3218@bettercgi.com>
	<CAOAgVpyfEApbLRFr1-s6UvAsa8yO0MSOcYDgPWXBv2FRoD+Ntg@mail.gmail.com>
	<5dd15783-9200-4ed0-b746-32a812210f77@email.android.com>
Date: Fri, 24 Feb 2012 09:57:30 -0600
Message-ID: <CAOAgVpyHgVjaubZGH3kwfBqiYyU7vBNCBHmQjPMnrT_F6otZbQ@mail.gmail.com>
From: Les Mikesell <lesmikesell@gmail.com>
Subject: Re: [linux-lvm] mirror_region_size default: 4096 six times faster
 than 512?
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

On Thu, Feb 23, 2012 at 10:46 AM, Ray Morris <support@bettercgi.com> wrote:
> 512 byte sector consumer SATA drives from Seagate and Hitachi. Drives
> attached to a 9560 RAID card exhibited more difference than drives in a
> different system attached to the motherboard directly. As I mentioned, I
> haven't done extensive or highly scientific testing, but in general, across
> various hardware using various software, copying chinks of a few MBs seems
> to always beat copying bytes or KB per chunk.


What kind of RAID?  Anything that involves parity is going to require
small writes to read and merge the new data into blocks and rewrite
the parity.

-- 
  Les Mikesell
    lesmikesell@gmail.com
