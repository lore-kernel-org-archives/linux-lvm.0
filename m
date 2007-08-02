Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7226O4X007596
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 22:06:29 -0400
Received: from dubh.id.au ([202.45.122.140])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7226KG0002903
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 22:06:23 -0400
Date: Thu, 2 Aug 2007 10:06:17 +0800
From: Nigel Duff <nigel-lvm@dubh.id.au>
Subject: Re: [linux-lvm] Missing logical volume
Message-ID: <20070802020617.GA6873@dubh.id.au>
References: <20070801072738.GA9466@dubh.id.au>
	<366C0458-4DED-43B6-B639-99252B03BAA3@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <366C0458-4DED-43B6-B639-99252B03BAA3@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
	
On Wed, Aug 01, 2007 at 10:14:28AM -0500, Jonathan Brassow wrote:
> 
> I think you need to figure out what happened to the missing disk.  If  
> that's gone, so is your data.  Nothing you've described so far has  
> given me reason to believe the drive shouldn't be there.  So, I'm  
> assuming device failure...

I was thinking that LVM could handle the loss of a drive without losing the
whole volume. The fact that pvscan was showing all the drives still
belonging to the volume group was throwing me.

Thanks for the help,

Nigel
