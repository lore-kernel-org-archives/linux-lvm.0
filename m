From: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <4D4C0933.80107@redhat.com> <20110204155403.GD1535@redhat.com>
	<4D4C2B3A.3010704@redhat.com>
Date: Fri, 04 Feb 2011 15:02:58 -0500
In-Reply-To: <4D4C2B3A.3010704@redhat.com> (Bryn M. Reeves's message of "Fri, 
	04 Feb 2011 16:37:14 +0000")
Message-ID: <yq1zkqblg99.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2: zeroing free space
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
Cc: Mike Snitzer <snitzer@redhat.com>

>>>>> "Bryn" == Bryn M Reeves <bmr@redhat.com> writes:

Bryn> I suppose the ideal solution would be to detect whether the
Bryn> storage supports one or the other automatically but I don't know
Bryn> that there is a way to achieve this right now (TRIM/WRITE_SAME
Bryn> possibly but I think the zero page stuff is entirely transparent).

The problem with the zero-detection stuff is that it predates all the
thin provisioning goo in SCSI and we have no way of enabling
automatically. So it would have to be a manual per-device override.

However, all the vendors I have talked to prefer to use the
standards-based way now that it's there. And that's why I removed the
"write zeroes" code path before the original TP support went
upstream. It was there in the first few iterations of patches.

If people think it's a good idea I'll be happy to wire it back up. I
have a new set of TP patches going out shortly.

-- 
Martin K. Petersen	Oracle Linux Engineering
