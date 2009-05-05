Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n45LFqtQ028140
	for <linux-lvm@redhat.com>; Tue, 5 May 2009 17:15:52 -0400
Received: from mail-ew0-f170.google.com (mail-ew0-f170.google.com
	[209.85.219.170])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n45LFcIw019149
	for <linux-lvm@redhat.com>; Tue, 5 May 2009 17:15:39 -0400
Received: by ewy18 with SMTP id 18so5275196ewy.3
	for <linux-lvm@redhat.com>; Tue, 05 May 2009 14:15:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49DFA17C.20008@verizon.net>
References: <49DFA17C.20008@verizon.net>
Date: Tue, 5 May 2009 23:15:38 +0200
Message-ID: <81c921f30905051415h4e47e78cucef9a979d913c322@mail.gmail.com>
Subject: Re: [linux-lvm] mount LV's from an old drive
From: Javier Barroso <javibarroso@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Apr 10, 2009 at 9:43 PM, Gerry Reno <greno@verizon.net> wrote:
> We have a new server up and running. �We installed a fresh OS. �Now we find
> we are in need of some files on an old drive that was 3 LV's over 3 md
> arrays as PV's. �Is it still possible to read data from this drive by
> plugging it into the new server? �How can we do this?
Perhaps it is too late to reply, but sure you can. Reconstruct md
devices (I think it is possible if you known the layout) and then do
lvscan, you should get then your lvs

Regards,
