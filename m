Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MGSb64026281
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:28:37 -0400
Received: from smtp01.atlngahp.sys.nuvox.net (smtp-out1.atlngahp.sys.nuvox.net
	[70.43.63.18])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MGSCGr022821
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:28:23 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp01.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3MGSACR014348
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:28:10 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 9AE2E366C72
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 12:28:10 -0400 (EDT)
Message-ID: <480E121A.7020100@Media-Brokers.com>
Date: Tue, 22 Apr 2008 12:28:10 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot question...
References: <480DBE54.1090406@Media-Brokers.com>
	<chaz20080422104744.GI20413@artesyncp.com>
In-Reply-To: <chaz20080422104744.GI20413@artesyncp.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 4/22/2008, Stephane Chazelas (stephane.chazelas@emerson.com) wrote:
> When you read from your original volume (that has been changed
> to be of "snapshot-origin" type), you actually read from the
> "real" volume (the original version of the original volume), but
> when you write to it, the system makes sure that unless it has
> been done already, the block you're modifying are being copied
> first from the "real" volume to COW volume before being modified
> in the "real" volume.
> 
> So to sum up, the "snapshot" volume you are creating is a
> "virtual" volume that is a front end to both the snapshot
> storage volume ("COW") and the original real volume ("real").
> 
> Hope this clarifies a bit,

Thanks for trying, but no, that just made my head hurt...

;)

Seriously... if the snapshot volume that I'm creating is a front end to 
BOTH, when I back it up, I guess LVM just 'knows' that I mean to backup 
the 'original'?

Is there a graphical outline of how this works? I seem to do better with 
visualizations...

-- 

Best regards,

Charles
