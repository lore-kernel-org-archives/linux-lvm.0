Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8RFghMn025605
	for <linux-lvm@redhat.com>; Fri, 27 Sep 2013 11:42:43 -0400
Received: from mail.gathman.org (wsip-70-169-160-205.dc.dc.cox.net
	[70.169.160.205])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8RFggHh017175
	for <linux-lvm@redhat.com>; Fri, 27 Sep 2013 11:42:42 -0400
Received: from silver.gathman.org ([IPv6:2001:470:8:809:11::1015])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id r8RFgqKT022628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 27 Sep 2013 11:42:53 -0400
Message-ID: <5245A770.5000402@gathman.org>
Date: Fri, 27 Sep 2013 11:42:40 -0400
From: Stuart Gathman <stuart@gathman.org>
MIME-Version: 1.0
References: <CAHuLeSktKr++TH6cqsaHYS9CEDNCm9DVYAy=f8nWPkz8vEpjFw@mail.gmail.com>
In-Reply-To: <CAHuLeSktKr++TH6cqsaHYS9CEDNCm9DVYAy=f8nWPkz8vEpjFw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Continue an interrupted mirror sync?
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
To: linux-lvm@redhat.com

On 09/27/2013 05:26 AM, Justin Lee wrote:
> Hello,
>
> I would like to know If a mirror sync process is interrupted by some
> uncontrollable reason, is it possible to continue the sync process
> near the point where it was interrupted?
>
> Volume mirroring may take a long time to be done, if the connection of
> the storage device is over an unreliable channel (such as SAN, iSCSI
> or Fibre Channel) it is possible that ongoing sync will be interrupted
> over and over again due to frequent connection loss so that the sync
> will never complete...
>
> Has LVM existing solutions for the issue? Or any suggestion? Thank you!
Pretty much the entire purpose of the mirror log is to accomplish this 
(track which blocks are in sync).  Is this a real problem you've 
encountered (mirror log is broken), or a theoretical one?  If you 
created a mirror without a log, then yes, it pretty much has to start 
over each time.  A compromise might be to keep the log in memory.  This 
would handle SAN storage going up and down, but would have to start over 
after a reboot.
