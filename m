Received: from localhost (vpn1-7-172.ams2.redhat.com [10.36.7.172])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q9IDZPOa015129
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 09:35:25 -0400
Date: Thu, 18 Oct 2012 14:35:24 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20121018133523.GA24912@ubuntu>
References: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
Subject: Re: [linux-lvm] how to recover after thin pool metadata did fill up?
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

On Wed, Oct 17, 2012 at 11:21:35PM +0300, Andres Toomsalu wrote:
> Hi,
> 
> I'm aware that thin provisioning is not yet production ready (no metadata resize) - but is there a way to recover from thin pool failure when pool metadata was filled up?

We don't support online resizing yet.  But you can do this offline by following these rough steps:

i) dump your metadata device to a text file using thin_dump.  You may 
   want to eyeball this to see if it's what you expect.

ii) Create a new metadata lv.  Better to create a completely new one
    than try and extend the old one and risk losing data if you make a
    mistake.

iii) Use thin_restore to write the dump to the new metadata volume

iv) Tell lvm to use the new metadata area for your pool.  I'm not sure how to do this last step.  Kabi can you help please?

- Joe
