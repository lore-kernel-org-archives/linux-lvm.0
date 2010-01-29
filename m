Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0TLIfdT010837
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 16:18:41 -0500
Received: from n22.bullet.mail.ukl.yahoo.com (n22.bullet.mail.ukl.yahoo.com
	[87.248.110.139])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o0TLIR7R019339
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 16:18:28 -0500
Message-ID: <65896.70817.qm@web87106.mail.ird.yahoo.com>
References: <824411.76784.qm@web87113.mail.ird.yahoo.com>
	<4B62A89E.5060201@redhat.com>
	<359398.31635.qm@web87102.mail.ird.yahoo.com>
	<4B632DE7.80606@redhat.com>
Date: Fri, 29 Jan 2010 21:18:27 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
In-Reply-To: <4B632DE7.80606@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] alternative to pvmove on root volume
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
To: Milan Broz <mbroz@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

> On 01/29/2010 07:26 PM, chris procter wrote:

> > Unfortuately this project is mostly RHEL4 boxes (its an old SAN, nothing new 
> has been added to it in a couple of years)
> > and so thats what I've been testing with (RHEL4.5 to be precise) so if you 
> really want me too
> > I'll file a bug but I'm pretty sure it will just get closed with "upgrade to a 
> modern version of lvm" :)
> 
> Ah so. Pretty old lvm2 version there. 

Yep, but upgrading means all sorts of risk assessments and revalidating of custom and third party code. I'd much prefer just to reinstall the whole thing onto the new san as RHEL5.4 but thats not going to happen this year :(


>But both RHEL5 and RHEL4 share the same codebase, just upgrade to RHEL4.8.
> (you can even use statically linked lvm binary from newer version if you cannot 
> upgrade...)
> 
> Milan

Using a version of lvm.static copied over is not something I'd considered, but it sounds like a much nicer approach then mine. I'll test it out and report back

Thanks a lot :)

chris


      
