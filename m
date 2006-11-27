Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kARKYWKV022160
	for <linux-lvm@redhat.com>; Mon, 27 Nov 2006 15:34:32 -0500
Received: from web31808.mail.mud.yahoo.com (web31808.mail.mud.yahoo.com
	[68.142.207.71])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id kARKXdPQ020099
	for <linux-lvm@redhat.com>; Mon, 27 Nov 2006 15:33:39 -0500
Date: Mon, 27 Nov 2006 12:33:33 -0800 (PST)
From: Gerry Reno <grenoml@yahoo.com>
Subject: Re: [linux-lvm] LVM2: vgcfgrestore lvm behavior
In-Reply-To: <456B47EB.50905@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <300515.94662.qm@web31808.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

--- "Bryn M. Reeves" <breeves@redhat.com> wrote:
> 
> Hi Gerry,
> 
> Under LVM2, the --file option is only used when you are actually
> restoring metadata. For example:
> 
> vgcfgrestore --file /tmp/vg0_backup.vg vg0
> 
> Would restore the vg0 volume group's metadata from
> /tmp/vg0_backup.vg.
> 
> Currently, -l and -ll will only look at the backups in the
> /etc/lvm/archive directory.
> 
> Regards,
> Bryn.
> 

Bryn,
  The ability to use -l and -ll to review an LVM backup file is very
useful when used with -f.  I'm sure I'm not the only one that keeps LVM
backup files in locations other than /etc/lvm/archive.  What if you
lose /etc and are booted from rescue?  Can RedHat please restore the
lost functionality?  This was very useful under LVM1.

thx,
Gerry
