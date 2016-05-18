Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4I4LDH9004077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 00:21:13 -0400
Received: from nm2-vm5.bullet.mail.ne1.yahoo.com
	(nm2-vm5.bullet.mail.ne1.yahoo.com [98.138.91.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CFC285542
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 04:21:12 +0000 (UTC)
Date: Wed, 18 May 2016 04:21:11 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <766997897.3926921.1463545271031.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <766997897.3926921.1463545271031.JavaMail.yahoo.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Xen wrote:

> > ATM user needs to write his own monitoring plugin tool to switch to
> > read-only volumes - it's really as easy as running bash script in 
> > loop.....
 
> needing to write  the same thing, while first having to acquire the knowledge
> of how to do  it.

Well, Xen immortalize your name in perpetuity by providing this bash script so it can be included in the tool set. Write less hundred line emails, and instead write more code for peer review. 


> I would probably be more than happy to write documentation at some point 

Except you can't be bothered to read source... Or spend the time to write the aforementioned script which will necessarily teach you a thing or two about the inner workings and events with their outcomes. When you put in the effort the community will no doubt appreciate your newly written documentation. Hop to it, eh?


> Debian/Ubuntu systems automatically activating the vg upon opening a 
> LUKS container, but then the OpenSUSE rescue environment not doing that.

Umm, "rescue environments" are deliberately designed to be more careful about what they do. Are you comparing a OpenSUSE rescue to a Deb/Ubuntu rescue? Or to a Deb "normal" environment? How long have you been around Linux that you are surprised that very different distributions might have different "defaults"?

> How to find out about vgchange -ay without having internet  access.........

man (8) vgchange perhaps? man -k lvm?
 
> So for me it has been a hard road to begin with and I am still learning.

They maybe less bitching, more experimenting, more practical experience, more man page reading, more knowledge retention, some B12 supplements perhaps? And stick to the bloody topic - nobody cares that you're put off by BugZilla's sparse interface.
 
