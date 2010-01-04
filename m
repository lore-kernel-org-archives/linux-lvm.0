Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o04Cq7Tq012910
	for <linux-lvm@redhat.com>; Mon, 4 Jan 2010 07:52:08 -0500
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <29ae894c0912300352k29bbd06dha89b7dd0045c550@mail.gmail.com>
References: <4B3B28E5.5030208@tele2.com> <4B3B2C05.1070902@tele2.com>
	<29ae894c0912300352k29bbd06dha89b7dd0045c550@mail.gmail.com>
Date: Mon, 04 Jan 2010 12:54:18 +0000
Message-Id: <1262609658.18517.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM preference for multipath verses disk/by-id/scsi
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

On Wed, 2009-12-30 at 12:52 +0100, brem belguebli wrote:
> Hi,
> 
> see man 5 lvm.conf there is an option called preferred_names which is
> well explained
> 
> It'll instruct lvm to use the preferred_names you configured in the
> lvm.conf file if they exist
> 
> ie : preferred_names = "/dev/mpath/" will use /dev/mpath/XXX instead
> of /dev/mapper/XXX

It's best not to use the symlinks in /dev/mpath - they are not always
reliable. Use the device nodes created in /dev/mapper instead.

Regards,
Bryn.
