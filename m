Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25GCNbs007620
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 11:12:23 -0500
Received: from vpn-15-27.rdu.redhat.com (vpn-15-27.rdu.redhat.com
	[10.11.15.27])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	l25GCMkU006081
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 11:12:23 -0500
Subject: Re: [linux-lvm] On-disk and LVM internal metadata representation
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <45EC51C0.669D.00E9.0@novell.com>
References: <45EC51C0.669D.00E9.0@novell.com>
Date: Mon, 05 Mar 2007 11:12:23 -0500
Message-Id: <1173111143.4432.29.camel@linux-cxyg.rtp.netapp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2007-03-05 at 04:54 -0700, Nallammai S wrote:
> Hi,
> 
> Whats the difference between on-disk metadata and LVM  internal representation? How does LVM map between these two representations?
> 
> Thanks in advance.
> 
> Nallammai.S 
> 

It is different for LVM1 vs LVM2.

LVM2
- text-based on-disk metadata
- format-specific code in lib/format_text

LVM1
- binary on-disk metadata
- format-specific code in lib/format1

If you read the import*.[ch] and export*.[ch] files in the format
specific directories you will get an understanding of the mapping.  I
also found following the label_read() function to be helpful.
