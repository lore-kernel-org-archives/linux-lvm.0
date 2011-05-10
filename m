Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4AESRMO011042
	for <linux-lvm@redhat.com>; Tue, 10 May 2011 10:28:27 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.123])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4AESNlo010388
	for <linux-lvm@redhat.com>; Tue, 10 May 2011 10:28:24 -0400
Message-ID: <4DC94B82.1090408@cfl.rr.com>
Date: Tue, 10 May 2011 10:28:18 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4DC40BFD.3080408@cfl.rr.com> <20110506152129.GA25531@redhat.com>
In-Reply-To: <20110506152129.GA25531@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] getting pe_start right
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>

On 5/6/2011 11:21 AM, Mike Snitzer wrote:
> chances are lvm2's data_alignment_detection will shift the data start to
> the start of the next full stripe of the raid5.

That appears to be what was going on.  I found entries in lvm.conf to 
enable/disable autodetection of the raid stripe width and turned it off.

> You should be able to specify the old start with:
>
> --dataalignment 192k --dataalignmentoffset 0
>
> (--dataalignmentoffset 0 likely isn't needed, but it just overrides
> lvm2's data_alignment_offset detection if it just so happens that
> raid5 has alignment_offset!=0)

The command line switches did not appear to override the autodetection; 
I had to shut it off in the conf file.  Is this a bug?
