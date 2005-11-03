Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA3DZ3V14833
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 08:35:03 -0500
Received: from storm.itahost.com (storm.itahost.com [83.148.74.3])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jA3DZ1j1001276
	for <linux-lvm@redhat.com>; Thu, 3 Nov 2005 08:35:02 -0500
From: Delian Krustev <linux-lvm@krustev.net>
Subject: Re: [linux-lvm] Unable to remove a pvmove LV
Date: Thu, 3 Nov 2005 15:34:55 +0200
References: <200511012135.50701.krustev@krustev.net>
	<436955C1.5090905@svs.gsfc.nasa.gov>
In-Reply-To: <436955C1.5090905@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Message-Id: <200511031534.55794.linux-lvm@krustev.net>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thursday 03 November 2005 02:11, Randall A. Jones wrote:
> Another way to remove a misbehaving pvmove logical volume is to restore
> to a metadata config state previous to the pvmove command.  The command
> to do this is vgcfgrestore.  This is only possible if you haven't
> modified the volume group or the logical volume in a way that might
> cause you to lose something important.  For example if you created a new
> LV and put a filesystem on it *after* a failed or uncleaned pvmove, you
> CANNOT restore to the config before the pvmove or you'll lose your new LV.

Unfortunately I've removed several PVs from it to leave the problematic
cotroller with two HDDs only(which was proven to work).

Cheers,
Delian
