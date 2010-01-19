Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0JIpYDR006760
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 13:51:34 -0500
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.211.179])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0JIpNA8020567
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 13:51:24 -0500
Received: by ywh9 with SMTP id 9so362992ywh.19
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 10:51:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20100119033212.GA18351@us.ibm.com>
References: <42784f261001181815y340170dbs4775230080358bc3@mail.gmail.com>
	<20100119033212.GA18351@us.ibm.com>
Date: Tue, 19 Jan 2010 10:51:23 -0800
Message-ID: <42784f261001191051o377ba602hf063e01716b1f481@mail.gmail.com>
From: Jason Dusek <jason.dusek@gmail.com>
Subject: Re: [linux-lvm] Mounting an LVM disk image.
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

2010/01/18  <malahal@us.ibm.com>:
> [...]
> You may be running into this problem:
> http://liorkaplan.wordpress.com/2008/07/25/when-lvm-volume-groups-collide/
>
> And this method may work, although written for something else:
> http://thread.gmane.org/gmane.linux.lvm.general/9628
>
> It is probably a lot easier to with a system that doesn't have
> VolGroup00 to begin with! [...] If you can't avoid it, you may
> try renaming the volume group using uuid or the above
> mentioned link that is written for cloning a volume group.

  I am happy to report that rename by UUID does work (although,
  from the above links, you would think it did not):

   :; vgrename aaaaaa-bbbb-cccc-dddd-eeee-ffff-gggggg VolGroupForeign
    Volume group "VolGroup00" successfully renamed to "VolGroupForeign"

  Although it seems to be a best practice, naming volume groups
  in a unique way isn't done by default on CentOS -- and I
  inherited a bunch of CentOS Xen instances on a CentOS Dom0...

  Thanks for you help everyone,

--
Jason Dusek
