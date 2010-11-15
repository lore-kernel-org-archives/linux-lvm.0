Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAF16YD4000678
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 20:06:34 -0500
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAF16K3H024883
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 20:06:21 -0500
Received: by fxm6 with SMTP id 6so1419646fxm.33
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 17:06:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <606057079.20101114024527@snet.sk>
References: <606057079.20101114024527@snet.sk>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Sun, 14 Nov 2010 19:06:00 -0600
Message-ID: <AANLkTi=TdgXybQ_QREODKdrsyamot_cAHnrywom4bdxu@mail.gmail.com>
Subject: Re: [linux-lvm] LVM volume umask change
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

On Sat, Nov 13, 2010 at 7:45 PM, Marek Soha <marek@snet.sk> wrote:
> When I create file/directory in LVM volume, it is created with
> permissions (mode) 666. I need to get 644.
> I changed umask in /etc/lvm/lvm.conf, but it did not helped.
> Any ideas?

Curious.  What is the filesystem of your logical volume?
