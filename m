Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p46FLUBk016694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 6 May 2011 11:21:31 -0400
Date: Fri, 6 May 2011 11:21:30 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110506152129.GA25531@redhat.com>
References: <4DC40BFD.3080408@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4DC40BFD.3080408@cfl.rr.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, May 06 2011 at 10:55am -0400,
Phillip Susi <psusi@cfl.rr.com> wrote:

> While trying to convert my mdadm raid5 array from metadata format
> 0.9 to 1.0, I forgot to specify the version and it defaulted to 1.2,
> which damaged the lvm metadata.  After correcting mdadm to 1.0, I
> decided to try to recreate the LVM after managing to locate the
> volume descriptions in the metadata after manually dumping it.
> 
> The problem I now have is that pvcreate will not use the same
> pe_start as before.  It was 384 and it is now 3072.  I tried using
> --metadatasize 192k --dataalignmentsize 0 and it did not help.  What
> gives?

Would be quite helpful if you shared kernel and lvm2 version info...

chances are lvm2's data_alignment_detection will shift the data start to
the start of the next full stripe of the raid5.

You should be able to specify the old start with:

--dataalignment 192k --dataalignmentoffset 0

(--dataalignmentoffset 0 likely isn't needed, but it just overrides
lvm2's data_alignment_offset detection if it just so happens that
raid5 has alignment_offset!=0)
