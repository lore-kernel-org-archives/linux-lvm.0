Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBD8nvr20354
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 03:49:57 -0500
Received: from web52503.mail.yahoo.com (web52503.mail.yahoo.com
	[206.190.39.124])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iBD8ntlb018864
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 03:49:55 -0500
Message-ID: <20041213084935.61935.qmail@web52503.mail.yahoo.com>
Date: Mon, 13 Dec 2004 00:49:35 -0800 (PST)
From: johon Doe <johond@yahoo.com>
Subject: Re: [linux-lvm] duplicate pv.
In-Reply-To: <20041212173549.GC3853@ppc.in-berlin.de>
MIME-Version: 1.0
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


--- Philipp Schmidt <philipp@ppc.in-berlin.de> wrote:

> On 2004-12-12 17:12:30 +0000, Alasdair G Kergon
> <agk@redhat.com>
> wrote in
> <20041212171230.GL11338@agk.surrey.redhat.com>:
> > On Sat, Dec 11, 2004 at 10:38:56PM +0000, Alasdair
> G Kergon wrote:
> > > On Sat, Dec 11, 2004 at 02:18:29PM +0100,
> Philipp Schmidt wrote:
> > > > look t your /etc/lvm/lvm.conf, have you set
> md_component_detection = 1?
> > > > i wonder why this isn't set by default, who
> needs to use md compnents as
> > > > singel pv?
> > > It *is* set to 1 by default i.e. if you don't
> specify 
> > > a different value for it in the conf file.
> >  
> > I believe the Debian distribution may have set it
> to 0 at one point because
> > of problems in certain configurations: these cases
> should be fixed by 2.00.29.
> 
> ok, i use debian here and it had cost me one day to
> find this bad default
> config... 
> 

hi Phils,
I have Debian and I changed the value from 0 to 1 and
viceversa, but I have the same problem.
Any other ideas ?
thx :)



		
__________________________________ 
Do you Yahoo!? 
The all-new My Yahoo! - What will yours do?
http://my.yahoo.com 
