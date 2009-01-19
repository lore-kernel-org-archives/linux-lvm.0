Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0JAlQds010312
	for <linux-lvm@redhat.com>; Mon, 19 Jan 2009 05:47:26 -0500
Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id n0JAlOlG007670
	for <linux-lvm@redhat.com>; Mon, 19 Jan 2009 05:47:24 -0500
Message-ID: <49745A24.4090703@redhat.com>
Date: Mon, 19 Jan 2009 10:47:00 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Device-mapper
References: <BAY107-W1078A92CE6563826D5FD6C8FD30@phx.gbl>
In-Reply-To: <BAY107-W1078A92CE6563826D5FD6C8FD30@phx.gbl>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Mark Reardon wrote:
> Hello All,
> 
> Has anybody ever come across this type of error before, when trying to extend a logical volume?
> 
> The LV will not extend.  Any ideas?
> 
> Device-mapper: reload iocts failed: invalid argument

Post the complete output of the command (with -vvv) and any messages 
that appear in dmesg at the time of the error.

To avoid sending large files to the list, use a service like pastebin 
and post the URL here.

Regards,
Bryn.
