Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1AJABi32186
	for <linux-lvm@redhat.com>; Tue, 10 Feb 2004 14:10:11 -0500
From: Andres Salomon <dilinger@voxel.net>
Message-ID: <pan.2004.02.10.19.09.30.16834@voxel.net>
References: <1076349070.25356.7.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: lvm2_createinitrd
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 11 17:06:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Mon, 09 Feb 2004 12:51:10 -0500, Jeffrey Layton wrote:

> I tried to send this to the mailing list this weekend, but it didn't go
> through for some reason. Maybe the list doesn't like attachments?
> 
> In any case, I've made a first pass at an lvm2create_initrd script. It's
> essentially a modified version of the lvm1 script, with some info borrowed
> from Christope Saout's LVM2 initrd image.
> 
> It probably needs some more work, but is currently at the 'works for me'
> stage. You can download it from my subversion repository at:
> 
> http://poochiereds.net/svn/lvm2create_initrd/
> 
> Patches are welcome. Please send them on if you have any to contribute!
> 
> Enjoy,
> Jeff
> 
> 
> _______________________________________________ linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/


I've been meaning to look into this, but other things have taken priority.
Anyways, a user sent me an initial implementation that you might find
useful.  I forwarded it here:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=222277

Sooner or later I'll get around to getting this working (whether upstream
or in debian) if no one else does.
