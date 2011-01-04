Received: from breeves.fab.redhat.com (breeves.fab.redhat.com [10.33.0.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p04GxG7l030826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2011 11:59:18 -0500
Message-ID: <4D2351E4.9060004@redhat.com>
Date: Tue, 04 Jan 2011 16:59:16 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <AANLkTi=fEi5wfgcOJpyXF6Nk6AWLVvC9sCYnP1NJcP+U@mail.gmail.com>
In-Reply-To: <AANLkTi=fEi5wfgcOJpyXF6Nk6AWLVvC9sCYnP1NJcP+U@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to use lvm with tmpfs
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

On 12/23/2010 01:44 PM, S U B A wrote:
> Hi members,
>                   Can tempfs be used with lvm, so that i can create a snapshot 
> of the filesystem mounted on the tmpfs. My actual goal is to create tmpfs and 
> sync all the files in that tmpfs to a remote storage. There can be file writes 
> during the sync ups, so i want to sync the partition without losing any info. 
> Creating an lvm partition can help in this scenario or should try a different 
> method?
> Thanks for your help,
> Suresh

Use a ramdisk or loopback devices.

Regards,
Bryn.
